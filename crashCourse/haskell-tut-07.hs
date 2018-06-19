import Data.List
import System.IO

data Expr = Val Int | Div Expr Expr

safeDiv :: Int -> Int -> Maybe Int
safeDiv n m = if m == 0 
                    then Nothing
                    else Just (n `div` m)

-- m >>= f = case m of
--             Nothing -> Nothing
--             Just x -> f x 


-- eval :: Expr -> Maybe Int
-- eval (Val n) = Just n
-- eval (Div x y) = case (eval x) of
--                     Nothing -> Nothing
--                     Just n -> case (eval y) of
--                                 Nothing -> Nothing
--                                 Just m -> safeDiv n m

-- eval :: Expr -> Maybe Int
-- eval (Val n) = return n
-- eval (Div x y) = eval x >>= (\n ->
--                  eval y >>= (\m ->
--                  safeDiv n m))

eval :: Expr -> Maybe Int
eval (Val n) = return n
eval (Div x y) = do n <- eval x
                    m <- eval y
                    safeDiv n m 