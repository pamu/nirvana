{-# LANGUAGE CPP #-}
{-# LANGUAGE DataKinds #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE ScopedTypeVariables #-}
{-# LANGUAGE TypeFamilies #-}
{-# LANGUAGE TypeOperators #-}

module View.Root where

import Action
import Data.Proxy
import Miso
import Miso.String
import Model
import Routes
import Servant.API

import View.Navbar

root :: Model -> View Action -> View Action
root (m :: Model) inner = div_ [class_ "container grid-lg"] [navbar m, inner]
