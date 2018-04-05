module ActionHandler where

import Action
import Miso
import Model

import qualified Data.Map as Map
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
    sessionId <- login (userCredentials m)
    _ <- putStrLn $ show sessionId
    let action = either UserLoginFailure UserLoginSuccess sessionId
    pure action
handle (UserLoginSuccess sessionId) m =
  m {userSession = Just sessionId} <# do pure HideLoader
handle (UserLoginFailure msg) m =
  m {serverError = Just msg, showDailog = Just msg} <# do
    _ <- putStrLn "failure occurred."
    pure HideLoader
handle (ShowDailog msg) m = m {showDailog = Just msg} <# pure NoOp
handle HideDialog m =
  m {showDailog = Nothing} <# do
    _ <- putStrLn "hide dialog!"
    pure NoOp
handle ShowLoader m = m {showLoader = True} <# pure NoOp
handle HideLoader m = m {showLoader = False} <# pure NoOp
handle _ m = noEff m

onShowLoader :: Model -> Model
onShowLoader m = m {showLoader = True}

resetErrors :: Model -> Model
resetErrors m = m {validationErrors = Map.fromList [], serverError = Nothing}
