export TERM=xterm-256color

   # Change the TERM environment variable (to get 256 colors) and make Vim
   # connecting to X Server even if running in a terminal emulator (many of
   # the plugin features depend on this).
   if [ "x$DISPLAY" != "x" ]
   then
       if [ "screen" = "$TERM" ]
       then
           export TERM=screen-256color
       else
           export TERM=xterm-256color
       fi
       alias vim='vim --servername VIM'
   fi

PATH=$HOME/.local/bin:$PATH
PATH=$HOME/.cabal/bin:$PATH

# added by Anaconda3 2.2.0 installer
export PATH="/home/darius/anaconda3/bin:$PATH"

