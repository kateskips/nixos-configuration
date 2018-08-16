{-# LANGUAGE ScopedTypeVariables #-}
{-# LANGUAGE FlexibleContexts #-}
import XMonad

import XMonad.Hooks.ManageDocks
import XMonad.Hooks.ManageHelpers
import XMonad.Config.Gnome
import XMonad.Layout.NoBorders
import XMonad.Layout.LayoutModifier
import XMonad.Layout.ThreeColumns
import XMonad.Util.EZConfig         (additionalKeysP)
import System.Taffybar.Hooks.PagerHints (pagerHints)

import qualified Data.Map as M

import qualified XMonad.StackSet as W

myManageHook = manageDocks <+> composeAll
  [ (className =? "Gnome-panel" <&&> title =? "Run Application") --> doCenterFloat
  --, (className =? "Gcr-prompter")                                --> doCenterFloat
  --, (className =? "Xfce4-notifyd"                                -->  doIgnore)
  , isFullscreen                                                 --> doFullFloat
  ]

myWorkspaces = [
	 "0",  "1", "2", "3", "4", "5", "6", "7", "8", "9"
  -- , "10", "11","12","13","14","15","16","17","18","19"
  ]

myKeys (conf @ (XConfig {XMonad.modMask = modm})) = M.fromList $
  [ ((modm,               xK_p),   spawn "dmenu_run")
  , ((modm,               xK_F12), sendMessage ToggleStruts)
  , ((modm .|. shiftMask, xK_l),   spawn "gnome-screensaver-command -l")
  ]
  ++
  [ ((m .|. modm, k), windows $ f i) -- Replace 'mod1Mask' with your mod key of choice.
  | (i, k) <- zip myWorkspaces $ [xK_0 .. xK_9]
  , (f, m) <- [(W.greedyView, 0), (W.shift, shiftMask)]
  ]

main :: IO ()
main = xmonad $ pagerHints $ extend defaultConfig -- gnomeConfig
  where extend :: forall w
               .  LayoutClass w Window
               => XConfig w
               -> XConfig (ModifiedLayout SmartBorder (Choose ThreeCol (Choose ThreeCol w)))
        extend self = self
          { modMask            = mod4Mask
          , workspaces         = myWorkspaces
          , terminal           = "termite"
          , layoutHook         = smartBorders $ ThreeColMid 1 (3/100) (1/2) ||| ThreeCol 1 (3/100) (1/2) ||| layoutHook self
          , keys               = myKeys <+> keys self
          --, borderWidth        = 2
          --, normalBorderColor  = "#cccccc"
          --, focusedBorderColor = "#3300ff"
          , manageHook         = myManageHook <+> manageHook self
          }