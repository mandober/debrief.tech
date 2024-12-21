# vim --version

VIM - Vi IMproved 9.0 (2022 Jun 28, compiled May 10 2022 08:40:37)
Included patches: 1-749
Huge version without GUI.

Features included (+) or not (-):

+acl               +file_in_path      +mouse_urxvt       -tag_any_white
+arabic            +find_in_path      +mouse_xterm       +tcl
+autocmd           +float             +multi_byte        +termguicolors
+autochdir         +folding           +multi_lang        +terminal
-autoservername    -footer            -mzscheme          +terminfo
-balloon_eval      +fork()            +netbeans_intg     +termresponse
+balloon_eval_term +gettext           +num64             +textobjects
-browse            -hangul_input      +packages          +textprop
++builtin_terms    +iconv             +path_extra        +timers
+byte_offset       +insert_expand     +perl              +title
+channel           +ipv6              +persistent_undo   -toolbar
+cindent           +job               +popupwin          +user_commands
-clientserver      +jumplist          +postscript        +vartabs
-clipboard         +keymap            +printer           +vertsplit
+cmdline_compl     +lambda            +profile           +vim9script
+cmdline_hist      +langmap           -python            +viminfo
+cmdline_info      +libcall           +python3           +virtualedit
+comments          +linebreak         +quickfix          +visual
+conceal           +lispindent        +reltime           +visualextra
+cryptv            +listcmds          +rightleft         +vreplace
+cscope            +localmap          +ruby              +wildignore
+cursorbind        +lua               +scrollbind        +wildmenu
+cursorshape       +menu              +signs             +windows
+dialog_con        +mksession         +smartindent       +writebackup
+diff              +modify_fname      +sodium            -X11
+digraphs          +mouse             -sound             -xfontset
-dnd               -mouseshape        +spell             -xim
-ebcdic            +mouse_dec         +startuptime       -xpm
+emacs_tags        +mouse_gpm         +statusline        -xsmp
+eval              -mouse_jsbterm     -sun_workshop      -xterm_clipboard
+ex_extra          +mouse_netterm     +syntax            -xterm_save
+extra_search      +mouse_sgr         +tag_binary
-farsi             -mouse_sysmouse    -tag_old_static


## Init files
- system vimrc file:    $VIM/vimrc
- user vimrc file:      $HOME/.vimrc
- 2nd user vimrc file:  ~/.vim/vimrc
- user exrc file:       $HOME/.exrc
- defaults file:        $VIMRUNTIME/defaults.vim
- fall-back for $VIM:   /usr/share/vim


## Compilation

gcc
  -c
  -I.
  -Iproto
  -DHAVE_CONFIG_H
  -Wdate-time
  -g
  -O2
  -ffile-prefix-map=/build/vim-cdpF6P/vim-9.0.0749=.
  -flto=auto
  -ffat-lto-objects
  -flto=auto
  -ffat-lto-objects
  -fstack-protector-strong
  -Wformat
  -Werror=format-security
  -D_REENTRANT
  -U_FORTIFY_SOURCE
  -D_FORTIFY_SOURCE=1

## Linking

gcc
  -L.
  -Wl,-Bsymbolic-functions
  -Wl,-z,relro
  -Wl,-z,now
  -fstack-protector-strong
  -rdynamic
  -Wl,-export-dynamic
  -Wl,-E
  -Wl,-Bsymbolic-functions
  -flto=auto
  -ffat-lto-objects
  -flto=auto
  -Wl,-z,relro
  -Wl,-z,now
  -Wl,--as-needed
  -o vim
  -lm
  -ltinfo
  -lselinux
  -lsodium
  -lacl
  -lattr
  -lgpm
  -L/usr/lib
  -llua5.2
  -Wl,-E
  -fstack-protector-strong
  -L/usr/local/lib
  -L/usr/lib/x86_64-linux-gnu/perl/5.34/CORE
  -lperl
  -ldl
  -lm
  -lpthread
  -lcrypt
  -L/usr/lib/python3.10/config-3.10-x86_64-linux-gnu
  -lpython3.10
  -lcrypt
  -ldl
  -lm
  -lm
  -L/usr/lib/x86_64-linux-gnu
  -ltcl8.6
  -ldl
  -lz
  -lpthread
  -lm -lruby-3.0
  -lm -L/usr/lib
