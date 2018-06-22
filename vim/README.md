## Changelist
1. init vim-install.sh to welkinspring github url and vim-plug, please not change this names.
2. remove fork mantianer
3. the load order for the configuation:
    vim-install.sh
        1. .vimrc.init
        2. .vimrc.before
        3. .vimrc.plugs
        4. .vimrc
        5. .vimrc.local

4. TBD
cfg_plugin_groups = {}  select plugins
let g:cfg_plugin_groups=['smartcomplete', 'python', 'php', 'javascript', 'html','airline']
