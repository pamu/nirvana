{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE ScopedTypeVariables #-}
{-# LANGUAGE TypeOperators #-}
{-# LANGUAGE DataKinds #-}
{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE TypeFamilies #-}
{-# LANGUAGE DeriveGeneric, DeriveAnyClass #-}

module Network.ServerRes where

import Data.Aeson
import Data.Aeson.Types
import Data.Map
import GHC.Generics

newtype ValidationError =
  ValidationError [Map String [String]]
  deriving (Eq, Show, Generic)

data ServerRes a
  = Ok a
  | BadRequest ValidationError
  | InternalServerError String
  deriving (Show, Eq, Generic)
