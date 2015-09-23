(autoload 'ruby-mode "ruby-mode" "Mode for editing ruby source files" t)

(autoload 'inf-ruby "inf-ruby" "Run an inferior Ruby process" t)
(add-hook 'ruby-mode-hook 'inf-ruby-minor-mode)
(remove-hook 'ruby-mode-hook 'ruby-electric-mode)

; set rbenv path
(setenv "PATH" (concat "/usr/local/var/rbenv/shims:" (getenv "PATH")))
(setq exec-path (parse-colon-path (getenv "PATH")))
(setq eshell-path-env (getenv "PATH"))

(require 'rcodetools)
(setq rct-find-tag-if-available nil)
(defun ruby-mode-hook-rcodetools ()
  (define-key ruby-mode-map (kbd "<C-tab>") 'rct-complete-symbol)
  (define-key ruby-mode-map (kbd "<C-return>") 'xmp))

;(global-set-key (kbd "<C-return>") 'xmp)

(add-hook 'ruby-mode-hook 'ruby-mode-hook-rcodetools)
(defun make-ruby-scratch-buffer ()
  (with-current-buffer (get-buffer-create "*ruby scratch*")
    (ruby-mode)
    (current-buffer)))
(defun ruby-scratch ()
  (interactive)
  (pop-to-buffer (make-ruby-scratch-buffer)))

; enable and disable ruby-electric-mode to stop ruby-mode 
; from handling curly braces
(defun ruby-mode-hook-for-fixing-ruby-electric ()
  (require 'ruby-electric)
  (ruby-electric-mode)
  (ruby-electric-mode -1))
(add-hook 'ruby-mode-hook 
          'ruby-mode-hook-for-fixing-ruby-electric)
(remove-hook 'ruby-mode-hook 'ruby-electric-mode)

(if (locate-library "ruby-end")
    (require 'ruby-end))


(add-hook 'ruby-mode-hook '(lambda ()
                             (require 'rcodetools)
                             (require 'anything-rcodetools)
                             (require 'myrurema)
                             (load-auto-complete)
                             (setq ruby-deep-indent-paren-style nil)))


(require 'ruby-block)
(ruby-block-mode t)
(setq ruby-block-highlight-toggle t)

; auto-complete
(defun load-auto-complete ()
  (require 'auto-complete-config)
  (ac-config-default)

  (add-to-list 'ac-dictionary-directories "~/.emacs.d/etc/auto-complete")

  (setq ac-use-menu-map t)
  (define-key ac-menu-map "\C-n" 'ac-next)
  (define-key ac-menu-map "\C-p" 'ac-previous)

  (setq ac-auto-show-menu 0.2)
  (setq ac-menu-height 20)

  (robe-mode))

; robe
(autoload 'robe-mode "robe" "Code navigation, documentation lookup and completion for Ruby" t nil)
(autoload 'ac-robe-setup "ac-robe" "auto-complete robe" nil nil)
(add-hook 'robe-mode-hook 'ac-robe-setup)


; for rails
;; (add-hook 'projectile-mode-hook 'projectile-rails-on)
(when (require 'rinari nil t)
  (global-rinari-mode)
  (setq rinari-major-modes
        (list 'mumamo-after-change-major-mode-hook
              'dired-mode-hook
              'ruby-mode-hook
              'slim-mode-hook
              'haml-mode-hook
              'css-mode-hook
              'yaml-mode-hook
              'javascript-mode-hook))
  (dolist (hook rinari-major-modes) (add-hook hook 'rinari-launch)))
