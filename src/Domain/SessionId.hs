{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE ScopedTypeVariables #-}
{-# LANGUAGE TypeOperators #-}
{-# LANGUAGE DataKinds #-}
{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE TypeFamilies #-}
{-# LANGUAGE DeriveGeneric, DeriveAnyClass #-}
{-# LANGUAGE StandaloneDeriving #-}

module Domain.SessionId where

import Data.Aeson
import GHC.Generics

newtype SessionId = SessionId
  { id :: String
  } deriving (Eq, Show, Generic, FromJSON, ToJSON)
