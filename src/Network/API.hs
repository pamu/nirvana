  {-# LANGUAGE CPP #-}
  {-# LANGUAGE DataKinds #-}
  {-# LANGUAGE OverloadedStrings #-}
  {-# LANGUAGE ScopedTypeVariables #-}
  {-# LANGUAGE TypeFamilies #-}
  {-# LANGUAGE TypeOperators #-}
  
  module Network.API where
  
  import Action
  import Data.Proxy
  import Domain.CourseId
  import Miso
  import Miso.String
  import Model
  import Network.Pot
  import Routes
  import Servant.API
  
  import Prelude hiding (id)
  
  import qualified Domain.UserCredentials as UC
  import qualified Domain.UserSignUpInfo as US
  
  import Domain.SessionId
  import Network.AppRequests
  import Network.Pot
  
  import Network.ServerRoutes
  
  login :: UC.UserCredentials -> IO (Pot SessionId)
  login credentials = do
    (value :: (Either String (Pot SessionId))) <-
      (post credentials loginURL Nothing)
    let result =
          case value of
            Left msg -> error ("Parsing failed. " ++ show msg)
            Right pot -> pot
    pure result
  
  signUp :: US.UserSignUpInfo -> IO (Pot String)
  signUp signUpInfo = do
    (value :: (Either String (Pot String))) <- (post signUpInfo signUpURL Nothing)
    let result =
          case value of
            Left msg -> error ("Parsing failed. " ++ show msg)
            Right pot -> pot
    pure result
