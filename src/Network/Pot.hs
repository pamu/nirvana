{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE ScopedTypeVariables #-}
{-# LANGUAGE TypeOperators #-}
{-# LANGUAGE DataKinds #-}
{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE TypeFamilies #-}
{-# LANGUAGE DeriveGeneric, DeriveAnyClass #-}

module Network.Pot where

import Data.Aeson
import Data.Aeson.Types
import Data.Map
import GHC.Generics

newtype ValidationErrors =
  ValidationError [Map String [String]]
  deriving (Eq, Show, Generic, FromJSON, ToJSON)

data Pot a
  = Empty
  | Pending
  | Unavailable String
  | Ready a
  | ValidationFailed ValidationErrors
  | Failed String
  deriving (Show, Eq, Generic, FromJSON, ToJSON)

isEmpty :: Pot a -> Bool
isEmpty Empty = True
isEmpty _ = False

isPending :: Pot a -> Bool
isPending Pending = True
isPending _ = False

isUnavailable :: Pot a -> Bool
isUnavailable (Unavailable _) = True
isUnavailable _ = False
