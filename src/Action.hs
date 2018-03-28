module Action where

import Miso

import Domain.UserCredentials
import Domain.UserEmail
import Domain.UserPassword

data Action
  = HandleURI URI
  | ChangeURI URI
  | UpdateUserEmail UserEmail
  | UpdateUserPassword UserPassword
  | LoginUser
  | ShowDailog String
  | HideDialog
  | ShowLoader
  | HideLoader
  | NoOp
  deriving (Show, Eq)
