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

type LoginSignUp = "#loginsignup" :> View Action

type Courses = "#courses" :> View Action

type Course = "#course" :> Capture "courseId" CourseId :> View Action

type API = Home :<|> LoginSignUp :<|> Courses :<|> Course

home = Proxy :: Proxy Home

loginsignup = Proxy :: Proxy LoginSignUp

courses = Proxy :: Proxy Courses

course = Proxy :: Proxy Course

api = Proxy :: Proxy API

gotoHomePage :: Action
gotoHomePage = ChangeURI (safeLink api home)

gotoLoginSignUpPage :: Action
gotoLoginSignUpPage = ChangeURI (safeLink api loginsignup)

gotoCoursesPage :: Action
gotoCoursesPage = ChangeURI (safeLink api courses)

gotoCoursePage :: CourseId -> Action
gotoCoursePage courseId = ChangeURI (safeLink api course courseId)
