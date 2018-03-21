{-# LANGUAGE CPP                 #-}
{-# LANGUAGE DataKinds           #-}
{-# LANGUAGE OverloadedStrings   #-}
{-# LANGUAGE ScopedTypeVariables #-}
{-# LANGUAGE TypeFamilies        #-}
{-# LANGUAGE TypeOperators       #-}

module View.LandingPageComponent where

import           Action
import           Data.Char
import           Data.Proxy
import           Miso
import           Miso.String (MisoString)
import qualified Miso.String as S
import           Model
import           Routes
import           Servant.API

landingPageComponent :: Model -> View Action
landingPageComponent model = div_ [] []
