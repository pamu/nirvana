module Model where

import Miso

data Model = Model
  { uri :: URI
  , userLoggedIn :: Bool
  , showLoader :: Bool
  , showDailog :: Bool
  } deriving (Show, Eq)

defaultModel :: URI -> Model
defaultModel uri =
  Model
  {uri = uri, userLoggedIn = False, showLoader = False, showDailog = False}

instance HasURI Model where
  lensURI = makeLens getter setter
    where
      getter = uri
      setter m u = m {uri = u}
