;;; init.el -*- lexical-binding: t; -*-
;; Copy me to ~/.doom.d/init.el or ~/.config/doom/init.el, then edit me!

(doom! :feature
      ;debugger          ; FIXME stepping through code, to help you add bugs
       eval              ; run code, run (also, repls)
       (evil +everywhere); come to the dark side, we have cookies
       file-templates    ; auto-snippets for empty files
       (lookup           ; helps you navigate your code and documentation
        +docsets)        ; ...or in Dash docsets locally
       snippets          ; my elves. They type so I don't have to
       spellcheck        ; tasing you for misspelling mispelling
       (syntax-checker   ; tasing you for every semicolon you forget
        +childframe)     ; use childframes for error popups (Emacs 26+ only)
       workspaces        ; tab emulation, persistence & separate workspaces

       :completion
       (company          ; the ultimate code completion backend
        +auto)           ; as-you-type code completion
       (helm             ; the *other* search engine for love and life
        +fuzzy)          ; enable fuzzy search backend for helm
      ;ido               ; the other *other* search engine...
      ;(ivy              ; a search engine for love and life
      ; +fuzzy)          ; enable fuzzy search backend for ivy

       :ui
      ;deft              ; notational velocity for Emacs
       doom              ; what makes DOOM look the way it does
       doom-dashboard    ; a nifty splash screen for Emacs
       ;; doom-modeline     ; a snazzy Atom-inspired mode-line
       doom-quit         ; DOOM quit-message prompts when you quit Emacs
       evil-goggles      ; display visual hints when editing in evil
      ;fci               ; a `fill-column' indicator
       hl-todo           ; highlight TODO/FIXME/NOTE tags
      ;; modeline          ; snazzy, Atom-inspired modeline, plus API
       nav-flash         ; blink the current line after jumping
      ;neotree           ; a project drawer, like NERDTree for vim
       treemacs          ; a project drawer, like neotree but cooler
       (popup            ; tame sudden yet inevitable temporary windows
        +all             ; catch all popups that start with an asterix
        +defaults)       ; default popup rules
      ;pretty-code       ; replace bits of code with pretty symbols
      ;tabbar            ; FIXME an (incomplete) tab bar for Emacs
      ;unicode           ; extended unicode support for various languages
       vc-gutter         ; vcs diff in the fringe
       vi-tilde-fringe   ; fringe tildes to mark beyond EOB
       window-select     ; visually switch windows

       :editor
      ;(format +onsave)  ; automated prettiness
       multiple-cursors  ; editing in many places at once
      ;parinfer          ; turn lisp into python, sort of
       rotate-text       ; cycle region at point between text candidates

       :emacs
       dired             ; making dired pretty [functional]
       ediff             ; comparing files in Emacs
       electric          ; smarter, keyword-based electric-indent
      ;eshell            ; a consistent, cross-platform shell (WIP)
       hideshow          ; basic code-folding support
       imenu             ; an imenu sidebar and searchable code index
      ;term              ; terminals in Emacs
       vc                ; version-control and Emacs, sitting in a tree

       :tools
      ;ansible
      ;docker
       editorconfig      ; let someone else argue about tabs vs spaces
      ;ein               ; tame Jupyter notebooks with emacs
      ;gist              ; interacting with github gists
      macos             ; MacOS-specific commands
      make              ; run make tasks from Emacs
      magit             ; a git porcelain for Emacs
      ;password-store    ; password manager for nerds
      ;pdf               ; pdf enhancements
      ;prodigy           ; FIXME managing external services & code builders
      ;rgb               ; creating color strings
      ;tmux              ; an API for interacting with tmux
      ;upload            ; map local to remote projects via ssh/ftp
      ;wakatime

       :lang
      ;assembly          ; assembly for fun or debugging
      (cc +irony +rtags); C/C++/Obj-C madness
      ;clojure           ; java with a lisp
      ;common-lisp       ; if you've seen one lisp, you've seen them all
      ;coq               ; proofs-as-programs
      ;crystal           ; ruby at the speed of c
      ;csharp            ; unity, .NET, and mono shenanigans
       data              ; config/data formats
      ;erlang            ; an elegant language for a more civilized age
      ;elixir            ; erlang done right
      ;elm               ; care for a cup of TEA?
       emacs-lisp        ; drown in parentheses
      ;ess               ; emacs speaks statistics
      ;go                ; the hipster dialect
      ;(haskell +intero) ; a language that's lazier than I am
      ;hy                ; readability of scheme w/ speed of python
      ;idris             ;
      ;(java +meghanada) ; the poster child for carpal tunnel syndrome
      ;javascript        ; all(hope(abandon(ye(who(enter(here))))))
      ;julia             ; a better, faster MATLAB
      ;latex             ; writing papers in Emacs has never been so fun
      ;ledger            ; an accounting system in Emacs
      ;lua               ; one-based indices? one-based indices
       markdown          ; writing docs for people to ignore
      ;nim               ; python + lisp at the speed of c
      ;nix               ; I hereby declare "nix geht mehr!"
      ;ocaml             ; an objective camel
       (org              ; organize your plain life in plain text
        +attach          ; custom attachment system
        +babel           ; running code in org
        +capture         ; org-capture in and outside of Emacs
        +export          ; Exporting org to whatever you want
        +present)        ; Emacs for presentations
      ;perl              ; write code no one else can comprehend
      ;php               ; perl's insecure younger brother
      ;plantuml          ; diagrams for confusing people more
      ;purescript        ; javascript, but functional
      python            ; beautiful is better than ugly
      ;qt                ; the 'cutest' gui framework ever
      ;racket            ; a DSL for DSLs
      ;rest              ; Emacs as a REST client
      ;ruby              ; 1.step do {|i| p "Ruby is #{i.even? ? 'love' : 'life'}"}
      rust              ; Fe2O3.unwrap().unwrap().unwrap().unwrap()
      ;scala             ; java, but good
       (sh +fish)        ; she sells (ba|z|fi)sh shells on the C xor
      ;solidity          ; do you need a blockchain? No.
      ;swift             ; who asked for emoji variables?
      ;web               ; the tubes

       ;; Applications are complex and opinionated modules that transform Emacs
       ;; toward a specific purpose. They may have additional dependencies and
       ;; should be loaded late.
       :app
      ;(email +gmail)    ; emacs as an email client
      ;irc               ; how neckbeards socialize
      ;(rss +org)        ; emacs as an RSS reader
      ;twitter           ; twitter client https://twitter.com/vnought
      ;(write            ; emacs as a word processor (latex + org + markdown)
      ; +wordnut         ; wordnet (wn) search
      ; +langtool)       ; a proofreader (grammar/style check) for Emacs

       :collab
      ;floobits          ; peer programming for a price
      ;impatient-mode    ; show off code over HTTP

       :config
       ;; For literate config users. This will tangle+compile a config.org
       ;; literate config in your `doom-private-dir' whenever it changes.
      ;literate

       ;; The default module sets reasonable defaults for Emacs. It also
       ;; provides a Spacemacs-inspired keybinding scheme, a custom yasnippet
       ;; library, and additional ex commands for evil-mode. Use it as a
       ;; reference for your own modules.
       (default +bindings +snippets +evil-commands))

(add-hook 'python-mode-hook
	  (lambda ()
	    (local-set-key "\C-cta" 'pytest-all)
	    (local-set-key "\C-ctm" 'pytest-module)
	    (local-set-key "\C-ctt" 'pytest-one)
	    (local-set-key "\C-ctd" 'pytest-directory)
	    ))

(setq pytest-cmd-format-string "cd %s; and pipenv run %s %s %s")

(setq projectile-project-compilation-cmd "")

(defun my-org-archive-done-tasks ()
  (interactive)
  (org-map-entries 'org-archive-subtree "/DONE" 'file))

(add-hook 'org-mode-hook
	      (lambda ()
	        (org-bullets-mode 1)
	        (local-set-key "\C-co" 'org-pomodoro)
	        (local-set-key (kbd "<M-up>") 'org-up-element)
	        (local-set-key (kbd "<M-down>") 'org-down-element)
	        (local-set-key "\C-cA" 'my-org-archive-done-tasks)
	        ;; (local-set-key (kbd "<M-s-right>") 'org-narrow-to-subtree)
	        ;; (local-set-key (kbd "<M-s-left>") 'widen)
	        (visual-line-mode 1)))

(load-theme 'darktooth t)

(doom-modeline-init)

(setq doom-font (font-spec :family "Fira Code" :size 13))

(when (window-system)
  (set-frame-font "Fira Code"))
(let ((alist '((33 . ".\\(?:\\(?:==\\|!!\\)\\|[!=]\\)")
               (35 . ".\\(?:###\\|##\\|_(\\|[#(?[_{]\\)")
               (36 . ".\\(?:>\\)")
               (37 . ".\\(?:\\(?:%%\\)\\|%\\)")
               (38 . ".\\(?:\\(?:&&\\)\\|&\\)")
               (42 . ".\\(?:\\(?:\\*\\*/\\)\\|\\(?:\\*[*/]\\)\\|[*/>]\\)")
               (43 . ".\\(?:\\(?:\\+\\+\\)\\|[+>]\\)")
               (45 . ".\\(?:\\(?:-[>-]\\|<<\\|>>\\)\\|[<>}~-]\\)")
               (46 . ".\\(?:\\(?:\\.[.<]\\)\\|[.=-]\\)")
               (47 . ".\\(?:\\(?:\\*\\*\\|//\\|==\\)\\|[*/=>]\\)")
               (48 . ".\\(?:x[a-zA-Z]\\)")
               (58 . ".\\(?:::\\|[:=]\\)")
               (59 . ".\\(?:;;\\|;\\)")
               (60 . ".\\(?:\\(?:!--\\)\\|\\(?:~~\\|->\\|\\$>\\|\\*>\\|\\+>\\|--\\|<[<=-]\\|=[<=>]\\||>\\)\\|[*$+~/<=>|-]\\)")
               (61 . ".\\(?:\\(?:/=\\|:=\\|<<\\|=[=>]\\|>>\\)\\|[<=>~]\\)")
               (62 . ".\\(?:\\(?:=>\\|>[=>-]\\)\\|[=>-]\\)")
               (63 . ".\\(?:\\(\\?\\?\\)\\|[:=?]\\)")
               (91 . ".\\(?:]\\)")
               (92 . ".\\(?:\\(?:\\\\\\\\\\)\\|\\\\\\)")
               (94 . ".\\(?:=\\)")
               (119 . ".\\(?:ww\\)")
               (123 . ".\\(?:-\\)")
               (124 . ".\\(?:\\(?:|[=|]\\)\\|[=>|]\\)")
               (126 . ".\\(?:~>\\|~~\\|[>=@~-]\\)")
               )
             ))
  (dolist (char-regexp alist)
    (set-char-table-range composition-function-table (car char-regexp)
                          `([,(cdr char-regexp) 0 font-shape-gstring]))))