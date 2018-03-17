module ActionHandler where

import Action
import Miso
import Model

handle :: Action -> Model -> Effect Action Model
handle (HandleURI u) m = m {uri = u} <# pure NoOp
handle (ChangeURI u) m =
  m <# do
    pushURI u
    pure NoOp
handle _ m = noEff m
