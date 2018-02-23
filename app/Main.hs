module Main where

import           Control.Monad.IO.Class
import           Data.Default.Class
import           Data.Monoid
import           Lib
import           Network.HTTP.Req
import           System.Environment
import           Text.XML.Light.Input

main :: IO ()
main =
  runReq def $ do
    (busStop:busRoute:_) <- liftIO getArgs
    let stopParam = "stop" =: busStop
    let routeParam = "route" =: busRoute
    r <- requestBuses (stopParam <> routeParam)
    let times = getBusTimes $ parseXMLDoc $ responseBody r
    liftIO $ mapM_ putStrLn times
