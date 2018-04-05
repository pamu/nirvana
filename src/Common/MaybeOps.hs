module Common.MaybeOps where

isJust :: Maybe a -> Bool
isJust (Just _) = True
isJust Nothing = False

whenJust :: b -> b -> Maybe a -> b
whenJust pos _ (Just _) = pos
whenJust _ neg Nothing = neg

whenNothing :: b -> b -> Maybe a -> b
whenNothing pos _ (Just _) = pos
whenNothing _ neg Nothing = neg
