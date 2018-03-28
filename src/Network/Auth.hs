{-# LANGUAGE CPP #-}
{-# LANGUAGE DataKinds #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE ScopedTypeVariables #-}
{-# LANGUAGE TypeFamilies #-}
{-# LANGUAGE TypeOperators #-}

module Network.Auth where

import Action
import Data.Proxy
import Domain.CourseId
import Miso
import Miso.String
import Model
import Network.ServerAPI
import Routes
import Servant.API

import Prelude hiding (id)

import qualified Domain.UserCredentials as UC

import Domain.SessionId
import Network.AppReq
import Network.AppRes

login :: UC.UserCredentials -> IO (Either String SessionId)
login credentials = do
  (value :: (Either String (AppRes SessionId))) <-
    (post credentials loginURL Nothing)
  let result =
        case value of
          Left str -> Left str
          Right _ -> Right $ SessionId {id = ""}
  pure result
