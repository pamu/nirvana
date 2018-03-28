{-# LANGUAGE CPP #-}
{-# LANGUAGE DataKinds #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE ScopedTypeVariables #-}
{-# LANGUAGE TypeFamilies #-}
{-# LANGUAGE TypeOperators #-}

module View.LoginPageComponent where

import Action
import Data.Proxy
import Domain.CourseId
import Domain.UserCredentials
import Domain.UserEmail
import Domain.UserEmail
import Domain.UserPassword
import Domain.UserPassword
import Miso
import Miso.String
import Model
import Routes
import Servant.API
import View.Common.Styles

loginPageComponent :: Model -> View Action
loginPageComponent model =
  div_
    [style_ marginTop]
    [ div_
        [class_ "columns"]
        [ div_ [class_ "column col-xs-4"] []
        , div_ [class_ "column col-xs-4"] [loginForm model]
        , div_ [class_ "column col-xs-4"] []
        ]
    ]

loginForm :: Model -> View Action
loginForm m =
  div_
    []
    [ div_
        [class_ "form-group"]
        [ label_ [class_ "form-label"] [text "Email"]
        , input_
            [ class_ "form-input"
            , type_ "text"
            , onChange (UpdateUserEmail . UserEmail)
            ]
        ]
    , div_
        [class_ "form-group"]
        [ label_ [class_ "form-label"] [text "Password"]
        , input_
            [ class_ "form-input"
            , type_ "password"
            , onChange (UpdateUserPassword . UserPassword)
            ]
        ]
    , div_
        [class_ "columns"]
        [ div_
            [class_ "column col-xs-6"]
            [ div_
                [class_ "form-group float-left"]
                [ button_
                    [class_ "btn btn-primary", onClick LoginUser]
                    [text "Login"]
                ]
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
