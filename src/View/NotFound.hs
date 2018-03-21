{-# LANGUAGE CPP #-}
{-# LANGUAGE DataKinds #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE ScopedTypeVariables #-}
{-# LANGUAGE TypeFamilies #-}
{-# LANGUAGE TypeOperators #-}

module View.NotFound where

import Action
import Data.Proxy
import Miso
import Miso.String
import Model
import Routes
import Servant.API

notFoundPageComponent :: Model -> View Action
notFoundPageComponent model =
  div_ [] [div_ [class_ "columns"] [div_ [class_ "column"] [emptyState]]]

emptyState :: View Action
emptyState =
  div_
    [class_ "empty"]
    [ div_ [class_ "empty-icon"] [i_ [class_ "icon icon-4x icon-stop"] []]
    , p_ [class_ "empty-title h1"] [text "Oops!"]
    , p_
        [class_ "empty-subtitle h4"]
        [text "The page you are looking for is not available."]
    , div_
        [class_ "empty-action"]
        [button_ [class_ "btn btn-primary", onClick gotoHomePage] [text "Home"]]
    ]
