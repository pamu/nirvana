module Action where

import Miso

data Action
  = HandleURI URI
  | ChangeURI URI
  | NoOp
  deriving (Show, Eq)
