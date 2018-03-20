{-# LANGUAGE CPP #-}
{-# LANGUAGE DataKinds #-}
{-# LANGUAGE ScopedTypeVariables #-}
{-# LANGUAGE TypeFamilies #-}
{-# LANGUAGE TypeOperators #-}

module Routes where

import Action
import Data.Proxy
import Miso
import Servant.API

import Domain.CourseId

type Home = View Action

type Login = "#login" :> View Action

type SignUp = "#signup" :> View Action

type Courses = "#courses" :> View Action

type Course = "#course" :> Capture "courseId" CourseId :> View Action

type API = Home :<|> Login :<|> SignUp :<|> Courses :<|> Course

home = Proxy :: Proxy Home

login = Proxy :: Proxy Login

signUp = Proxy :: Proxy SignUp

courses = Proxy :: Proxy Courses

course = Proxy :: Proxy Course

api = Proxy :: Proxy API

gotoHomePage :: Action
gotoHomePage = ChangeURI (safeLink api home)

gotoLoginPage :: Action
gotoLoginPage = ChangeURI (safeLink api login)

gotoSignUpPage :: Action
gotoSignUpPage = ChangeURI (safeLink api signUp)

gotoCoursesPage :: Action
gotoCoursesPage = ChangeURI (safeLink api courses)

gotoCoursePage :: CourseId -> Action
gotoCoursePage courseId = ChangeURI (safeLink api course courseId)
