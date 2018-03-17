module Domain where

import Miso.String

data UserProfile = UserProfile
  { userProfileName :: MisoString
  , userProfilePhoto :: MisoString
  } deriving (Show, Eq)
