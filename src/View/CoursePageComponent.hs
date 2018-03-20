{-# LANGUAGE CPP #-}
{-# LANGUAGE DataKinds #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE ScopedTypeVariables #-}
{-# LANGUAGE TypeFamilies #-}
{-# LANGUAGE TypeOperators #-}

module View.CoursePageComponent where

import Action
import Data.Proxy
import Miso
import Miso.String
import Model
import Routes
import Servant.API

coursePageComponent name (_ :: Model) =
  div_
    []
    [ div_ [] [text $ ms ("awesome! " ++ show name)]
    , button_ [onClick gotoHomePage] [text "go home"]
    ]
