{-# LANGUAGE ScopedTypeVariables #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TypeOperators #-}
{-# LANGUAGE DataKinds #-}
{-# LANGUAGE TypeFamilies #-}
{-# LANGUAGE CPP #-}

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
root (_ :: Model) inner = div_ [class_ "container"] [inner]
