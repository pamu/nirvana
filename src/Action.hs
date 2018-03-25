module Action where

import Miso

data Action
  = HandleURI URI
  | ChangeURI URI
  | ShowDailog String
  | HideDialog String
  | StartLoader
  | StopLoader
  | NoOp
  deriving (Show, Eq)
