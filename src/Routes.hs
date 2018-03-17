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

type API = Home :<|> Person

type Home = View Action

type Person = "#persons" :> Capture "personName" String :> View Action

goHomePage :: Action
goHomePage = ChangeURI (safeLink api home)

gotoPersonPage :: String -> Action
gotoPersonPage name = ChangeURI (safeLink api person name)

home = Proxy :: Proxy Home

person = Proxy :: Proxy Person

api = Proxy :: Proxy API
