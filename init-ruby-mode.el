(autoload 'ruby-mode "ruby-mode" "Mode for editing ruby source files" t)

(autoload 'inf-ruby "inf-ruby" "Run an inferior Ruby process" t)
(add-hook 'ruby-mode-hook 'inf-ruby-minor-mode)
(remove-hook 'ruby-mode-hook 'ruby-electric-mode)

; set rbenv path
(setenv "PATH" (concat "/usr/local/var/rbenv/shims:" (getenv "PATH")))
(setq exec-path (parse-colon-path (getenv "PATH")))
(setq eshell-path-env (getenv "PATH"))

(defun make-ruby-scratch-buffer ()
  (with-current-buffer (get-buffer-create "*ruby scratch*")
    (ruby-mode)
    (current-buffer)))

(defun ruby-scratch ()
  (interactive)
  (pop-to-buffer (make-ruby-scratch-buffer)))

; enable and disable ruby-electric-mode to stop ruby-mode 
; from handling curly braces
;(defun ruby-mode-hook-for-fixing-ruby-electric ()
;  (require 'ruby-electric)
;  (ruby-electric-mode)
;  (ruby-electric-mode -1))
;(add-hook 'ruby-mode-hook 
;          'ruby-mode-hook-for-fixing-ruby-electric)
;(remove-hook 'ruby-mode-hook 'ruby-electric-mode)


(add-hook 'ruby-mode-hook
          (lambda ()
            (add-to-list 'ac-sources 'ac-source-abbrev)
            (add-to-list 'ac-sources 'ac-source-yasnippet)
            (auto-complete-mode t)))

(add-hook 'robe-mode-hook 'ac-robe-setup)
(require 'ruby-end)

;; from http://qiita.com/ironsand/items/ce7c02eb46fcc25a438b
(require 'rcodetools)
(require 'anything-rcodetools)
(setq rct-find-tag-if-available nil)
(defun ruby-mode-hook-rcodetools ()
  (define-key ruby-mode-map (kbd "<C-tab>") 'rct-complete-symbol)
  (define-key ruby-mode-map (kbd "<M-RET>") 'xmp))

(add-hook 'ruby-mode-hook 'ruby-mode-hook-rcodetools)

(defun make-ruby-scratch-buffer ()
  (with-current-buffer (get-buffer-create "*ruby scratch*")
    (ruby-mode)
    (current-buffer)))

(defun ruby-scratch ()
  (interactive)
  (pop-to-buffer (make-ruby-scratch-buffer)))

(require 'myrurema)
(defun ruby-mode-hooks-myrurema ()
  ;(define-key ruby-mode-map (kbd "<C-return>") 'rurema)
  (define-key ruby-mode-map (kbd "<C-return>") 'rurema:at-point))
(add-hook 'ruby-mode-hook 'ruby-mode-hooks-myrurema)

(setq ruby-deep-indent-paren-style nil)

(require 'ruby-block)
(ruby-block-mode t)
(setq ruby-block-highlight-toggle t)

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

;; flycheck
(add-hook 'ruby-mode-hook
          '(lambda ()
             (setq flycheck-checker 'ruby-rubocop)
             (setq flycheck-check-syntax-automatically '(mode-enabled save))
             (flycheck-mode 1)))
