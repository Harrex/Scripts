#!/bin/sh

# Use this for FCITX5
case $(qdbus "org.fcitx.Fcitx5" "/controller" "org.fcitx.Fcitx.Controller1.CurrentInputMethod") in
    "mozc")
        echo " "
        ;;
    *)
        echo "󰬴 "
        ;;
esac

