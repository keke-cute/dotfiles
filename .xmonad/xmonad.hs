import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Util.EZConfig(additionalKeys)
import XMonad.Util.SpawnOnce
import XMonad.Hooks.SetWMName
import XMonad.Hooks.EwmhDesktops
-- The main function.
main = xmonad =<< statusBar myBar myPP toggleStrutsKey myConfig

-- Command to launch the bar.
myBar = "xmobar"

-- Custom PP, configure it as you like. It determines what is being written to the bar.
myPP = xmobarPP { ppCurrent = xmobarColor "#429942" "" . wrap "<" ">" }

-- Key binding to toggle the gap for the bar.
toggleStrutsKey XConfig {XMonad.modMask = modMask} = (modMask, xK_b)

-- Main configuration, override the defaults to your liking.
myConfig = defaultConfig
           {
             modMask = mod4Mask
             , terminal = "st"
             , borderWidth = 2
             , normalBorderColor = "#cccccc"
             , focusedBorderColor = "#cd8b00"
             , startupHook = myStartupHook
             , handleEventHook    = fullscreenEventHook
             } `additionalKeys`   
        [ ((mod4Mask .|. shiftMask, xK_z), spawn "xscreensaver-command -lock")
        , ((controlMask, xK_Print), spawn "sleep 0.2; scrot -s")
        , ((0, xK_Print), spawn "scrot")
        , ((mod4Mask, xK_d), spawn "rofi -combi-modi window,drun,ssh,run -theme lb -show combi")
        ]
           
myStartupHook = do
          spawnOnce "picom"
          spawnOnce "feh --bg-fill ~/Downloads/wall.png"
          setWMName "LG3D"
          spawnOnce "trayer --align right --SetDockType true --SetPartialStrut false --expand true --height 19 --transparent true --alpha 110 --tint 0x000000 --widthtype request"
          spawnOnce "start-pulseaudio-x11"
          spawnOnce "fcitx"
