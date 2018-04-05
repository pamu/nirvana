{-# LANGUAGE CPP #-}
{-# LANGUAGE DataKinds #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE ScopedTypeVariables #-}
{-# LANGUAGE TypeFamilies #-}
{-# LANGUAGE TypeOperators #-}

module View.MainHolder where

import Action
import Action
import Data.Maybe
import Data.Proxy
import Miso
import qualified Miso.String as MS
import Miso.String
import Model
import Routes
import Servant.API
import View.Navbar

mainHolder :: Model -> View Action -> View Action
mainHolder (m :: Model) inner =
  div_
    [class_ "container grid-lg"]
    [ navbar m
    , div_
        [ class_ $
          MS.pack $
          "modal modal-sm " ++ (maybe "" (const "active") $ dialogMsg m)
        ]
        [ div_
            [class_ "modal-container", textProp "role" "document"]
            [ div_
                [class_ "modal-header"]
                [ div_
                    [ class_ "btn btn-clear float-right"
                    , textProp "aria-label" "Close"
                    , onClick HideDialog
                    ]
                    []
                , div_ [class_ "modal-title h5"] [text "Attention!"]
                ]
            , div_
                [class_ "modal-body"]
                [ div_
                    [class_ "content"]
                    [text $ MS.pack $ maybe "" id $ dialogMsg m]
                ]
            ]
        ]
    , inner
    ]
