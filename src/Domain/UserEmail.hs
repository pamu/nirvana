{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE ScopedTypeVariables #-}
{-# LANGUAGE TypeOperators #-}
{-# LANGUAGE DataKinds #-}
{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE TypeFamilies #-}
{-# LANGUAGE DeriveGeneric, DeriveAnyClass #-}
{-# LANGUAGE StandaloneDeriving #-}

module Domain.UserEmail where

import Data.Aeson
import GHC.Generics
import Miso.String

newtype UserEmail =
  UserEmail MisoString
  deriving (Eq, Show, Generic, ToJSON, FromJSON)
