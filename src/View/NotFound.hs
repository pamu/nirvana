{-# LANGUAGE ScopedTypeVariables #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TypeOperators #-}
{-# LANGUAGE DataKinds #-}
{-# LANGUAGE TypeFamilies #-}
{-# LANGUAGE CPP #-}

module View.NotFound where

import Action
import Data.Proxy
import Miso
import Miso.String
import Model
import Routes
import Servant.API

notFoundPage :: View Action
notFoundPage =
  div_ [] [text "Oops! Requested url not found!", div_ [] [button_ [class_ "btn", onClick goHomePage] [text "go home"]]]
