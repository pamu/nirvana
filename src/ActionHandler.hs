module ActionHandler where

import Action
import Miso
import Model

import qualified Data.Map as Map
import Domain.UserCredentials
import Domain.UserEmail
import Domain.UserPassword
import Network.API

handle :: Action -> Model -> Effect Action Model
handle (HandleURI u) m = m {uri = u} <# pure NoOp
handle (ChangeURI u) m =
  m <# do
    pushURI u
    pure NoOp
handle (UpdateUserEmail userEmail) m =
  m {userCredentials = (userCredentials m) {email = userEmail}} <# pure NoOp
handle (UpdateUserPassword userPassword) m =
  m {userCredentials = (userCredentials m) {password = userPassword}} <#
  pure NoOp
handle LoginUser m =
  m <# do
    pot <- login (userCredentials m)
    pure $ OnLoginUser pot
handle (OnLoginUser pot) m = m {loggedInUserSession = pot} <# pure NoOp
handle (ShowDailog msg) m = m {dialogMsg = Just msg} <# pure NoOp
handle HideDialog m = m {dialogMsg = Nothing} <# pure NoOp
handle _ m = noEff m
