module Model where

import qualified Data.Map as Map
import Domain.SessionId
import Domain.UserCredentials
import Domain.UserEmail
import Domain.UserPassword
import Miso
import Miso.String (MisoString)
import qualified Miso.String as S

data Model = Model
  { uri :: URI
  , userSession :: Maybe SessionId
  , showLoader :: Bool
  , showDailog :: Maybe String
  , userCredentials :: UserCredentials
  , validationErrors :: Map.Map String String
  , serverError :: Maybe String
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
  , validationErrors = Map.fromList []
  , serverError = Nothing
  }
