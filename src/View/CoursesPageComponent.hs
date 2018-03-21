{-# LANGUAGE CPP                 #-}
{-# LANGUAGE DataKinds           #-}
{-# LANGUAGE OverloadedStrings   #-}
{-# LANGUAGE ScopedTypeVariables #-}
{-# LANGUAGE TypeFamilies        #-}
{-# LANGUAGE TypeOperators       #-}

module View.CoursesPageComponent where

import           Action
import           Data.Proxy
import           Domain.CourseId
import           Miso
import           Miso.String
import           Model
import           Routes
import           Servant.API

coursesPageComponent :: Model -> View Action
coursesPageComponent model = div_ [] []
