# step 1: update the following released software links:
wget https://github.com/tmux/tmux/releases/download/2.7/tmux-2.7.tar.gz
wget https://github.com/libevent/libevent/releases/download/release-2.1.8-stable/libevent-2.1.8-stable.tar.gz
wget http://ftp.gnu.org/gnu/ncurses/ncurses-6.1.tar.gz

# step 2: config software and install

# 2.a :libevent
	./configure --prefix=$HOME/local --disable-shared
	make
	make install

# 2.b :ncurses
	./configure --prefix=$HOME/local
	make
	make install

# 2.c :tmux
./configure CFLAGS="-I$HOME/local/include -I$HOME/local/include/ncurses" LDFLAGS="-L$HOME/local/lib -L$HOME/local/include/ncurses -L$HOME/local/include" CPPFLAGS="-I$HOME/local/include -I$HOME/local/include/ncurses" LDFLAGS="-static -L$HOME/local/include -L$HOME/local/include/ncurses -L$HOME/local/lib" 
make
cp tmux $HOME/local/bin

# step 3: config environment in .bashrc file and source .bashrc
export PATH="$HOME/local/bin:$PATH"

# ------------------------------------------------------------------------
# refer script for auto setup tmux.
#!/bin/bash

# script for installing tmux on systems where you don't have root access.
# tmux will be installed in $HOME/local/bin.
# It's assumed that wget and a C/C++ compiler are installed.

# exit on error
set -e

TMUX_VERSION=2.7
LIBEVENT_VER=2.1.8
NCURSES_VER=5.9
 
# create our directories
mkdir -p $HOME/local $HOME/tmux_tmp
cd $HOME/tmux_tmp
  
# download source files for tmux, libevent, and ncurses
wget http://ftp.gnu.org/gnu/ncurses/ncurses-${NCURSES_VER}.tar.gz
wget https://github.com/libevent/libevent/releases/download/release-${LIBEVENT_VER}-stable/libevent-${LIBEVENT_VER}-stable.tar.gz
wget https://github.com/tmux/tmux/releases/download/${TMUX_VERSION}/tmux-${TMUX_VERSION}.tar.gz
   
# extract files, configure, and compile

############
# libevent #
############
tar xvzf libevent-${LIBEVENT_VER}-stable.tar.gz
cd libevent-${LIBEVENT_VER}-stable
./configure --prefix=$HOME/local --disable-shared
make
make install
cd ..
 
############
# ncurses #
############
 tar xvzf ncurses-${NCURSES_VER}.tar.gz
 cd ncurses-${NCURSES_VER}
 ./configure --prefix=$HOME/local
 make
 make install
 cd ..
  
############
# tmux #
############
tar xvzf tmux-${TMUX_VERSION}.tar.gz
cd tmux-${TMUX_VERSION}
./configure CFLAGS="-I$HOME/local/include -I$HOME/local/include/ncurses" LDFLAGS="-L$HOME/local/lib -L$HOME/local/include/ncurses -L$HOME/local/include"
CPPFLAGS="-I$HOME/local/include -I$HOME/local/include/ncurses" LDFLAGS="-static -L$HOME/local/include -L$HOME/local/include/ncurses -L$HOME/local/lib" make
cp tmux $HOME/local/bin
cd ..
   
# cleanup
rm -rf $HOME/tmux_tmp
    
echo "$HOME/local/bin/tmux is now available. You can optionally add $HOME/local/bin to your PATH."
# ------------------------------------------------------------------------
