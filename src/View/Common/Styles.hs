{-# LANGUAGE CPP #-}
{-# LANGUAGE DataKinds #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE ScopedTypeVariables #-}
{-# LANGUAGE TypeFamilies #-}
{-# LANGUAGE TypeOperators #-}

module View.Common.Styles where

import qualified Data.Map as M
import Miso
import Miso.String (MisoString)

marginTop :: M.Map MisoString MisoString
marginTop = M.fromList [("marginTop", "16%")]
