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
import View.CoursesPageComponent
import View.HomePageComponent
import View.LandingPageComponent
import View.LoginSignUpPageComponent
import View.Root

render :: Model -> View Action
render model = either (const $ notFoundPage model) id $ result model
  where
    result :: Model -> Either RoutingError (View Action)
    result = runRoute (Proxy :: Proxy API) handlers

notFoundPage :: Model -> View Action
notFoundPage model = root model $ notFoundPageComponent model

--- type for handlers function is too long. So, lets ignore declaring the type.
handlers = homePage :<|> loginSignUpPage :<|> coursesPage :<|> coursePage

homePage :: Model -> View Action
homePage model = root model $ homePageComponent model

loginSignUpPage :: Model -> View Action
loginSignUpPage model = root model $ loginSignUpPageComponent model

coursesPage :: Model -> View Action
coursesPage model = root model $ coursesPageComponent model

coursePage :: CourseId -> Model -> View Action
coursePage courseId model = root model $ coursePageComponent courseId model
