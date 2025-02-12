;; -*- mode: emacs-lisp; lexical-binding: t -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Layer configuration:
This function should only modify configuration layer settings."
  (setq-default
   ;; Base distribution to use. This is a layer contained in the directory
   ;; `+distribution'. For now available distributions are `spacemacs-base'
   ;; or `spacemacs'. (default 'spacemacs)
   dotspacemacs-distribution 'spacemacs

   ;; Lazy installation of layers (i.e. layers are installed only when a file
   ;; with a supported type is opened). Possible values are `all', `unused'
   ;; and `nil'. `unused' will lazy install only unused layers (i.e. layers
   ;; not listed in variable `dotspacemacs-configuration-layers'), `all' will
   ;; lazy install any layer that support lazy installation even the layers
   ;; listed in `dotspacemacs-configuration-layers'. `nil' disable the lazy
   ;; installation feature and you have to explicitly list a layer in the
   ;; variable `dotspacemacs-configuration-layers' to install it.
   ;; (default 'unused)
   dotspacemacs-enable-lazy-installation 'unused

   ;; If non-nil then Spacemacs will ask for confirmation before installing
   ;; a layer lazily. (default t)
   dotspacemacs-ask-for-lazy-installation t

   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '()

   ;; List of configuration layers to load.
   dotspacemacs-configuration-layers
   '(csv
     auto-completion
     ;; rust
     ;; ----------------------------------------------------------------
     ;; Example of useful layers you may want to use right away.
     ;; Uncomment some layer names and press `SPC f e R' (Vim style) or
     ;; `M-m f e R' (Emacs style) to install them.
     ;; ----------------------------------------------------------------
     ;; better-defaults
     clojure
     (clojure :variables
              clojure-backend 'cider
              clojure-enable-clj-refactor t
              clojure-enable-linters 'clj-kondo)
     ;; (clojure :variables clojure-enable-clj-refactor t))
     emacs-lisp
     git
     helm
     html
     ;; java
     ;; k-framework
     ;; lang
     ;; lsp
     markdown
     ;; mathematica
     ;; mermaid
     ;; multiple-cursors
     org
     pdf
     python

     ;; (shell :variables
     ;;        shell-default-height 30
     ;;        shell-default-position 'bottom)

     ;; ruby
     ;; sayid
     spell-checking
     syntax-checking
     ;; version-control
     themes-megapack
     treemacs
     yaml
     )


   ;; List of additional packages that will be installed without being wrapped
   ;; in a layer (generally the packages are installed only and should still be
   ;; loaded using load/require/use-package in the user-config section below in
   ;; this file). If you need some configuration for these packages, then
   ;; consider creating a layer. You can also put the configuration in
   ;; `dotspacemacs/user-config'. To use a local version of a package, use the
   ;; `:location' property: '(your-package :location "~/path/to/your-package/")
   ;; Also include the dependencies as they will not be resolved automatically.
   dotspacemacs-additional-packages '(
                                      clj-refactor
                                      exec-path-from-shell
                                      figlet
                                      flyspell
                                      geiser-mit
                                      geiser-racket
                                      haskell-mode
                                      mermaid-mode
                                      modus-themes
                                      ob-mermaid
                                      quack
                                      racket-mode
                                      rst
                                      slime
                                      wolfram-mode
                                      yasnippet
                                      )

   ;; A list of packages that cannot be updated.
   dotspacemacs-frozen-packages '()

   ;; A list of packages that will not be installed and loaded.
   dotspacemacs-excluded-packages '()

   ;; Defines the behaviour of Spacemacs when installing packages.
   ;; Possible values are `used-only', `used-but-keep-unused' and `all'.
   ;; `used-only' installs only explicitly used packages and deletes any unused
   ;; packages as well as their unused dependencies. `used-but-keep-unused'
   ;; installs only the used packages but won't delete unused ones. `all'
   ;; installs *all* packages supported by Spacemacs and never uninstalls them.
   ;; (default is `used-only')
   dotspacemacs-install-packages 'used-only))

(defun dotspacemacs/init ()
  "Initialization:
This function is called at the very beginning of Spacemacs startup,
before layer configuration.
It should only modify the values of Spacemacs settings."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; If non-nil then enable support for the portable dumper. You'll need
   ;; to compile Emacs 27 from source following the instructions in file
   ;; EXPERIMENTAL.org at to root of the git repository.
   ;; (default nil)
   dotspacemacs-enable-emacs-pdumper nil

   ;; Name of executable file pointing to emacs 27+. This executable must be
   ;; in your PATH.
   ;; (default "emacs")
   dotspacemacs-emacs-pdumper-executable-file "emacs"

   ;; Name of the Spacemacs dump file. This is the file will be created by the
   ;; portable dumper in the cache directory under dumps sub-directory.
   ;; To load it when starting Emacs add the parameter `--dump-file'
   ;; when invoking Emacs 27.1 executable on the command line, for instance:
   ;;   ./emacs --dump-file=$HOME/.emacs.d/.cache/dumps/spacemacs-27.1.pdmp
   ;; (default (format "spacemacs-%s.pdmp" emacs-version))
   dotspacemacs-emacs-dumper-dump-file (format "spacemacs-%s.pdmp" emacs-version)

   ;; If non-nil ELPA repositories are contacted via HTTPS whenever it's
   ;; possible. Set it to nil if you have no way to use HTTPS in your
   ;; environment, otherwise it is strongly recommended to let it set to t.
   ;; This variable has no effect if Emacs is launched with the parameter
   ;; `--insecure' which forces the value of this variable to nil.
   ;; (default t)
   dotspacemacs-elpa-https t

   ;; Maximum allowed time in seconds to contact an ELPA repository.
   ;; (default 5)
   dotspacemacs-elpa-timeout 5

   ;; Set `gc-cons-threshold' and `gc-cons-percentage' when startup finishes.
   ;; This is an advanced option and should not be changed unless you suspect
   ;; performance issues due to garbage collection operations.
   ;; (default '(100000000 0.1))
   dotspacemacs-gc-cons '(100000000 0.1)

   ;; Set `read-process-output-max' when startup finishes.
   ;; This defines how much data is read from a foreign process.
   ;; Setting this >= 1 MB should increase performance for lsp servers
   ;; in emacs 27.
   ;; (default (* 1024 1024))
   dotspacemacs-read-process-output-max (* 1024 1024)

   ;; If non-nil then Spacelpa repository is the primary source to install
   ;; a locked version of packages. If nil then Spacemacs will install the
   ;; latest version of packages from MELPA. Spacelpa is currently in
   ;; experimental state please use only for testing purposes.
   ;; (default nil)
   dotspacemacs-use-spacelpa nil

   ;; If non-nil then verify the signature for downloaded Spacelpa archives.
   ;; (default t)
   dotspacemacs-verify-spacelpa-archives t

   ;; If non-nil then spacemacs will check for updates at startup
   ;; when the current branch is not `develop'. Note that checking for
   ;; new versions works via git commands, thus it calls GitHub services
   ;; whenever you start Emacs. (default nil)
   dotspacemacs-check-for-update nil

   ;; If non-nil, a form that evaluates to a package directory. For example, to
   ;; use different package directories for different Emacs versions, set this
   ;; to `emacs-version'. (default 'emacs-version)
   dotspacemacs-elpa-subdirectory 'emacs-version

   ;; One of `vim', `emacs' or `hybrid'.
   ;; `hybrid' is like `vim' except that `insert state' is replaced by the
   ;; `hybrid state' with `emacs' key bindings. The value can also be a list
   ;; with `:variables' keyword (similar to layers). Check the editing styles
   ;; section of the documentation for details on available variables.
   ;; (default 'vim)
   dotspacemacs-editing-style 'emacs

   ;; If non-nil show the version string in the Spacemacs buffer. It will
   ;; appear as (spacemacs version)@(emacs version)
   ;; (default t)
   dotspacemacs-startup-buffer-show-version t

   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed. (default 'official)
   dotspacemacs-startup-banner 0  ;; 'official

   ;; List of items to show in startup buffer or an association list of
   ;; the form `(list-type . list-size)`. If nil then it is disabled.
   ;; Possible values for list-type are:
   ;; `recents' `bookmarks' `projects' `agenda' `todos'.
   ;; List sizes may be nil, in which case
   ;; `spacemacs-buffer-startup-lists-length' takes effect.
   ;; The exceptional case is `recents-by-project', where list-type must be a
   ;; pair of numbers, e.g. `(recents-by-project . (7 .  5))', where the first
   ;; number is the project limit and the second the limit on the recent files
   ;; within a project.
   dotspacemacs-startup-lists '((recents . 15)
                                (projects . 7))

   ;; True if the home buffer should respond to resize events. (default t)
   dotspacemacs-startup-buffer-responsive t

   ;; Show numbers before the startup list lines. (default t)
   dotspacemacs-show-startup-list-numbers t

   ;; The minimum delay in seconds between number key presses. (default 0.4)
   dotspacemacs-startup-buffer-multi-digit-delay 0.4

   ;; Default major mode for a new empty buffer. Possible values are mode
   ;; names such as `text-mode'; and `nil' to use Fundamental mode.
   ;; (default `text-mode')
   dotspacemacs-new-empty-buffer-major-mode 'text-mode

   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'text-mode

   ;; If non-nil, *scratch* buffer will be persistent. Things you write down in
   ;; *scratch* buffer will be saved and restored automatically.
   dotspacemacs-scratch-buffer-persistent nil

   ;; If non-nil, `kill-buffer' on *scratch* buffer
   ;; will bury it instead of killing.
   dotspacemacs-scratch-buffer-unkillable nil

   ;; Initial message in the scratch buffer, such as "Welcome to Spacemacs!"
   ;; (default nil)
   dotspacemacs-initial-scratch-message nil

   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press `SPC T n' to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(
                         ;; gruvbox-dark-hard
                         ;; gruvbox-light-hard
                         modus-vivendi
                         modus-operandi
                         ;; material
                         ;; material-light
                         ;; spacemacs-dark
                         ;; spacemacs-light
                         )

   ;; Set the theme for the Spaceline. Supported themes are `spacemacs',
   ;; `all-the-icons', `custom', `doom', `vim-powerline' and `vanilla'. The
   ;; first three are spaceline themes. `doom' is the doom-emacs mode-line.
   ;; `vanilla' is default Emacs mode-line. `custom' is a user defined themes,
   ;; refer to the DOCUMENTATION.org for more info on how to create your own
   ;; spaceline theme. Value can be a symbol or list with additional properties.
   ;; (default '(spacemacs :separator wave :separator-scale 1.5))
   dotspacemacs-mode-line-theme 'spacemacs ;; 'doom ;; 'vim-powerline ;; 'all-the-icons ;; '(spacemacs :separator wave :separator-scale 1.5)

   ;; If non-nil the cursor color matches the state color in GUI Emacs.
   ;; (default t)
   dotspacemacs-colorize-cursor-according-to-state t

   ;; Default font or prioritized list of fonts. The `:size' can be specified as
   ;; a non-negative integer (pixel size), or a floating-point (point size).
   ;; Point size is recommended, because it's device independent. (default 10.0)
   dotspacemacs-default-font '(
                               ; "JetBrainsMono Nerd Font Mono"
                               ; "Andale Mono"
                               ; "Source Code Pro"
                               "Fira Code Retina"
                               :size 16
                               :weight normal ; bold
                               :width normal)

   ;; The leader key (default "SPC")
   dotspacemacs-leader-key "SPC"

   ;; The key used for Emacs commands `M-x' (after pressing on the leader key).
   ;; (default "SPC")
   dotspacemacs-emacs-command-key "SPC"

   ;; The key used for Vim Ex commands (default ":")
   dotspacemacs-ex-command-key ":"

   ;; The leader key accessible in `emacs state' and `insert state'
   ;; (default "M-m")
   dotspacemacs-emacs-leader-key "M-m"

   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it. (default ",")
   dotspacemacs-major-mode-leader-key ","

   ;; Major mode leader key accessible in `emacs state' and `insert state'.
   ;; (default "C-M-m" for terminal mode, "<M-return>" for GUI mode).
   ;; Thus M-RET should work as leader key in both GUI and terminal modes.
   ;; C-M-m also should work in terminal mode, but not in GUI mode.
   dotspacemacs-major-mode-emacs-leader-key (if window-system "<M-return>" "C-M-m")

   ;; These variables control whether separate commands are bound in the GUI to
   ;; the key pairs `C-i', `TAB' and `C-m', `RET'.
   ;; Setting it to a non-nil value, allows for separate commands under `C-i'
   ;; and TAB or `C-m' and `RET'.
   ;; In the terminal, these pairs are generally indistinguishable, so this only
   ;; works in the GUI. (default nil)
   dotspacemacs-distinguish-gui-tab nil

   ;; Name of the default layout (default "Default")
   dotspacemacs-default-layout-name "Default"

   ;; If non-nil the default layout name is displayed in the mode-line.
   ;; (default nil)
   dotspacemacs-display-default-layout nil

   ;; If non-nil then the last auto saved layouts are resumed automatically upon
   ;; start. (default nil)
   dotspacemacs-auto-resume-layouts nil

   ;; If non-nil, auto-generate layout name when creating new layouts. Only has
   ;; effect when using the "jump to layout by number" commands. (default nil)
   dotspacemacs-auto-generate-layout-names nil

   ;; Size (in MB) above which spacemacs will prompt to open the large file
   ;; literally to avoid performance issues. Opening a file literally means that
   ;; no major mode or minor modes are active. (default is 1)
   dotspacemacs-large-file-size 1

   ;; Location where to auto-save files. Possible values are `original' to
   ;; auto-save the file in-place, `cache' to auto-save the file to another
   ;; file stored in the cache directory and `nil' to disable auto-saving.
   ;; (default 'cache)
   dotspacemacs-auto-save-file-location 'cache

   ;; Maximum number of rollback slots to keep in the cache. (default 5)
   dotspacemacs-max-rollback-slots 5

   ;; If non-nil, the paste transient-state is enabled. While enabled, after you
   ;; paste something, pressing `C-j' and `C-k' several times cycles through the
   ;; elements in the `kill-ring'. (default nil)
   dotspacemacs-enable-paste-transient-state nil

   ;; Which-key delay in seconds. The which-key buffer is the popup listing
   ;; the commands bound to the current keystroke sequence. (default 0.4)
   dotspacemacs-which-key-delay 0.4

   ;; Which-key frame position. Possible values are `right', `bottom' and
   ;; `right-then-bottom'. right-then-bottom tries to display the frame to the
   ;; right; if there is insufficient space it displays it at the bottom.
   ;; (default 'bottom)
   dotspacemacs-which-key-position 'bottom

   ;; Control where `switch-to-buffer' displays the buffer. If nil,
   ;; `switch-to-buffer' displays the buffer in the current window even if
   ;; another same-purpose window is available. If non-nil, `switch-to-buffer'
   ;; displays the buffer in a same-purpose window even if the buffer can be
   ;; displayed in the current window. (default nil)
   dotspacemacs-switch-to-buffer-prefers-purpose nil

   ;; If non-nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil to boost the loading time. (default t)
   dotspacemacs-loading-progress-bar t

   ;; If non-nil the frame is fullscreen when Emacs starts up. (default nil)
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup nil

   ;; If non-nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX. (default nil)
   dotspacemacs-fullscreen-use-non-native nil

   ;; If non-nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (default nil) (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup nil

   ;; If non-nil the frame is undecorated when Emacs starts up. Combine this
   ;; variable with `dotspacemacs-maximized-at-startup' in OSX to obtain
   ;; borderless fullscreen. (default nil)
   dotspacemacs-undecorated-at-startup nil

   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-active-transparency 90

   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-inactive-transparency 90

   ;; If non-nil show the titles of transient states. (default t)
   dotspacemacs-show-transient-state-title t

   ;; If non-nil show the color guide hint for transient state keys. (default t)
   dotspacemacs-show-transient-state-color-guide t

   ;; If non-nil unicode symbols are displayed in the mode line.
   ;; If you use Emacs as a daemon and wants unicode characters only in GUI set
   ;; the value to quoted `display-graphic-p'. (default t)
   dotspacemacs-mode-line-unicode-symbols nil ;; t

   ;; If non-nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters point
   ;; when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling t

   ;; Show the scroll bar while scrolling. The auto hide time can be configured
   ;; by setting this variable to a number. (default t)
   dotspacemacs-scroll-bar-while-scrolling t

   ;; Control line numbers activation.
   ;; If set to `t', `relative' or `visual' then line numbers are enabled in all
   ;; `prog-mode' and `text-mode' derivatives. If set to `relative', line
   ;; numbers are relative. If set to `visual', line numbers are also relative,
   ;; but only visual lines are counted. For example, folded lines will not be
   ;; counted and wrapped lines are counted as multiple lines.
   ;; This variable can also be set to a property list for finer control:
   ;; '(:relative nil
   ;;   :visual nil
   ;;   :disabled-for-modes dired-mode
   ;;                       doc-view-mode
   ;;                       markdown-mode
   ;;                       org-mode
   ;;                       pdf-view-mode
   ;;                       text-mode
   ;;   :size-limit-kb 1000)
   ;; When used in a plist, `visual' takes precedence over `relative'.
   ;; (default nil)
   dotspacemacs-line-numbers nil

   ;; Code folding method. Possible values are `evil', `origami' and `vimish'.
   ;; (default 'evil)
   dotspacemacs-folding-method 'evil

   ;; If non-nil and `dotspacemacs-activate-smartparens-mode' is also non-nil,
   ;; `smartparens-strict-mode' will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode nil

   ;; If non-nil smartparens-mode will be enabled in programming modes.
   ;; (default t)
   dotspacemacs-activate-smartparens-mode t

   ;; If non-nil pressing the closing parenthesis `)' key in insert mode passes
   ;; over any automatically added closing parenthesis, bracket, quote, etc...
   ;; This can be temporary disabled by pressing `C-q' before `)'. (default nil)
   dotspacemacs-smart-closing-parenthesis nil

   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'all

   ;; If non-nil, start an Emacs server if one is not already running.
   ;; (default nil)
   dotspacemacs-enable-server nil

   ;; Set the emacs server socket location.
   ;; If nil, uses whatever the Emacs default is, otherwise a directory path
   ;; like \"~/.emacs.d/server\". It has no effect if
   ;; `dotspacemacs-enable-server' is nil.
   ;; (default nil)
   dotspacemacs-server-socket-dir nil

   ;; If non-nil, advise quit functions to keep server open when quitting.
   ;; (default nil)
   dotspacemacs-persistent-server nil

   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `rg', `ag', `pt', `ack' and `grep'.
   ;; (default '("rg" "ag" "pt" "ack" "grep"))
   dotspacemacs-search-tools '("rg" "ag" "pt" "ack" "grep")

   ;; Format specification for setting the frame title.
   ;; %a - the `abbreviated-file-name', or `buffer-name'
   ;; %t - `projectile-project-name'
   ;; %I - `invocation-name'
   ;; %S - `system-name'
   ;; %U - contents of $USER
   ;; %b - buffer name
   ;; %f - visited file name
   ;; %F - frame name
   ;; %s - process status
   ;; %p - percent of buffer above top of window, or Top, Bot or All
   ;; %P - percent of buffer above bottom of window, perhaps plus Top, or Bot or All
   ;; %m - mode name
   ;; %n - Narrow if appropriate
   ;; %z - mnemonics of buffer, terminal, and keyboard coding systems
   ;; %Z - like %z, but including the end-of-line format
   ;; If nil then Spacemacs uses default `frame-title-format' to avoid
   ;; performance issues, instead of calculating the frame title by
   ;; `spacemacs/title-prepare' all the time.
   ;; (default "%I@%S")
   dotspacemacs-frame-title-format "%I@%S"

   ;; Format specification for setting the icon title format
   ;; (default nil - same as frame-title-format)
   dotspacemacs-icon-title-format nil

   ;; Show trailing whitespace (default t)
   dotspacemacs-show-trailing-whitespace t

   ;; Delete whitespace while saving buffer. Possible values are `all'
   ;; to aggressively delete empty line and long sequences of whitespace,
   ;; `trailing' to delete only the whitespace at end of lines, `changed' to
   ;; delete only whitespace for changed lines or `nil' to disable cleanup.
   ;; (default nil)
   dotspacemacs-whitespace-cleanup 'trailing

   ;; If non-nil activate `clean-aindent-mode' which tries to correct
   ;; virtual indentation of simple modes. This can interfere with mode specific
   ;; indent handling like has been reported for `go-mode'.
   ;; If it does deactivate it here.
   ;; (default t)
   dotspacemacs-use-clean-aindent-mode t

   ;; Accept SPC as y for prompts if non-nil. (default nil)
   dotspacemacs-use-SPC-as-y nil

   ;; If non-nil shift your number row to match the entered keyboard layout
   ;; (only in insert state). Currently supported keyboard layouts are:
   ;; `qwerty-us', `qwertz-de' and `querty-ca-fr'.
   ;; New layouts can be added in `spacemacs-editing' layer.
   ;; (default nil)
   dotspacemacs-swap-number-row nil

   ;; Either nil or a number of seconds. If non-nil zone out after the specified
   ;; number of seconds. (default nil)
   dotspacemacs-zone-out-when-idle nil

   ;; Run `spacemacs/prettify-org-buffer' when
   ;; visiting README.org files of Spacemacs.
   ;; (default nil)
   dotspacemacs-pretty-docs nil

   ;; If nil the home buffer shows the full path of agenda items
   ;; and todos. If non-nil only the file name is shown.
   dotspacemacs-home-shorten-agenda-source nil

   ;; If non-nil then byte-compile some of Spacemacs files.
   dotspacemacs-byte-compile nil))

(defun dotspacemacs/user-env ()
  "Environment variables setup.
This function defines the environment variables for your Emacs session. By
default it calls `spacemacs/load-spacemacs-env' which loads the environment
variables declared in `~/.spacemacs.env' or `~/.spacemacs.d/.spacemacs.env'.
See the header of this file for more information."
  (spacemacs/load-spacemacs-env))

(defun dotspacemacs/user-init ()
  "Initialization for user code:
This function is called immediately after `dotspacemacs/init', before layer
configuration.
It is mostly for variables that should be set before packages are loaded.
If you are unsure, try setting them in `dotspacemacs/user-config' first.")


(defun dotspacemacs/user-load ()
  "Library to load while dumping.
This function is called only while dumping Spacemacs configuration. You can
`require' or `load' the libraries of your choice that will be included in the
dump.")


(defun dotspacemacs/user-config ()
  "Configuration for user code:
This function is called at the very end of Spacemacs startup, after layer
configuration.
Put your configuration code here, except for variables that should be set
before packages are loaded."

  (add-to-list 'load-path "/Users/brian/Documents/GitHub/emacs-ob-racket")
  (add-to-list 'load-path "~/Documents/GitHub/ob-wolfram")
  (global-auto-revert-mode)
  (setq org-latex-pdf-process (list "latexmk -shell-escape -bibtex -f -pdf %f"))
  (setq c-basic-offset 4)
  (setq fill-column 66)

  (defun insert-random-uuid ()
    "Insert a random UUID.
     Example of a UUID: 1df63142-a513-c850-31a3-535fc3520c3d

     WARNING: this is insecure! The chance of generating
     duplicate UUIDs is much higher than with a robust
     algorithm."
    (interactive)
    (insert
     (format "%04x%04x-%04x-%04x-%04x-%06x%06x"
             (random (expt 16 4))
             (random (expt 16 4))
             (random (expt 16 4))
             (random (expt 16 4))
             (random (expt 16 4))
             (random (expt 16 6))
             (random (expt 16 6)) )))

  (defun insert-random-hex (&optional n)
    "Insert a random string of hex digits; default length is 8."
    (interactive "P")
    (dotimes (_ (cond
                 ((consp n) (car n))
                 ((integerp n) n)
                 (t 8)))
      (insert
       (let ((x (random 16)))
         (if (< x 10) (+ x ?0) (+ x (- ?A 10)))))))

  (defun sort-lines-nocase ()
    (interactive)
    (let ((sort-fold-case t))
      (call-interactively 'sort-lines)))

  (defun unfill-region (beg end)
    "Unfill the region, joining text paragraphs into a single
    logical line.  This is useful, e.g., for use with
    `visual-line-mode'."
    (interactive "*r")
    (let ((fill-column (point-max)))
      (fill-region beg end)))

  ;; Handy key definition
  (define-key global-map "\C-\M-Q" 'unfill-region)

  ;;; Stefan Monnier <foo at acm.org>. It is the opposite of fill-paragraph
  (defun unfill-paragraph (&optional region)
    "Takes a multi-line paragraph and makes it into a single line of text."
    (interactive (progn (barf-if-buffer-read-only) '(t)))
    (let ((fill-column (point-max))
          ;; This would override `fill-column' if it's an integer.
          (emacs-lisp-docstring-fill-column t))
      (fill-paragraph nil region)))

  (defun number-region (start end)
    (interactive "r")
    (save-restriction
      (narrow-to-region start end)
      (goto-char (point-min))
      (let ((counter 0))
        (while (re-search-forward "^" nil t)
          (setq counter (+ 1 counter))
          (replace-match (format "%03d " counter) nil nil)))))


  ;; The next function replaces all words in a buffer with words
  ;; of the same length, chosen at random from
  ;; /usr/share/dict/words. Words are replaced consistently, so
  ;; e.g. "A" is always replaced with "Z". The mapping changes
  ;; when Emacs is restarted or when the cache buffer is killed.
  ;; If all unique words of a certain length are exhausted, random
  ;; strings are used.

  (defun ap/replace-words-randomly (&optional buffer)
    "Replace all words in BUFFER or current buffer with randomly
selected words from the dictionary. Every time a new word is
found, it is mapped to a replacement word, so every instance of
word A will be replaced with word Z."
    (interactive)
    (require 'ht)
    (with-current-buffer (or buffer (current-buffer))
      (let ((replacements (ht-create))
            (used-words (ht-create))
            (regexp (rx (or bow symbol-start) (1+ word) (or eow symbol-end)))
            (case-fold-search t)
            (orig-mode major-mode)
	          ;;  (window (get-buffer-window (current-buffer)))
            (buffer-size (buffer-size))
            current-word replacement-word)
        (fundamental-mode)
        (goto-char (point-min))
        (while (re-search-forward regexp nil 'noerror)
          (setq current-word (s-downcase (match-string 0)))
          (save-match-data ; `ap/get-random-word-of-same-length' changes match data
            (unless (setq replacement-word (ht-get replacements current-word))
              ;; Find unique replacement word and add to hash-tables.
              ;; We use a second ht to store words that we've already
              ;; used, because looking them up as keys is much faster
              ;; than getting all the values in the replacements table.
              (while (ht-get used-words
                             (setq replacement-word
                                   (ap/get-random-word-of-same-length
                                    current-word used-words)))
                nil)
              (unless replacement-word
                ;; No word found; make random string (which may not be
                ;; unique, but we can't really guarantee uniqueness in the
                ;; case of very short words unless we go into non-word
                ;; characters, Unicode, etc)
                (setq replacement-word (ap/get-random-string (length current-word))))
              ;; TODO: Filter profanity?
              ;; Add to hash-tables
              (ht-set replacements current-word replacement-word)
              (ht-set used-words replacement-word t)))
          ;; Replace match
          (replace-match replacement-word nil 'literal)
          ;; Allow Emacs to be interrupted gracefully.  Also potentially
          ;; displays progress if you have the buffer visible, but I can't get
          ;; recentering to work.
          (sit-for 0)
          ;; Display progress (this takes a while on large buffers)
	        (message "%s/%s" (point) buffer-size)
          ;; No idea why this doesn't work.  I have to save and restore
	        ;; point manually or it doesn't move past the matches and runs
	        ;; in an infinite loop, but then recenter does nothing at all
          ;; (when window
          ;;   (setq save-point (point))
          ;;   (with-selected-window window
          ;;     (recenter t))
          ;;   (goto-char save-point))
	        )
        (funcall orig-mode))))

  (cl-defmacro ap/with-random-word-cache (&rest body)
    ""
    (declare (indent defun)
             (debug (&rest form)))
    (let ((result (cl-gensym)))
      `(progn
         (unless (and (boundp 'ap/random-word-buffer)
                      (buffer-live-p ap/random-word-buffer))
           (with-current-buffer
               (setq ap/random-word-buffer
                     (get-buffer-create " *RANDOM WORDS*"))
             (call-process-shell-command "cat /usr/share/dict/words | shuf" nil t))
           (setq ap/random-word-buffer-point 1))
         (with-current-buffer ap/random-word-buffer
           (let (,result)
             (goto-char ap/random-word-buffer-point)
             (setq ,result (progn ,@body))
             ;; This point-saving and restoring should NOT be
             ;; necessary, I have no idea why this is.
             (setq ap/random-word-buffer-point (point))
             ,result)))))

  (defun ap/get-random-word-of-same-length (word &optional exclude-ht)
    (let* ((length (length word))
           (regexp (rx-to-string `(seq bol (repeat ,length word) eow))))
      (ap/with-random-word-cache
        ;; Search from last point, wrap once
        (when (= (point) (point-max))
          (goto-char (point-min)))
        (cl-loop with starting-point = (point)
                 with match
                 with wrapped
                 until (or match
                           (and wrapped
                                (>= (point) starting-point)))
                 do (progn
                      (when (= (point) (point-max))
                        (goto-char (point-min))
                        (setq wrapped t))
                      (when (re-search-forward regexp nil 'goto-end)
                        (setq match (match-string 0))
                        (unless (and (not (string= match word))
                                     (or (not exclude-ht)
                                         (not (ht-get exclude-ht match))))
                          ;; Invalid match, clear var
                          (setq match nil))))
                 finally return match))))

  (defun ap/get-random-string (length)
    "Return random string of LENGTH."
    (unless (and (bound-and-true-p ap/random-chars)
                 (bound-and-true-p ap/random-chars-length))
      (setq ap/random-chars (split-string "abcdefghijklmnopqrstuvwxyz" "" t))
      (setq ap/random-chars-length (length ap/random-chars)))
    (let* (s)
      (while (< (length s) length)
        (setq s (concat s (nth (random ap/random-chars-length) ap/random-chars))))
      s))

  (defun randomise-region ()
    "Like `ap/replace-words-randomly', but only replace inside region if it is active.
If the region is not active, apply the main function from point to the end of the
buffer.  The region is never considered active outside
`transient-mark-mode'. "
    (INTERACTIVE)
    (if (or (and (boundp 'zmacs-region-active-p) zmacs-region-active-p)
	          (and (boundp 'transient-mark-mode) transient-mark-mode mark-active))
        (save-restriction
          (save-excursion
            (narrow-to-region (point) (mark))
            (goto-char (point-min))
            (ap/replace-words-randomly)))
      (ap/replace-words-randomly)))



  ;; by default, the function 'python-mode is associated with
  ;; the package python.el. The following changes that to python-mode.el:
  (autoload 'python-mode "python-mode" "Python Mode." t)

  ;; open py files with python-mode
  (add-to-list 'auto-mode-alist '("\\.py\\'" . python-mode))

  ;; sets python interpreter mode to be python-mode
  (add-to-list 'interpreter-mode-alist '("python3" . python-mode))
  ;; (add-to-list 'interpreter-mode-alist '("python" . python-mode))

  (autoload 'enable-paredit-mode "paredit"
    "Turn on pseudo-structural editing of Lisp code." t)

  (add-hook 'emacs-lisp-mode-hook       #'enable-paredit-mode)
  ;; (add-hook 'eval-expression-minibuffer-setup-hook #'enable-paredit-mode)
  ;; (add-hook 'ielm-mode-hook             #'enable-paredit-mode)
  (add-hook 'lisp-mode-hook             #'enable-paredit-mode)
  (add-hook 'clojure-mode-hook          #'enable-paredit-mode)
  (add-hook 'lisp-interaction-mode-hook #'enable-paredit-mode)
  (add-hook 'scheme-mode-hook           #'enable-paredit-mode)
  (add-hook 'racket-mode-hook           #'enable-paredit-mode)

  (setq ob-mermaid-cli-path "/opt/homebrew/bin/mmdc")
  (setq python-shell-interpreter "/usr/bin/python3") ;;
  (setq pytest-global-name "~/anaconda3/bin/pytest")
  (setq pytest-cmd-flags "-x -v")

  (org-babel-do-load-languages
   'org-babel-load-languages
   '(
     (C           . t)
     ;; (awk         . t)
     (clojure     . t)
     (ditaa       . t)
     ;; (dot         . t)
     (emacs-lisp  . t)
     ;; (gnuplot     . t)
     ;; (js          . t)
     ;; (java        . t)
     (latex       . t)
     (lisp        . t)
     (org         . t)
     ;; (perl        . t)
     ;; (plantuml    . t)
     (mathematica . t)
     (mermaid     . t)
     (python      . t)
     ;; (scheme      . t)
     ;; (sed         . t)
     (shell       . t)
     ;; (R          . t)
     ;; (calc       . t)
     ;; (gnuplot    . t)
     ;; (graphviz   . t) ! NO !
     (haskell     .t)
     ;; (octave     . t)
     (racket      .t)
     ;; (ruby       . t)
     ;; (screen     . t)
     ;; (sh         . t)
     ;; (sql        . t)
     ;; (sqlite     . t)
     ;; (stan       . t)
     (wolfram     .t)
     ))

  ;; (require 'ob-awk)
  ;; (require 'ob-graphviz) ;; ! NO !  can't find it !   doesn't exist !
  (require 'ob-clojure)
  ;; (require 'ob-bash)
  (require 'ob-calc)
  (require 'ob-ditaa)
  (require 'ob-haskell)
  ;; (require 'ob-java)
  ;; (require 'ob-js)
  (require 'ob-mathematica)
  (require 'ob-wolfram)
  (require 'ob-latex)
  (require 'ob-lisp)
  (require 'ob-org)
  (require 'ob-plantuml)
  (require 'ob-python)
  (require 'ob-racket)
  ;; (require 'ob-scheme)
  ;; (require 'ob-sed)
  (require 'ob-shell)
  ;; (require 'ob-forth)
  ;; (require 'ob-octave)
  ;; (require 'emacs-lisp)
  ;; (require 'ob-R)
  (require 'ob-dot)
  ;; (require 'ob-gnuplot)
  ;; (require 'ob-perl)
  ;; (require 'ob-screen)
  ;; (require 'ob-sh)
  ;; (require 'ob-sql)
  ;; (require 'ob-sqlite)

  (require 'clj-refactor)
  (defun my-clojure-mode-hook ()
    (clj-refactor-mode 1)
    ;; (yas-minor-mode 1)
    ;; (cljr-add-keybindings-with-prefix "C-c C-m")
    )
  (add-hook 'clojure-mode-hook #'my-clojure-mode-hook)

  (add-hook 'org-mode-hook        #'turn-on-auto-fill )
  (add-hook 'org-mode-hook        (lambda () (setq fill-column 72)))

  (add-hook 'markdown-mode-hook   #'turn-on-auto-fill)

  (add-hook 'python-mode-hook     #'turn-on-auto-fill)

  (setq org-babel-mathematica-command "wolframscript -script")
  (add-to-list 'org-src-lang-modes '("mathematica" . wolfram))

  (add-hook 'scheme-mode-hook 'geiser-mode)
  (setq geiser-default-implementation 'racket)

  (setq inferior-lisp-program "/usr/bin/sbcl")

  (setenv "GIT_SSH_COMMAND" "ssh -i ~/.ssh/id_ed25519_Golf37.local")

  (exec-path-from-shell-initialize)

  (global-company-mode)
  )

;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
(defun dotspacemacs/emacs-custom-settings ()
  "Emacs custom settings.
This is an auto-generated function, do not modify its content directly, use
Emacs customize menu instead.
This function is called at the very end of Spacemacs initialization."
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("02fff7eedb18d38b8fd09a419c579570673840672da45b77fde401d8708dc6b5" default))
 '(evil-want-Y-yank-to-eol nil)
 '(package-selected-packages
   '(csv-mode neotree cider sesman parseedn clojure-mode parseclj seeing-is-believing rvm ruby-tools ruby-test-mode ruby-refactor ruby-hash-syntax rubocopfmt rubocop rspec-mode robe rbenv rake minitest chruby bundler inf-ruby ob-mermaid exec-path-from-shell yaml-mode pdf-tools tablist yasnippet web-mode web-beautify tagedit slim-mode scss-mode sass-mode pug-mode prettier-js impatient-mode simple-httpd helm-css-scss haml-mode emmet-mode counsel-css counsel swiper ivy company-web web-completion-data company add-node-modules-path zonokai-emacs zenburn-theme zen-and-art-theme yapfify ws-butler writeroom-mode wolfram-mode winum white-sand-theme which-key volatile-highlights vi-tilde-fringe uuidgen use-package undo-tree underwater-theme ujelly-theme twilight-theme twilight-bright-theme twilight-anti-bright-theme treemacs-projectile treemacs-persp treemacs-icons-dired toxi-theme toml-mode toc-org tao-theme tangotango-theme tango-plus-theme tango-2-theme symon symbol-overlay sunny-day-theme sublime-themes subatomic256-theme subatomic-theme string-inflection string-edit srefactor sphinx-doc spaceline-all-the-icons spacegray-theme soothe-theme solarized-theme soft-stone-theme soft-morning-theme soft-charcoal-theme smyx-theme slime seti-theme ron-mode reverse-theme restart-emacs request rebecca-theme rainbow-delimiters railscasts-theme racket-mode racer quickrun quack pytest pyenv-mode pydoc py-isort purple-haze-theme professional-theme popwin poetry planet-theme pippel pipenv pip-requirements phoenix-dark-pink-theme phoenix-dark-mono-theme pcre2el password-generator paradox overseer organic-green-theme org-superstar org-rich-yank org-projectile org-present org-pomodoro org-mime org-download org-contrib org-cliplink open-junk-file omtose-phellack-theme oldlace-theme occidental-theme obsidian-theme nose noctilux-theme naquadah-theme nameless mustang-theme multi-line monokai-theme monochrome-theme molokai-theme moe-theme modus-themes mmm-mode minimal-theme material-theme markdown-toc majapahit-theme madhat2r-theme lush-theme lorem-ipsum live-py-mode link-hint light-soap-theme kaolin-themes jbeans-theme jazz-theme ir-black-theme inspector inkpot-theme info+ indent-guide importmagic hybrid-mode hungry-delete htmlize hl-todo highlight-parentheses highlight-numbers highlight-indentation heroku-theme hemisu-theme helm-xref helm-themes helm-swoop helm-pydoc helm-purpose helm-projectile helm-org-rifle helm-org helm-mode-manager helm-make helm-ls-git helm-flx helm-descbinds helm-ag hc-zenburn-theme haskell-mode gruvbox-theme gruber-darker-theme grandshell-theme gotham-theme google-translate golden-ratio gnuplot gh-md geiser-racket geiser-mit gandalf-theme font-lock+ flyspell-correct-helm flycheck-package flycheck-elsa flx-ido flatui-theme flatland-theme figlet farmhouse-theme fancy-battery eziam-theme eyebrowse expand-region exotica-theme evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-textobj-line evil-surround evil-org evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-lisp-state evil-lion evil-indent-plus evil-iedit-state evil-goggles evil-exchange evil-escape evil-ediff evil-collection evil-cleverparens evil-args evil-anzu eval-sexp-fu espresso-theme emr elisp-slime-nav editorconfig dumb-jump drag-stuff dracula-theme dotenv-mode doom-themes doom-modeline django-theme dired-quick-sort diminish devdocs define-word darktooth-theme darkokai-theme darkmine-theme darkburn-theme dakrone-theme cython-mode cyberpunk-theme column-enforce-mode color-theme-sanityinc-tomorrow color-theme-sanityinc-solarized clues-theme clean-aindent-mode chocolate-theme cherry-blossom-theme centered-cursor-mode cargo busybee-theme bubbleberry-theme blacken birds-of-paradise-plus-theme badwolf-theme auto-highlight-symbol auto-dictionary auto-compile apropospriate-theme anti-zenburn-theme anaconda-mode ample-zen-theme ample-theme alect-themes aggressive-indent afternoon-theme ace-link ace-jump-helm-line))
 '(safe-local-variable-values '((org-image-actual-width)))
 '(warning-suppress-types '((comp) (comp))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
)
