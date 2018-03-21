{-# LANGUAGE CPP                 #-}
{-# LANGUAGE DataKinds           #-}
{-# LANGUAGE OverloadedStrings   #-}
{-# LANGUAGE ScopedTypeVariables #-}
{-# LANGUAGE TypeFamilies        #-}
{-# LANGUAGE TypeOperators       #-}

module View.CoursePageComponent where

import           Action
import           Data.Proxy
import           Domain.CourseId
import           Miso
import           Miso.String     (MisoString)
import qualified Miso.String     as S
import           Model
import           Routes
import           Servant.API

coursePageComponent :: CourseId -> Model -> View Action
coursePageComponent courseId (_ :: Model) =
  div_
    []
    [ div_ [] [text $ S.pack $ "course with id: " ++ courseIdValue courseId]
    , button_ [onClick gotoHomePage, class_ "btn"] [text "Home"]
    ]
