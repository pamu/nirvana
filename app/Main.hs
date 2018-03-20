{-# LANGUAGE CPP #-}
{-# LANGUAGE DataKinds #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE ScopedTypeVariables #-}
{-# LANGUAGE TypeFamilies #-}
{-# LANGUAGE TypeOperators #-}

module Main where

import Data.Proxy
import Servant.API

import Miso
import Miso.String

import Action
import ActionHandler
import Connector
import Model
import Routes

-- | Main entry point
main :: IO ()
main = do
  currentURI <- getCurrentURI
  startApp App {model = defaultModel currentURI, initialAction = NoOp, ..}
  where
    update = handle
    events = defaultEvents
    subs = [uriSub HandleURI]
    view = render
    mountPoint = Nothing
