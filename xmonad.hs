 import XMonad

 main = do
   xmonad $ defaultConfig
     { terminal    = myTerminal
     , modMask     = myModMask
     , borderWidth = myBorderWidth
     }

 -- 是的，这些也都是函数，只不过是简单函数
 -- 它们不接受输入变量，返回静态值
 myTerminal    = "st"
 myModMask     = mod4Mask -- Windows键或Super_L键
 myBorderWidth = 3
