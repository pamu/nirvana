{-# LANGUAGE CPP #-}
{-# LANGUAGE DataKinds #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE ScopedTypeVariables #-}
{-# LANGUAGE TypeFamilies #-}
{-# LANGUAGE TypeOperators #-}

module View.MainHolder where

import Action
import Data.Proxy
import Miso
import Miso.String
import Model
import Routes
import Servant.API

import View.Navbar

mainHolder :: Model -> View Action -> View Action
mainHolder (m :: Model) inner =
  div_ [class_ "container grid-lg"] [navbar m, inner]
