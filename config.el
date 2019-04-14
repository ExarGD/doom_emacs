;;; ~/.doom.d/config.el -*- lexical-binding: t; -*-
;;Default window size
(setq default-frame-alist
      '((top . 200) (left . 400)
        (width . 200) (height . 55)
        ))
(setq initial-frame-alist '((top . 10) (left . 30)))

(if (display-graphic-p)
    (setq doom-theme 'one-dark)
  (setq doom-theme 'kosmos)
  )
(setq doom-font (font-spec :family "Hasklig" :size 14))
(setq doom-big-font (font-spec :family "Hasklig" :size 14))
(setq doom-variable-font (font-spec :family "Hasklig" :size 14))
(setq doom-unicode-font (font-spec :family "Hasklig" :size 14))
(scroll-bar-mode -1)
(tool-bar-mode 0)
(blink-cursor-mode 1)

;; Personal keymaps
(setq ns-function-modifier 'hyper)
(map! (:after smartparens               ; annoying smartparens keybinding
        :map smartparens-mode-map       ; remapped this keys to word navigation
        "M-<right>" nil
        "M-<left>" nil))

(map! "<escape>" #'keyboard-escape-quit)

(map! "<f8>" #'+treemacs/toggle)
(map! "s-r" #'+default/compile)
(map! "<f9>" #'+term/open-popup-in-project)

;; navigation
(map! "<s-up>" #'backward-paragraph)
(map! "<s-down>" #'forward-paragraph)
(map! "<M-right>" #'forward-word)
(map! "<M-left>" #'backward-word)
(map! "<s-right>" #'end-of-line)
(map! "<s-left>" #'beginning-of-line)

(map! "s-§" #'ace-window)
(map! "s-1" #'delete-other-windows)
(map! "s-2" #'split-window-below)
(map! "s-3" #'split-window-right)
(map! "±" #'switch-to-buffer-other-window)
(map! "M-±" #'find-file-other-window)

(map! "<C-s-right>" #'+workspace/switch-right)
(map! "<C-s-left>" #'+workspace/switch-left)


(map!
 "C-." #'counsel-find-file
 "C-," #'ivy-switch-buffer
 )


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
(setq mouse-wheel-follow-mouse 't) ;; scroll window under mouse
(setq scroll-step 1)
(defun gcm-scroll-down ()
  (interactive)
  (scroll-up 5))
(defun gcm-scroll-up ()
  (interactive)
  (scroll-down 5))
(global-set-key (kbd "<M-up>") 'gcm-scroll-up)
(global-set-key (kbd "<M-down>") 'gcm-scroll-down)

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
(setq pytest-cmd-format-string "cd %s && pipenv run %s -v %s %s")
(defcustom pipenv-keymap-prefix (kbd "C-c v")
  "Pipenv keymap prefix."
  :group 'pipenv
  :type 'string)

;; C++ settings
(setq irony-additional-clang-options '("-std=c++11"))

;; avy bindings
(map! :leader
      (:prefix ("a" . "Avy")
        "c" #'avy-goto-char
        "a" #'avy-goto-char-timer
        "f" #'avy-goto-line
        "w" #'avy-goto-word-1))


(setq display-line-numbers-type 'relative)
(setq left-margin-width 0)

;; Org-mode settings
(defun my-org-archive-done-tasks ()
  (interactive)
  (org-map-entries 'org-archive-subtree "/DONE" 'file))

(add-hook 'org-mode-hook
          (lambda ()
            (turn-on-auto-fill)
            (set-fill-column 80)
            (visual-line-mode 1)))

(org-bullets-mode 1)
(setq org-ellipsis " ▼")
(map! (:map org-mode-map
        "<M-up>" #'org-up-element
        "<M-down>" #'org-down-element
        "<C-tab>" #'next-multiframe-window
        :leader "A" #'my-org-archive-done-tasks))



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

;; (defun my/org-mode-hook ()
;;   "Stop the org-level headers from increasing in height relative to the other text."
;;   (dolist (face '(org-level-1
;;                   org-level-2
;;                   org-level-3
;;                   org-level-4
;;                   org-level-5))
;;     (set-face-attribute face nil :weight 'semi-bold :height 1.0)))
;; (add-hook 'org-mode-hook 'my/org-mode-hook)
