export QT_STYLE_OVERRIDE=gtk
export ANDROID_HOME=/home/kenny/usr/android/android-sdk
export ANDROID_NDK=/home/kenny/usr/android/android-ndk

path+=~/bin
path+=~/.local/bin
path+=~/.cabal/bin
path+=$ANDROID_HOME/platform-tools
path+=$ANDROID_HOME/tools
path+=$ANDROID_NDK
typeset -U path

