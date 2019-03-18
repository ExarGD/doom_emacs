;;; ~/.doom.d/config.el -*- lexical-binding: t; -*-
(if (display-graphic-p)
    (setq doom-theme 'tao-yin)
     ;; Background color for tao-yin monochrome theme, remove on theme change
     ;; (custom-set-faces
     ;;  '(default ((t (:background "black")))))
     ;; (setq default-frame-alist initial-frame-alist)
  (setq doom-theme 'zenburn)
  )
(setq doom-font (font-spec :family "Hasklig" :size 12))
(scroll-bar-mode -1)




;; Personal keymaps
(setq ns-function-modifier 'hyper)

(map! "<f8>" #'projectile-compile-project)
(map! "M-§" #'+term/open-popup-in-project)
(map! "M-]" #'forward-paragraph)
(map! "M-[" #'backward-paragraph)
(map! "<f9>" #'+term/open-popup-in-project)

(setq evil-state t)


;; newline-without-break-of-line
(defun newline-without-break-of-line ()
  "1. move to end of the line.
     2. insert newline with index"

  (interactive)
  (let ((oldpos (point)))
    (end-of-line)
    (newline-and-indent)))

(global-set-key (kbd "<s-return>") 'newline-without-break-of-line)


;;Smooth scrolling
(setq mouse-wheel-scroll-amount '(1 ((shift) . 1))) ;; one line at a time
(setq mouse-wheel-progressive-speed nil) ;; don't accelerate scrolling
(setq mouse-wheel-follow-mouse 't) ;; scroll window under mouse
(setq scroll-step 5)

;; Russian keys
(defun cfg:reverse-input-method (input-method)
  "Build the reverse mapping of single letters from INPUT-METHOD."
  (interactive
   (list (read-input-method-name "Use input method (default current): ")))
  (if (and input-method (symbolp input-method))
      (setq input-method (symbol-name input-method)))
  (let ((current current-input-method)
        (modifiers '(nil (control) (meta) (control meta))))
    (when input-method
      (activate-input-method input-method))
    (when (and current-input-method quail-keyboard-layout)
      (dolist (map (cdr (quail-map)))
        (let* ((to (car map))
               (from (quail-get-translation
                      (cadr map) (char-to-string to) 1)))
          (when (and (characterp from) (characterp to))
            (dolist (mod modifiers)
              (define-key local-function-key-map
                (vector (append mod (list from)))
                (vector (append mod (list to)))))))))
    (when input-method
      (activate-input-method current))))
(cfg:reverse-input-method 'russian-computer)

(c-add-style "microsoft"
             '("stroustrup"
               (c-offsets-alist
                (innamespace . -)
                (inline-open . 0)
                (inher-cont . c-lineup-multi-inher)
                (arglist-cont-nonempty . +)
                (template-args-cont . +))))
(setq c-default-style "microsoft")

;; Python config
(add-hook 'python-mode-hook #'pipenv-mode)
(add-hook 'python-mode-hook
          (lambda ()
            (setq
             pipenv-projectile-after-switch-function
             #'pipenv-projectile-after-switch-extended)
            (local-set-key "\C-cta" 'pytest-all)
            (local-set-key "\C-ctm" 'pytest-module)
            (local-set-key "\C-ctt" 'pytest-one)
            (local-set-key "\C-ctd" 'pytest-directory)
            ))
(setq pytest-cmd-format-string "cd %s && pipenv run %s -v -n 3 %s %s")
(defcustom pipenv-keymap-prefix (kbd "C-c v")
  "Pipenv keymap prefix."
  :group 'pipenv
  :type 'string)

(setq display-line-numbers-type 'relative)
(setq left-margin-width 0)

(defun my-org-archive-done-tasks ()
  (interactive)
  (org-map-entries 'org-archive-subtree "/DONE" 'file))

(add-hook 'org-mode-hook
          (lambda ()
            (org-bullets-mode 1)
            (setq org-ellipsis " ▼")
            (local-set-key "\C-co" 'org-pomodoro)
            (local-set-key (kbd "<M-up>") 'org-up-element)
            (local-set-key (kbd "<M-down>") 'org-down-element)
            (local-set-key "\C-cA" 'my-org-archive-done-tasks)
            (turn-on-auto-fill)
            (set-fill-column 80)
            (visual-line-mode 1)))


(setq org-archive-location "~/Dropbox/org/archive.org::datetree/* Finished tasks")
(setq org-agenda-files "~/Dropbox/org/tasks.org")
(setq org-default-notes-file "~/Dropbox/org/tasks.org")
(setq +org-capture-todo-file "~/Dropbox/org/tasks.org")
(setq +org-capture-notes-file "~/Dropbox/org/tasks.org")
(setq org-directory "~/Dropbox/org")

(setq org-capture-templates
      '(("p" "Personal task" entry
         (file+olp "~/Dropbox/org/tasks.org" "Tasks" "Personal" "Backlog")
         "* TODO %?" :prepend t :time-prompt t)
        ("w" "Task for work" entry
         (file+olp "~/Dropbox/org/tasks.org" "Tasks" "Work" "Backlog")
         "* TODO %?" :prepend t :jump-to-captured t)
        ("t" "Quick task capture into Inbox" entry
         (file+olp "~/Dropbox/org/tasks.org" "Tasks" "Inbox")
         "* TODO %?" :prepend t :time-prompt t :kill-buffer t)
        ("n" "Note" entry
         (file+olp "~/Dropbox/org/tasks.org" "Notes"))))
