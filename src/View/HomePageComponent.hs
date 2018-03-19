{-# LANGUAGE CPP #-}
{-# LANGUAGE DataKinds #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE ScopedTypeVariables #-}
{-# LANGUAGE TypeFamilies #-}
{-# LANGUAGE TypeOperators #-}

module View.HomePageComponent where

import Action
import Data.Proxy
import Miso
import Miso.String
import Model
import Routes
import Servant.API

homePageComponent :: Model -> View Action
homePageComponent (_ :: Model) =
  div_ [] [div_ [] [text "home"], button_ [class_ "btn", onClick $ gotoCoursePage "foo"] [text "go about"]]
