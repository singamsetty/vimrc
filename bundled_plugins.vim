" ####################################################################################
" ############### All Vim plugins installed through Vim Plugin Manager ###############
" ####################################################################################
" list of all the plugins to be installed through vimplug
" thanks to https://github.com/junegunn/vim-plug

" ######################## set rtp+=~/.vim/vundle/Vundle.vim/ ########################
" set the runtime path to include Vundle and initializ
" set rtp+=~/.vim/bundle/vundle/
" ################################# call vundle#rc() #################################
" the vundle plugin is used only for initial installation of the vim plugin
" Bundle 'gmarik/vundle'

" Plugins section start {{{

"  syntax checking and code formatting with syntastic vim plugin
"  syntastic needs jshint for checking the javascript and inorder to include
"  the dependency, a function is defined here to handle the npm installation

function! InstallJsHint(info)
    if a:info.status == 'installed' || a:info.force
        !npm install -g jshint
    endif
endfunction

function! BuildTern(info)
    if a:info.status == 'installed' || a:info.force
        !npm install
    endif
endfunction

function! YCMBuilder(info)
    " info dictionary structure has following 3 fields
    " -- name: name of plugin
    " -- status: 'installed', 'updated', 'unchanged'
    " -- force: set with PlugInstall! or PlugUpdate!
    if a:info.status == 'installed' || a:info.force
        let $EXTRA_CMAKE_ARGS='-DEXTERNAL_LIBCLANG_PATH'
                    \ . '='
                    \ . '/opt/software/clang+llvm-3.9.0-x86_64-apple-darwin/lib/libclang.dylib'
        !python3 install.py --clang-completer --system-libclang --gocode-completer --tern-completer
    endif
endfunction

" -- syntax checkers
Plug 'scrooloose/syntastic', { 'do': function('InstallJsHint') }                " realtime syntax checker
Plug 'Chiel92/vim-autoformat'                                                   " easy code formatting in vim
Plug 'Shougo/neocomplete.vim'                                                   " neocompletion with cache (need lua support)
Plug 'Shougo/neoinclude.vim'                                                    " include completion framework for neocomplete
"Plug 'neocomplcache'                                                           " neo compile caching (using neocomplete for completion)

" -- utilities
Plug 'shougo/vimshell.vim'                                                      " shell in vim

" --- 3rd party color themes
Plug 'flazz/vim-colorschemes'                                                   " Color Schemes
Plug 'morhetz/gruvbox'                                                          " Retro groove color scheme
Plug 'trusktr/seti.vim'                                                         " seti colorscheme
Plug 'altercation/vim-colors-solarized'                                         " solarized color schemes
Plug 'baeuml/summerfruit256.vim'                                                " 256 color scheme
Plug 'junegunn/limelight.vim'                                                   " limelight theme
Plug 'jacoborus/tender.vim'                                                     " 24bit colorscheme for Vim, Airline
Plug 'kabbamine/yowish.vim'                                                     " A dark & yellowish vim colorscheme

" --- color scheme browsing helper
Plug 'ujihisa/unite-colorscheme'                                                " Unite color scheme browser

" --- code completion framework
Plug 'maralla/completor.vim'                                                    " async completion framework

" --- the right way to handle trailing-whitespace
Plug 'bronson/vim-trailing-whitespace'                                          " remove trailing white spaces

" --- File Exploring
Plug 'scrooloose/nerdtree' , { 'on': ['NERDTreeToggle', 'NERDTreeFind'] }       " NERDTree file browser, Undo list
Plug 'jistr/vim-nerdtree-tabs'                                                  " NERDTree and tabs together

" --- depending on your vimproc location
" --- you have to go to .vim/plugin/vimproc.vim and do a ./make
Plug 'Shougo/vimproc.vim', { 'do': 'make' }                                     " vimproc
Plug 'Shougo/unite.vim'                                                         " unite
Plug 'shougo/denite.nvim'                                                       " nexgen unite
Plug 'Shougo/unite-outline'                                                     " outline source for unite
Plug 'mhinz/vim-startify'                                                       " fancy start screen for vim

" --- for commenting the code
Plug 'scrooloose/nerdcommenter'                                                 " intensely orgasmic commenting

" --- source code control, git integration
Plug 'tpope/vim-fugitive'                                                       " git integration
Plug 'airblade/vim-gitgutter'                                                   " show which line changed using git
Plug 'mhinz/vim-signify'                                                        " show diff via vim sign column

" --- for aligning the code and or text manipulation
Plug 'junegunn/vim-easy-align', { 'on': ['<Plug>(EasyAlign)', 'EasyAlign']  }   " text and code alignment
Plug 'godlygeek/tabular'                                                        " text filtering and alignment
Plug 'nathanaelkane/vim-indent-guides'                                          " vim indentation display
Plug 'ervandew/supertab'                                                        " use TAB for all insertions

" --- for haskell language auto-complete, syntax and code check
" --- load these plugins only while opening haskell code or source
Plug 'neovimhaskell/haskell-vim', { 'for': 'haskell' }                          " syntax indentation / highlight
Plug 'enomsg/vim-haskellConcealPlus', { 'for': 'haskell' }                      " unicode for concealing haskell operators
Plug 'eagletmt/ghcmod-vim', { 'for': 'haskell' }                                " ghcmod for haskell in vim
Plug 'eagletmt/neco-ghc', { 'for': 'haskell' }                                  " ghc haskell
Plug 'Twinside/vim-hoogle', { 'for': 'haskell' }                                " Hoogle haskell search
Plug 'pbrisbin/html-template-syntax', { 'for': 'haskell' }                      " Yesod templates
Plug 'bitc/vim-hdevtools', { 'for': 'haskell' }                                 " HDevTools for Haskell
Plug 'nbouscal/vim-stylish-haskell', { 'for': 'haskell' }                       " Stylish Haskell
Plug 'mpickering/hlint-refactor-vim', { 'for': 'haskell' }                      " Hlint refactor
Plug 'itchyny/vim-haskell-indent', { 'for': 'haskell'}                          " haskell indent plugin
Plug 'dan-t/vim-hsimport', {'for': 'haskell'}                                   " plugin for hsimport
"Plug 'dag/vim2hs'                                                              " vimscripts for haskell development


" --- for idris language syntax
Plug 'idris-hackers/idris-vim'                                                  " idris language support


" --- for agda language support
Plug 'rking/ag.vim'                                                             " AGDA language


" --- for elm-lang scripting support
Plug 'lambdatoast/elm.vim'                                                      " elm scripting language


" --- for some eye candies like status bars and colors
"Plug 'bling/vim-airline'                                                       " using vim-airline repo
"Plug 'bling/vim-bufferline'                                                    " show number of buffers
Plug 'vim-airline/vim-airline'                                                  " Airline statusbar
Plug 'vim-airline/vim-airline-themes'                                           " Airline themes
Plug 'osyo-manga/unite-airline_themes'                                          " preview airline themes
Plug 'majutsushi/tagbar'                                                        " tagbar support


" --- for rainbow parenthesis colorful brackets
Plug 'kien/rainbow_parentheses.vim'                                             " rainbow parenthesis


" --- for clojure language auto-completion, syntax and formatting
Plug 'guns/vim-clojure-static', { 'for': 'clojure' }                            " clojure support
Plug 'venantius/vim-cljfmt', { 'for': 'clojure' }                               " clojure formatting tool
Plug 'venantius/vim-eastwood', { 'for': 'clojure'}                              " clojure lint tool
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }                                " clojure support
Plug 'kovisoft/paredit', { 'for': ['clojure', 'scheme'] }                       " clojure and scheme support


" --- for GO language
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }                             " go development support

" --- some utilities
Plug 'guns/vim-sexp'                                                            " vim expression support
Plug 'tpope/vim-repeat'                                                         " vim repeat the last command on
Plug 'tpope/vim-surround'                                                       " parenthesizing made simple
Plug 'tpope/vim-unimpaired'                                                     " pairs of handy bracket mappings
Plug 'gorkunov/smartpairs.vim'                                                  " fantastic selection for vim
" --- vim-fireplace dependencies
"Plug 'tpope/vim-classpath'                                                     " vim classpath
"Plug 'jpalardy/vim-slime'                                                      " slime for vim
Plug 'beloglazov/vim-online-thesaurus'                                          " word lookup in online thesaurus (-K)
Plug 'thinca/vim-ref'                                                           " integrated reference viewer
Plug 'jceb/vim-hier'                                                            " hl quickfix errors


" --- for java script syntax check and auto-completions
Plug 'maksimr/vim-jsbeautify', { 'for': 'javascript' }                          " beautify js
Plug 'pangloss/vim-javascript', { 'for': 'javascript' }                         " js for vim
Plug 'jelera/vim-javascript-syntax', { 'for': 'javascript' }                    " enhanced js syntax
" yet another js and its dependency es.next with lazy loading only for js
Plug 'othree/yajs.vim' | Plug 'othree/es.next.syntax.vim', { 'for': 'javascript' }
Plug 'othree/jspc.vim', { 'for': ['javascript', 'javascript.jsx'] }             " js param complete
Plug 'einars/js-beautify', { 'for': 'javascript' }                              " js beautify
"Plug 'bigfish/vim-js-context-coloring', { 'for': 'javascript' }                " js highlight, context & coloring
" --- extends syntax for js with jQuery,backbone,etc
Plug 'mxw/vim-jsx'                                                              " json/js support
Plug 'elzr/vim-json'                                                            " json highlighting
Plug 'othree/javascript-libraries-syntax.vim'                                   " js syntax check and library support
Plug 'marijnh/tern_for_vim', { 'do': function('BuildTern') }                    " tern plugin for vim js
Plug 'shutnik/jshint2.vim', { 'for': 'javascript' }                             " JSHint integration
Plug 'heavenshell/vim-jsdoc'                                                    " Generate JSDoc to your JavaScript code
Plug 'moll/vim-node', { 'for': 'javascript' }                                   " Tools & Env for node.js
Plug 'ahayman/vim-nodejs-complete'                                              " nodejs omnifunc


" for erlang language auto-completions, syntax check and support
Plug 'vim-erlang/vim-erlang-runtime', { 'for': 'erlang' }                       " erlang indentation, syntax
Plug 'vim-erlang/vim-erlang-omnicomplete', { 'for': 'erlang' }                  " erlang code auto completion
Plug 'vim-erlang/vim-erlang-compiler', { 'for': 'erlang' }                      " erlang syntax checker, compiler
Plug 'youthy/vimerl-complete', { 'for': 'erlang' }                              " erlang auto complete
Plug 'vim-erlang/vim-erlang-skeletons', { 'for': 'erlang' }                     " erlang templates
Plug 'akalyaev/vim-erlang-spec', { 'for': 'erlang' }                            " erlang generate specifications


" --- allow pane movement to jump out of vim into tmux navigator
Plug 'christoomey/vim-tmux-navigator'                                           " terminal multiplex

" --- display all the leader mappings with descriptions
Plug 'ktonga/vim-follow-my-lead'

" --- for scala language auto-complete, syntax and support
Plug 'derekwyatt/vim-scala', { 'for': 'scala'}                                  " scala support
"Plug 'ensime/ensime-vim'                                                       " ensime for scala auto-complete
                                                                                " it uses python2 | commented


" --- for html, xml ... syntax, validation etc.
Plug 'mattn/emmet-vim'                                                          " emmet for vim
Plug 'othree/html5.vim'                                                         " html5 support
Plug 'othree/xml.vim', { 'for': 'xml' }                                         " xml support
Plug 'sukima/xmledit'                                                           " xml editor
Plug 'vim-scripts/xslt'                                                         " xslt ftplugin
Plug 'Valloric/MatchTagAlways'                                                  " highlight matching tags on markup languages


" --- for c/c++ language support (load on demand only)
Plug 'justmao945/vim-clang', { 'for': ['cpp','c'] }                             " clang completion plugin for vim
Plug 'octol/vim-cpp-enhanced-highlight', { 'for': 'cpp' }                       " additional vim syntax highlighting
Plug 'vim-scripts/DoxygenToolkit.vim', { 'for': 'cpp' }                         " doxygen documentation
Plug 'myint/clang-complete', { 'for': ['cpp','c']}                              " using fork for python3 support
Plug 'osyo-manga/vim-marching'                                                  " async clang code completion
Plug 'vim-scripts/c.vim', { 'for': ['c','cpp'] }                                " c/cpp ide
Plug 'rhysd/vim-clang-format', { 'on': 'ClangFormat' }                          " a formatter for C, C++, Obj-C, Java, JS and TypeScript
Plug 'derekwyatt/vim-protodef', { 'for': 'cpp' }                                " pull c++ function prototypes

" --- TeX file editing
Plug 'lervag/vimtex'                                                            " editing LaTeX files

" --- miscellaneous utilities
Plug 'matze/vim-move'                                                           " move lines and selections
Plug 'edkolev/promptline.vim'                                                   " promptline
Plug 'kien/ctrlp.vim'                                                           " fuzzy file, buffer, mru, tag etc
Plug 'vim-ctrlspace/vim-ctrlspace'                                              " tabs/buffers/file management
Plug 'tyru/current-func-info.vim'                                               " get current function name
Plug 'jiangmiao/auto-pairs'                                                     " parenthesis auto parentheses pairing
Plug 'Raimondi/delimitMate'                                                     " auto quotes, parens, brackets, etc
Plug 'editorconfig/editorconfig-vim'                                            " editorconfg


" --- plugins for vim textual snippets supporting code auto completion
Plug 'tomtom/tlib_vim'                                                          " for snippets
Plug 'MarcWeber/vim-addon-mw-utils'                                             " for snippets
Plug 'garbas/vim-snipmate'                                                      " for snippets
Plug 'SirVer/ultisnips'                                                         " for snippets
Plug 'honza/vim-snippets'                                                       " vim-snippets depends on ultisnippets
"Plug 'hecal3/vim-leader-guide'                                                 " vim keymap-display


" --- Plugins for multiple text selection
Plug 'terryma/vim-multiple-cursors'                                             " vim multiple cursors


" --- Plugins for text visualization
Plug 'osyo-manga/vim-brightest'                                                 " highlight cursor word


" --- for elixir auto-complete syntax checking and development
Plug 'elixir-lang/vim-elixir'                                                   " vim for elixir
Plug 'slashmili/alchemist.vim'                                                  " elixir integration for vim


" --- for documentation purposes and writing
Plug 'vim-pandoc/vim-pandoc'                                                    " pandoc integration and utilities
Plug 'vim-pandoc/vim-pandoc-syntax'                                             " pandoc markdown syntax
Plug 'xolox/vim-notes' | Plug 'xolox/vim-misc'                                  " easy note taking


" --- for python/python3 language auto-completion
" --- syntax checking, highlighting and more
Plug 'vim-scripts/python.vim--Vasiliev'                                         " enhanced python syntax highlighting
Plug 'davidhalter/jedi-vim'                                                     " python jedi auto-completion (the best)
Plug 'hynek/vim-python-pep8-indent', { 'for':'python' }                         " python indentation style for vim
"Plug 'lambdalisue/vim-pyenv'                                                   " python virtual env (if required)
Plug 'tell-k/vim-autopep8'                                                      " autopep8 plugin for python

" --- ycm being used only under gui mode for MacVim
if has("gui_running")
    Plug 'valloric/youcompleteme', { 'do': function('YCMBuilder'), 'for': [ 'cpp', 'python', 'go' ] }
endif

" end of plugin section }}}
" =======================================================================================================
