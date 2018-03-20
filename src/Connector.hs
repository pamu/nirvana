{-# LANGUAGE CPP #-}
{-# LANGUAGE DataKinds #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE ScopedTypeVariables #-}
{-# LANGUAGE TypeFamilies #-}
{-# LANGUAGE TypeOperators #-}

module Connector where

import Action
import Data.Proxy
import Miso
import Miso.String
import Model
import Routes
import Servant.API
import View.NotFound

import Domain.CourseId

import View.CoursePageComponent
import View.HomePageComponent
import View.LandingPageComponent
import View.LoginPageComponent
import View.Root
import View.SignUpPageComponent

render :: Model -> View Action
render model = either (const notFoundPage) id $ result model
  where
    result = runRoute (Proxy :: Proxy API) handlers

handlers ::
     (Model -> View Action) :<|> (Model -> View Action) :<|> (Model -> View Action) :<|> (Model -> View Action) :<|> (CourseId -> Model -> View Action)
handlers =
  homePage :<|> loginPage :<|> signUpPage :<|> coursesPage :<|> coursePage

homePage :: Model -> View Action
homePage model = root model $ homePageComponent model

loginPage :: Model -> View Action
loginPage model = root model $ loginPageComponent model

signUpPage :: Model -> View Action
signUpPage model = root model $ signUpPageComponent model

coursesPage :: Model -> View Action
coursesPage model = error ("todo")

coursePage :: CourseId -> Model -> View Action
coursePage name model = root model $ coursePageComponent name model
