;;; ~/.doom.d/config.el -*- lexical-binding: t; -*-

;; (load-theme 'solarized-dark t)
(setq doom-theme 'darktooth)
(setq doom-font (font-spec :family "Source Code Pro" :size 14))

(map! "<A-tab>" #'next-multiframe-window) (map! "C-`" #'evil-escape)
(map! "C-]" #'evil-escape)

(map! "<f8>" #'projectile-compile-project)

;; Default window size
(if (display-graphic-p)
    (progn
      (setq initial-frame-alist
            '(
              (tool-bar-lines . 0)
              (width . 140) ; chars
              (height . 45) ; lines
              ))
      (setq default-frame-alist
            '(
              (tool-bar-lines . 0)
              (width . 140)
              (height . 45)
              )))
  (progn
    (setq initial-frame-alist '( (tool-bar-lines . 0)))
    (setq default-frame-alist '( (tool-bar-lines . 0)))))

;;Smooth scrolling
(setq mouse-wheel-scroll-amount '(1 ((shift) . 1))) ;; one line at a time
(setq mouse-wheel-progressive-speed nil) ;; don't accelerate scrolling
(setq mouse-wheel-follow-mouse 't) ;; scroll window under mouse
(setq scroll-step 1)

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
(setq pytest-cmd-format-string "cd %s; and pipenv run %s -n 3 %s %s")
(defcustom pipenv-keymap-prefix (kbd "C-c v")
  "Pipenv keymap prefix."
  :group 'pipenv
  :type 'string)

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
	        ;; (local-set-key (kbd "<M-s-right>") 'org-narrow-to-subtree)
	        ;; (local-set-key (kbd "<M-s-left>") 'widen)
	        (visual-line-mode 1)))



(setq org-directory "~/Dropbox/org")
