{-# LANGUAGE ScopedTypeVariables #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TypeOperators #-}
{-# LANGUAGE DataKinds #-}
{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE TypeFamilies #-}
{-# LANGUAGE CPP #-}

module Main where

import Data.Proxy
import Servant.API

import Miso
import Miso.String

import Action
import ActionHandler
import Connector
import Domain
import Model
import Routes

-- | Main entry point
main :: IO ()
main = do
  currentURI <- getCurrentURI
  startApp App {model = initModel currentURI, initialAction = NoOp, ..}
  where
    update = handle
    events = defaultEvents
    subs = [uriSub HandleURI]
    view = render
    mountPoint = Nothing
