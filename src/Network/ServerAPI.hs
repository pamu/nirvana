module Network.ServerAPI where

baseURL :: String
baseURL = ""

loginURL :: String
loginURL = baseURL ++ "/login"

signUpURL :: String
signUpURL = baseURL ++ "/signup"

forgotPassword :: String
forgotPassword = baseURL ++ "/forgotpassword"
