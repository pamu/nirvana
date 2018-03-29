module Model where

import Domain.UserCredentials
import Domain.UserEmail
import Domain.UserPassword
import Miso
import Miso.String (MisoString)
import qualified Miso.String as S

data Model = Model
  { uri :: URI
  , userSession :: Maybe String
  , showLoader :: Bool
  , showDailog :: Maybe String
  , userCredentials :: UserCredentials
  } deriving (Show, Eq)

defaultModel :: URI -> Model
defaultModel uri =
  Model
  { uri = uri
  , userSession = Nothing
  , showLoader = False
  , showDailog = Nothing
  , userCredentials =
      UserCredentials
      {email = UserEmail $ S.pack "", password = UserPassword $ S.pack ""}
  }
