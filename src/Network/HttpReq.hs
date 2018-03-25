{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE ScopedTypeVariables #-}
{-# LANGUAGE TypeOperators #-}
{-# LANGUAGE DataKinds #-}
{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE TypeFamilies #-}
{-# LANGUAGE DeriveGeneric, DeriveAnyClass #-}

module Network.HttpReq where

import Data.Aeson
import Data.Aeson.Types
import qualified Data.ByteString as BS
import qualified Data.ByteString.Lazy.UTF8 as LBS
import GHC.Generics
import JavaScript.Web.XMLHttpRequest
import Miso.String as M
import Network.ServerRes

post ::
     (ToJSON a, FromJSON b)
  => a
  -> String
  -> Maybe String
  -> IO (Either String (ServerRes b))
post input route session = do
  response <- xhrByteString req
  let payload = contents response
  let statusCode = status response
  pure $ parsed statusCode payload
  where
    req =
      Request
      { reqMethod = POST
      , reqURI = M.pack route
      , reqLogin = Nothing
      , reqHeaders =
          [(M.pack "Content-type", M.pack "application/json; utf-8")] ++
          case session of
            Just sid -> [(M.pack "session", M.pack sid)]
            Nothing -> []
      , reqWithCredentials = False
      , reqData = StringData $ M.pack $ LBS.toString $ encode input
      }

parsed ::
     (FromJSON a) => Int -> Maybe BS.ByteString -> Either String (ServerRes a)
parsed status content = Right $ InternalServerError ""
