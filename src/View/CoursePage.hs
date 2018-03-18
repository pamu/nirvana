{-# LANGUAGE ScopedTypeVariables #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TypeOperators #-}
{-# LANGUAGE DataKinds #-}
{-# LANGUAGE TypeFamilies #-}
{-# LANGUAGE CPP #-}

module View.CoursePage where
    
import Action
import Data.Proxy
import Miso
import Miso.String
import Model
import Routes
import Servant.API

coursePage name (_ :: Model) =
    div_ [] [
      div_ [] [
        text $ ms ("awesome! " ++ show name)],
        button_ [onClick goHomePage] [text "go home"]
      ]