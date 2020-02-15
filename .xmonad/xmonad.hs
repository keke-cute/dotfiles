import XMonad

main = xmonad $ def
	{ borderWidth	= 2
	, terminal	= "st"
	, modMask	= mod4Mask
	, normalBorderColor	= "#cccccc"
	, focusedBorderColor = "#cd8b00" }

