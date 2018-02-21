module Lib
  ( requestBuses
  , getBusTimes
  ) where

import Network.HTTP.Req
import Text.XML.Light.Types
import Text.XML.Light.Proc
import Data.Text (Text)

rftaQueryUrl = http "www.myrfta.com" /: "bustime" /: "map" /: "getStopPredictions.jsp"

requestBuses params = req GET rftaQueryUrl NoReqBody bsResponse params

getBusTimes :: Maybe Element -> [String]
getBusTimes Nothing = []
getBusTimes (Just stop) = map strContent $ concatMap time $ pre stop
  where
    pre = findChildren $ QName "pre" Nothing Nothing
    time = findChildren $ QName "pt" Nothing Nothing
