{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE ScopedTypeVariables #-}
{-# LANGUAGE TypeOperators #-}
{-# LANGUAGE DataKinds #-}
{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE TypeFamilies #-}
{-# LANGUAGE DeriveGeneric, DeriveAnyClass #-}

module Network.AppReq where

import Data.Aeson
import Data.Aeson.Types
import qualified Data.ByteString as BS
import qualified Data.ByteString.Char8 as BSC
import qualified Data.ByteString.Lazy.UTF8 as LBS
import GHC.Generics
import JavaScript.Web.XMLHttpRequest
import Miso.String as M
import Network.AppRes

getRequest route session =
  Request
  { reqMethod = GET
  , reqURI = M.pack route
  , reqLogin = Nothing
  , reqHeaders =
      [(M.pack "Content-Type", M.pack "application/json")] ++
      case session of
        Just sid -> [(M.pack "session", M.pack sid)]
        Nothing -> []
  , reqWithCredentials = False
  , reqData = NoData
  }

postRequest input route session =
  Request
  { reqMethod = POST
  , reqURI = M.pack route
  , reqLogin = Nothing
  , reqHeaders =
      [(M.pack "Content-Type", M.pack "application/json")] ++
      case session of
        Just sid -> [(M.pack "session", M.pack sid)]
        Nothing -> []
  , reqWithCredentials = False
  , reqData = StringData $ M.pack $ LBS.toString $ encode input
  }

post ::
     (ToJSON a, FromJSON b)
  => a
  -> String
  -> Maybe String
  -> IO (Either String (AppRes b))
post input route session = do
  response <- xhrByteString (postRequest input route session)
  let payload = contents response
  let statusCode = status response
  pure $ parseResponse statusCode payload

parseResponse ::
     (FromJSON a) => Int -> Maybe BS.ByteString -> Either String (AppRes a)
parseResponse code content =
  case content of
    Just a -> helper code a
    Nothing -> helper code (BSC.pack "")

helper ::
     forall a. (FromJSON a)
  => Int
  -> BS.ByteString
  -> Either String (AppRes a)
helper 200 content = Ok <$> (eitherDecodeStrict content :: Either String a)
helper 400 content =
  BadRequest <$> (eitherDecodeStrict content :: Either String ValidationError)
helper 500 content =
  InternalServerError <$> (eitherDecodeStrict content :: Either String String)
helper code content = Left ("Bad http response, status code: " ++ show code)
