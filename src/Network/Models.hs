module Network.Models where

import Miso.String (MisoString)

newtype SessionId = SessionId
  { id :: MisoString
  }
