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

import View.Root
import View.HomePageComponent
import View.CoursePageComponent

render :: Model -> View Action
render model = either (const notFoundPage) id $ result model
  where result = runRoute (Proxy :: Proxy API) handlers

handlers :: (Model -> View Action) :<|> (String -> Model -> View Action)
handlers = homePage :<|> coursePage

homePage :: Model -> View Action
homePage model = root model $ homePageComponent model

coursePage :: String -> Model -> View Action
coursePage name model = root model $ coursePageComponent name model
