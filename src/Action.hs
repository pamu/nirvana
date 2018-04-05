module Action where

import Miso

import Domain.SessionId
import Domain.UserCredentials
import Domain.UserEmail
import Domain.UserPassword
import Network.Pot

data Action
  = HandleURI URI
  | ChangeURI URI
  | UpdateUserEmail UserEmail
  | UpdateUserPassword UserPassword
  | LoginUser
  | OnLoginUser (Pot SessionId)
  | ShowDailog String
  | HideDialog
  | NoOp
  deriving (Show, Eq)
