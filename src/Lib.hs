module Lib
  ( requestBuses
  , getBusTimes
  ) where

import           Data.Text            (Text)
import           Network.HTTP.Req
import           Text.XML.Light.Proc
import           Text.XML.Light.Types

rftaQueryUrl =
  http "www.myrfta.com" /: "bustime" /: "map" /: "getStopPredictions.jsp"

requestBuses params = req GET rftaQueryUrl NoReqBody bsResponse params

getBusTimes :: Maybe Element -> [String]
getBusTimes Nothing = []
getBusTimes (Just stop) = map strContent $ concatMap (tag "pt") $ tag "pre" stop

tag :: String -> Element -> [Element]
tag name = findChildren $ QName name Nothing Nothing
