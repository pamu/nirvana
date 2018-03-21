{-# LANGUAGE CPP #-}
{-# LANGUAGE DataKinds #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE ScopedTypeVariables #-}
{-# LANGUAGE TypeFamilies #-}
{-# LANGUAGE TypeOperators #-}

module View.LoginSignUpPageComponent where

import Action
import Data.Proxy
import Domain.CourseId
import Miso
import Miso.String
import Model
import Routes
import Servant.API

loginSignUpPageComponent :: Model -> View Action
loginSignUpPageComponent model =
  div_
    []
    [ div_
        [class_ "columns"]
        [ div_ [class_ "column col-xs-4"] [loginForm model]
        , div_ [class_ "divider-vert", textProp "data-content" "OR"] []
        , div_ [class_ "column col-xs-4"] [signUpForm model]
        ]
    ]

loginForm :: Model -> View Action
loginForm m =
  div_
    []
    [ div_
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
        [class_ "columns"]
        [ div_
            [class_ "column col-xs-6"]
            [ div_
                [class_ "form-group float-left"]
                [button_ [class_ "btn btn-primary"] [text "Login"]]
            ]
        , div_
            [class_ "column col-xs-6"]
            [ div_
                [class_ "form-group float-right"]
                [ a_
                    [class_ "btn btn-link", href_ "#forgotpassword"]
                    [text "Forgot password."]
                ]
            ]
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
        [button_ [class_ "btn btn-primary"] [text "SignUp"]]
    ]
