{-# LANGUAGE ScopedTypeVariables #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TypeOperators #-}
{-# LANGUAGE DataKinds #-}
{-# LANGUAGE TypeFamilies #-}
{-# LANGUAGE CPP #-}

module View.Navbar where

import Action
import Data.Proxy
import Miso
import Miso.String
import Model
import Routes
import Servant.API

navbar :: Model -> View Action
navbar (_:: Model) = div_ [] []
