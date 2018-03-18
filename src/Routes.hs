{-# LANGUAGE ScopedTypeVariables #-}
{-# LANGUAGE TypeOperators #-}
{-# LANGUAGE DataKinds #-}
{-# LANGUAGE TypeFamilies #-}
{-# LANGUAGE CPP #-}

module Routes where

import Servant.API
import Data.Proxy
import Miso
import Action

type API = Home :<|> Course

type Home = View Action

type Course = "#courses" :> Capture "courseName" String :> View Action

goHomePage :: Action
goHomePage = ChangeURI (safeLink api home)

gotoCoursePage :: String -> Action
gotoCoursePage name = ChangeURI (safeLink api course name)

home = Proxy :: Proxy Home

course = Proxy :: Proxy Course

api = Proxy :: Proxy API
