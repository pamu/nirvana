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
import View.NotFound

import View.HomePage
import View.CoursePage

render :: Model -> View Action
render model = either (const notFoundPage) id $ result model
  where result = runRoute (Proxy :: Proxy API) handlers

handlers :: (Model -> View Action) :<|> (String -> Model -> View Action)
handlers = homePage :<|> coursePage
