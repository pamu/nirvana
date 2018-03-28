{-# LANGUAGE CPP #-}
{-# LANGUAGE DataKinds #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE ScopedTypeVariables #-}
{-# LANGUAGE TypeFamilies #-}
{-# LANGUAGE TypeOperators #-}

module View.Navbar where

import Action
import Common.MaybeOps
import Data.Proxy
import Miso
import Miso.String (MisoString)
import qualified Miso.String as S
import Model
import Routes
import Servant.API

navbarItem :: String -> String -> Model -> View Action
navbarItem name href model =
  if (isJust $ userSession model)
    then div_ [] []
    else div_
           []
           [ a_
               [class_ "btn btn-link", href_ (S.toLower . S.pack $ "#" ++ href)]
               [text (S.pack name)]
           ]

navbarLoginItem :: Model -> View Action
navbarLoginItem model = navbarItem "Login" "login" model

navbarSignUpItem :: Model -> View Action
navbarSignUpItem model = navbarItem "Sign Up" "signup" model

navbar :: Model -> View Action
navbar (m :: Model) =
  div_
    []
    [ header_
        [class_ "navbar"]
        [ section_
            [class_ "navbar-section"]
            [a_ [class_ "navbar-brand mr-2", href_ "/"] [text "Nextabc"]]
        , section_
            [class_ "navbar-center"]
            [ img_
                [ src_
                    "https://picturepan2.github.io/spectre/img/spectre-logo.svg"
                , alt_ "Nextabc"
                ]
            ]
        , section_
            [class_ "navbar-section"]
            [navbarLoginItem m, navbarSignUpItem m]
        ]
    ]
