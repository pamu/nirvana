{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE ScopedTypeVariables #-}
{-# LANGUAGE TypeOperators #-}
{-# LANGUAGE DataKinds #-}
{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE TypeFamilies #-}
{-# LANGUAGE DeriveGeneric, DeriveAnyClass #-}
{-# LANGUAGE StandaloneDeriving #-}

module Domain.UserPassword where

import Data.Aeson
import GHC.Generics
import Miso.String

newtype UserPassword =
  UserPassword MisoString
  deriving (Eq, Show, Generic, ToJSON, FromJSON)
