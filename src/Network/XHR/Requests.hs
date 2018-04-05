{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE ScopedTypeVariables #-}
{-# LANGUAGE TypeOperators #-}
{-# LANGUAGE DataKinds #-}
{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE TypeFamilies #-}
{-# LANGUAGE DeriveGeneric, DeriveAnyClass #-}

module Network.XHR.Requests where

import Miso.String as M

import Data.Aeson
import Data.Aeson.Types
import qualified Data.ByteString as BS
import qualified Data.ByteString.Char8 as BSC
import qualified Data.ByteString.Lazy.UTF8 as LBS
import GHC.Generics
import JavaScript.Web.XMLHttpRequest

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
