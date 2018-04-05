module Action where

import Miso

import Domain.SessionId
import Domain.UserCredentials
import Domain.UserEmail
import Domain.UserPassword

data Action
  = HandleURI URI
  | ChangeURI URI
  | UpdateUserEmail UserEmail
  | UpdateUserPassword UserPassword
  | LoginUser
  | UserLoginSuccess SessionId
  | UserLoginFailure String
  | ShowDailog String
  | HideDialog
  | ShowLoader
  | HideLoader
  | NoOp
  deriving (Show, Eq)
