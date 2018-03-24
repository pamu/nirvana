{-# LANGUAGE GeneralizedNewtypeDeriving #-}

module Domain.CourseId where

import Servant.API

newtype CourseId = CourseId
  { courseIdValue :: String
  } deriving (Eq, Show, ToHttpApiData, FromHttpApiData)
