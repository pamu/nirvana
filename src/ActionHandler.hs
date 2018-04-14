module ActionHandler where

import Action
import Miso
import Model

import qualified Data.Map as Map
import Domain.UserCredentials
import Domain.UserEmail
import Domain.UserPassword
import qualified Domain.UserSignUpInfo as US
import Network.API
import Network.Pot
import qualified Routes as R

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
  m {loggedInUserSession = Pending} <# do
    pot <- login (userCredentials m)
    pure $ OnLoginUser pot
handle (OnLoginUser pot) m =
  (handlePot pot m) {loggedInUserSession = pot} <# pure NoOp
handle (UpdateUserSignUpEmail userEmail) m =
  m {userSignUpInfo = (userSignUpInfo m) {US.email = userEmail}} <# pure NoOp
handle (UpdateUserSignUpPassword userPassword) m =
  m {userSignUpInfo = (userSignUpInfo m) {US.password = userPassword}} <#
  pure NoOp
handle (UpdateUserSignUpFirstName firstName) m =
  m {userSignUpInfo = (userSignUpInfo m) {US.firstName = firstName}} <#
  pure NoOp
handle (UpdateUserSignUpLastName lastName) m =
  m {userSignUpInfo = (userSignUpInfo m) {US.lastName = lastName}} <# pure NoOp
handle SignUpUser m =
  m {userSignUpStatus = Pending} <# do
    pot <- signUp (userSignUpInfo m)
    pure $ OnSignUpUser pot
handle (OnSignUpUser pot) m =
  (handlePot pot m) {userSignUpStatus = pot} <# pure R.gotoLoginPage
handle (ShowDailog msg) m = m {dialogMsg = Just msg} <# pure NoOp
handle HideDialog m = m {dialogMsg = Nothing} <# pure NoOp
handle _ m = noEff m

--Internal functions
handlePot :: Pot a -> Model -> Model
handlePot (Failed msg) m = m {dialogMsg = Just msg}
handlePot _ m = m
