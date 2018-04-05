module Model where

import qualified Data.Map as Map
import Domain.SessionId
import Domain.UserCredentials
import Domain.UserEmail
import Domain.UserPassword
import Miso
import Miso.String (MisoString)
import qualified Miso.String as MS
import Network.Pot

data Model = Model
  { uri :: URI
  , loggedInUserSession :: Pot SessionId
  , dialogMsg :: Maybe String
  , userCredentials :: UserCredentials
  , formValidationErrors :: Map.Map String String
  } deriving (Show, Eq)

defaultModel :: URI -> Model
defaultModel uri =
  Model
  { uri = uri
  , loggedInUserSession = Empty
  , dialogMsg = Nothing
  , userCredentials =
      UserCredentials
      {email = UserEmail $ MS.pack "", password = UserPassword $ MS.pack ""}
  , formValidationErrors = Map.fromList []
  }
