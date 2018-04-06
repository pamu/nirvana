module Action where

import Miso

import Domain.SessionId
import Domain.UserCredentials
import Domain.UserEmail
import Domain.UserPassword
import Miso.String
import Network.Pot

data Action
  = HandleURI URI
  | ChangeURI URI
  | UpdateUserEmail UserEmail
  | UpdateUserPassword UserPassword
  | UpdateUserSignUpEmail UserEmail
  | UpdateUserSignUpPassword UserPassword
  | UpdateUserSignUpFirstName MisoString
  | UpdateUserSignUpLastName MisoString
  | UpdateUserSignUpRepeatPassword UserPassword
  | LoginUser
  | SignUpUser
  | OnLoginUser (Pot SessionId)
  | OnSignUpUser (Pot String)
  | ShowDailog String
  | HideDialog
  | NoOp
  deriving (Show, Eq)
