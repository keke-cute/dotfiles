------------------------------------------------------------------------
---IMPORTS
------------------------------------------------------------------------
    -- Base
import XMonad
import XMonad.Config
    -- Utilities
import XMonad.Util.EZConfig (additionalKeysP, additionalMouseBindings)
    -- Hooks
import XMonad.Hooks.DynamicLog
    -- Layouts modifiers
import XMonad.Layout.Spacing (spacing) 
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
  , normalBorderColor  = "#292d3e"
  , focusedBorderColor = "#bbc5ff"
  , layoutHook = spacing 2 $ Tall 1 (3/100) (1/2)
  }  `additionalKeysP`         myKeys 
myKeys =
        [
          ("M-<Space>", spawn "rofi -font \"Operator Mono Book 15\" -combi-modi window,drun,ssh,run -theme lb -show combi")
        ]
