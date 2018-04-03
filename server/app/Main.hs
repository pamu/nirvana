{-# LANGUAGE OverloadedStrings #-}

module Main where

import Network.Wai.Application.Static
  ( StaticSettings(..)
  , defaultWebAppSettings
  , staticApp
  )

import WaiAppStatic.Types

import Network.Wai.Handler.Warp (run)

main :: IO ()
main = do
  let port = 8080
  putStrLn $ "running on port: " ++ show port
  run port $
    staticApp
      (defaultWebAppSettings "../html-src/")
      {ssIndices = [unsafeToPiece "index.html"], ssMaxAge = MaxAgeSeconds 0}
