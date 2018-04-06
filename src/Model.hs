module Model where

import qualified Data.Map as Map
import Domain.SessionId
import Domain.UserCredentials
import Domain.UserEmail
import Domain.UserPassword
import qualified Domain.UserSignUpInfo as US
import Miso
import Miso.String (MisoString)
import qualified Miso.String as MS
import Network.Pot

data Model = Model
  { uri :: URI
  , loggedInUserSession :: Pot SessionId
  , userSignUpStatus :: Pot String
  , dialogMsg :: Maybe String
  , userCredentials :: UserCredentials
  , userSignUpInfo :: US.UserSignUpInfo
  , formValidationErrors :: Map.Map String String
  } deriving (Show, Eq)

defaultModel :: URI -> Model
defaultModel uri =
  Model
  { uri = uri
  , loggedInUserSession = Empty
  , userSignUpStatus = Empty
  , dialogMsg = Nothing
  , userCredentials =
      UserCredentials
      {email = UserEmail $ MS.pack "", password = UserPassword $ MS.pack ""}
  , userSignUpInfo = US.defaultUserSignUpInfo
  , formValidationErrors = Map.fromList []
  }
