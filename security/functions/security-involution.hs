import Control.Monad (liftM, mapM_)

main :: IO ()
main = do
  n <- readLn :: IO Int
  fxs <- liftM (map (read :: String -> Int) . words) getLine
  let fx n = fxs !! (n - 1)
  if foldl (\acc i -> acc && fx (fx i) == i) True [1..n]
    then putStrLn "YES"
    else putStrLn "NO"