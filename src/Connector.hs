{-# LANGUAGE ScopedTypeVariables #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TypeOperators #-}
{-# LANGUAGE DataKinds #-}
{-# LANGUAGE TypeFamilies #-}
{-# LANGUAGE CPP #-}
module Connector where

import Action
import Data.Proxy
import Miso
import Miso.String
import Model
import Routes
import Servant.API

render :: Model -> View Action
render model = either (const the404) id $ result model
  where
    result = runRoute (Proxy :: Proxy API) handlers

handlers :: (Model -> View Action) :<|> (String -> Model -> View Action)
handlers = homePage :<|> personPage


homePage (_ :: Model) = div_ [] [div_ [] [text "home"], button_ [onClick $ gotoPersonPage "foo"] [text "go about"]]

personPage name (_ :: Model) =
  div_ [] [div_ [] [text $ ms ("awesome! " ++ show name)], button_ [onClick goHomePage] [text "go home"]]

the404 = div_ [] [text "the 404 :(", button_ [onClick goHomePage] [text "go home"]]
