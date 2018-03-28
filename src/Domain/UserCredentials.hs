{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE ScopedTypeVariables #-}
{-# LANGUAGE TypeOperators #-}
{-# LANGUAGE DataKinds #-}
{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE TypeFamilies #-}
{-# LANGUAGE DeriveGeneric, DeriveAnyClass #-}
{-# LANGUAGE StandaloneDeriving #-}

module Domain.UserCredentials where

import Data.Aeson
import Domain.UserEmail
import Domain.UserPassword
import GHC.Generics

data UserCredentials = UserCredentials
  { email :: UserEmail
  , password :: UserPassword
  } deriving (Eq, Show, Generic, FromJSON, ToJSON)
