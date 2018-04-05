module Network.ServerRoutes where

baseURL :: String
baseURL = "http://localhost:9000"

loginURL :: String
loginURL = baseURL ++ "/login"

signUpURL :: String
signUpURL = baseURL ++ "/signup"

forgotPassword :: String
forgotPassword = baseURL ++ "/forgotpassword"
