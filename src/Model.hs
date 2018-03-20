module Model where

import Miso

data Model = Model
  { uri :: URI
  , isUserLoggedIn :: Bool
  } deriving (Show, Eq)

defaultModel :: URI -> Model
defaultModel uri = Model {uri = uri, isUserLoggedIn = False}

instance HasURI Model where
  lensURI = makeLens getter setter
    where
      getter = uri
      setter m u = m {uri = u}
