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
