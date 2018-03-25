{-# LANGUAGE CPP #-}
{-# LANGUAGE DataKinds #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE ScopedTypeVariables #-}
{-# LANGUAGE TypeFamilies #-}
{-# LANGUAGE TypeOperators #-}

module View.SignUpPageComponent where

import Action
import Data.Proxy
import Domain.CourseId
import Miso
import Miso.String
import Model
import Routes
import Servant.API
import View.Common.Styles

signUpPageComponent :: Model -> View Action
signUpPageComponent model =
  div_
    [style_ marginTop]
    [ div_
        [class_ "columns"]
        [ div_ [class_ "column col-xs-4"] []
        , div_ [class_ "column col-xs-4"] [signUpForm model]
        , div_ [class_ "column col-xs-4"] []
        ]
    ]

signUpForm :: Model -> View Action
signUpForm model =
  div_
    []
    [ div_
        [class_ "form-group"]
        [ label_ [class_ "form-label"] [text "Name"]
        , input_ [class_ "form-input", type_ "text"] []
        ]
    , div_
        [class_ "form-group"]
        [ label_ [class_ "form-label"] [text "Email"]
        , input_ [class_ "form-input", type_ "text"] []
        ]
    , div_
        [class_ "form-group"]
        [ label_ [class_ "form-label"] [text "Password"]
        , input_ [class_ "form-input", type_ "password"] []
        ]
    , div_
        [class_ "form-group"]
        [ label_ [class_ "form-label"] [text "Repeat Password"]
        , input_ [class_ "form-input", type_ "password"] []
        ]
    , div_
        [class_ "form-group"]
        [button_ [class_ "btn btn-primary"] [text "Sign Up"]]
    ]
