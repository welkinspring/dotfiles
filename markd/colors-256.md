# how make 256 colors in putty/tmux/screen and vim:
There is a [detailed answer](http://stackoverflow.com/a/15378816/390643) on stackoverflow.
If you are looking for a short one, here it is.

- putty:
        set `Connenction -> Data -> Terminal-type string` to `xterm-256color`

- tmux:
        add this line to `~/.tmux.conf`
        ```
        set -g default-terminal "screen-256color"
        ```
- screen:

        add this line to `~/.screenrc`
        ```
        term "screen-256color"
        ```

- vim

        add these lines to `~/.vimrc`
        ```
        if &term == "screen"
                set t_Co=256
        endif
        ```
view actural 256 colors by this [script](https://gist.github.com/limingjie/036523669f428105ca81).
