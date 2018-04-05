{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE ScopedTypeVariables #-}
{-# LANGUAGE TypeOperators #-}
{-# LANGUAGE DataKinds #-}
{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE TypeFamilies #-}
{-# LANGUAGE DeriveGeneric, DeriveAnyClass #-}

module Network.AppRequests where

import Data.Aeson
import Data.Aeson.Types
import qualified Data.ByteString as BS
import qualified Data.ByteString.Char8 as BSC
import qualified Data.ByteString.Lazy.UTF8 as LBS
import GHC.Generics
import JavaScript.Web.XMLHttpRequest
import Network.Pot
import Network.XHR.Requests

post ::
     (ToJSON a, FromJSON b)
  => a
  -> String
  -> Maybe String
  -> IO (Either String (Pot b))
post input route session = do
  response <- xhrByteString (postRequest input route session)
  let payload = contents response
  let statusCode = status response
  pure $ parseResponse statusCode payload

parseResponse ::
     (FromJSON a) => Int -> Maybe BS.ByteString -> Either String (Pot a)
parseResponse code content =
  case content of
    Just a -> helper code a
    Nothing -> helper code (BSC.pack "")

helper ::
     forall a. (FromJSON a)
  => Int
  -> BS.ByteString
  -> Either String (Pot a)
helper 200 content = Ready <$> (eitherDecodeStrict content :: Either String a)
helper 404 content =
  Unavailable <$> (eitherDecodeStrict content :: Either String String)
helper 400 content =
  ValidationFailed <$>
  (eitherDecodeStrict content :: Either String ValidationErrors)
helper 500 content =
  Failed <$> (eitherDecodeStrict content :: Either String String)
helper code content = Left ("Bad http response, status code: " ++ show code)
