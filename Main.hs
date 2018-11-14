
import qualified GitHub as GH

main :: IO()
main = do
     possibleUser <- GH.executeRequest' $ GH.userInfoR "walshk22"
     print possibleUser