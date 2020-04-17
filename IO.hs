import System.IO 
import System.Directory
import System.Environment
import Data.List
import System.Environment
import qualified Data.ByteString.Lazy as B

main = do
    line <- getLine
    if null line
        then return ()
        else do
            putStrLn $ reverseWords line
            main
reverseWords :: String -> String
reverseWords = unwords . map reverse . words

buffer = do
    withFile "something.txt" ReadMode (\handle -> do
        hSetBuffering handle $ BlockBuffering (Just 2048)
        contents <- hGetContents handle
        putStr contents)

-- 刚刚居然没反应过来dispatch是一个类型？
dispatch :: [(String,[System]->IO ())]
dispatch = [ ("add",add)
           , ("view",view)
           , ("remove",remove)
           ]

main = do
    (command:args) <- getArgs
    let (Just action) = lookup command dispatch
    action args

add :: [String] -> IO ()
add [fileName, todoItem] = appendFile fileName (todoItem ++ "\n")

-- ByteStrings
main = do
    (fileName1:fileName2:_) <- getArgs
    copyFile' fileName1 fileName2

copyFile' :: FilePath -> FilePath -> IO()
copyFile' source dest = do
    contents <- B.readFile source
    B.writeFile dest contents