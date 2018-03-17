module Model where

import Domain

import Miso

data Model = Model
  { uri :: URI
  , userProfile :: Maybe UserProfile
  } deriving (Show, Eq)

initModel :: URI -> Model
initModel uri = Model { uri = uri, userProfile = Nothing }

instance HasURI Model where
  lensURI = makeLens getter setter
    where
      getter = uri
      setter m u = m {uri = u}
