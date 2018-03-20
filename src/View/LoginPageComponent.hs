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
import Miso
import Miso.String
import Model
import Routes
import Servant.API

loginPageComponent :: Model -> View Action
loginPageComponent model = div_ [] []
