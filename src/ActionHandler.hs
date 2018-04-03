module ActionHandler where

import Action
import Miso
import Model

import Domain.UserCredentials
import Domain.UserEmail
import Domain.UserPassword
import Network.Auth

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
  onShowLoader m <# do
    _ <- login (userCredentials m)
    pure HideLoader
handle (ShowDailog msg) m = m {showDailog = Just msg} <# pure NoOp
handle HideDialog m = m {showDailog = Nothing} <# pure NoOp
handle ShowLoader m = m {showLoader = True} <# pure NoOp
handle HideLoader m = m {showLoader = False} <# pure NoOp
handle _ m = noEff m

onShowLoader :: Model -> Model
onShowLoader m = m {showLoader = True}
