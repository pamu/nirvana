{-# LANGUAGE CPP #-}
{-# LANGUAGE DataKinds #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE ScopedTypeVariables #-}
{-# LANGUAGE TypeFamilies #-}
{-# LANGUAGE TypeOperators #-}

module View.SignUpPageComponent where

import Action
import Data.Proxy
import Domain.CourseId
import Miso
import Miso.String
import Model
import Routes
import Servant.API

signUpPageComponent :: Model -> View Action
signUpPageComponent model = div_ [] []
