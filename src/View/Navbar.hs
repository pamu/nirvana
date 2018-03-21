{-# LANGUAGE CPP #-}
{-# LANGUAGE DataKinds #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE ScopedTypeVariables #-}
{-# LANGUAGE TypeFamilies #-}
{-# LANGUAGE TypeOperators #-}

module View.Navbar where

import Action
import Data.Proxy
import Miso
import Miso.String (MisoString)
import qualified Miso.String as S
import Model
import Routes
import Servant.API

navbarItem :: String -> Model -> View Action
navbarItem name model =
  if isUserLoggedIn model
    then div_ [] []
    else div_
           []
           [ a_
               [class_ "btn btn-link", href_ (S.toLower . S.pack $ "#" ++ name)]
               [text (S.pack name)]
           ]

navbarLoginItem :: Model -> View Action
navbarLoginItem = navbarItem "Login"

navbarSignUpItem :: Model -> View Action
navbarSignUpItem = navbarItem "Signup"

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
                []
            ]
        , section_
            [class_ "navbar-section"]
            [navbarLoginItem m, navbarSignUpItem m]
        ]
    ]
