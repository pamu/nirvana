{-# LANGUAGE GeneralizedNewtypeDeriving #-}

module Domain.CourseId where

import Servant.API

newtype CourseId = CourseId
  { value :: String
  } deriving (Eq, Show, ToHttpApiData, FromHttpApiData)
