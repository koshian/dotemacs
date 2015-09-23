;メニューバーオフ
(menu-bar-mode 0)
; スクロールバーオフ
(unless (eq window-system nil)
    (scroll-bar-mode nil))
; さらにemacs21以上の場合はこれを追加。
(if (>= emacs-major-version 21)
    (progn
      ; ツールバーオフ
      (unless (eq window-system nil)
        (tool-bar-mode 0))
 ; fringeを消す(けどこれじゃ消えない……どーやんの?(T-T)
      (setq-default left-fringe  0)
      (setq-default right-fringe  0)
      (setq-default fringe 0)))

(if (featurep 'carbon-emacs-package)
    (when (eq window-system 'mac)
      (tool-bar-mode 0)
      (scroll-bar-mode nil)
      (scroll-bar-mode nil))
  (menu-bar-mode 0))

;; CocoaEmacs fonts
(when (eq window-system 'ns)
  (set-language-environment "Japanese")
  (set-default-coding-systems 'utf-8-unix)
  (set-clipboard-coding-system 'utf-8)
  (set-terminal-coding-system 'utf-8)
  (prefer-coding-system 'utf-8-unix)

  (set-face-attribute 'default nil
                      :family "Ricty"
                      :height 140)
  (set-fontset-font (frame-parameter nil 'font)
                    'japanese-jisx0208
                    (cons "Ricty" "iso10646-1"))
  (set-fontset-font (frame-parameter nil 'font)
                    'japanese-jisx0212
                    (cons "Ricty" "iso10646-1"))
  (set-fontset-font (frame-parameter nil 'font)
                    'katakana-jisx0201
                    (cons "Ricty" "iso10646-1")))

(global-font-lock-mode t)
(if window-system
    (progn
      ;; font-lock mode
      (require 'font-lock)
      (global-font-lock-mode t)
      (add-hook 'font-lock-mode-hook
		'(lambda ()
;		   (set-face-foreground 'font-lock-builtin-face "purple")
		   (set-face-foreground 'font-lock-comment-face "IndianRed")
		   (set-face-foreground 'font-lock-string-face  "purple")
		   (set-face-foreground 'font-lock-keyword-face "blue")
;		   (set-face-foreground 'font-lock-constant-face "black")
		   (set-face-foreground 'font-lock-function-name-face "blue")
		   (set-face-foreground 'font-lock-type-face "IndianRed")
		   (set-face-foreground
		    'font-lock-variable-name-face "DarkGreen")
;		   (set-face-foreground 'font-lock-warning-face "blue")
		   (set-face-bold-p 'font-lock-function-name-face t)
;		   (set-face-bold-p 'font-lock-warning-face t)
		   ))))

(if (>= emacs-major-version 21)
    (progn
      ;; font-lock mode
      (require 'font-lock)
      (global-font-lock-mode t)
      (add-hook 'font-lock-mode-hook
		'(lambda ()
		   (set-face-bold-p 'font-lock-function-name-face t)
		   (set-face-bold-p 'font-lock-warning-face t)))))

(if (>= emacs-major-version 21)
    (custom-set-faces
     '(sh-heredoc-face ((((class color) (background light))
			 (:foreground "IndianRed"))))
     '(builtin-face ((((class color) (background light))
		      (:foreground "purple"))))
     '(comment-face ((((class color) (background light))
		      (:foreground "IndianRed"))))
     '(string-face  ((((class color) (background light))
		      (:foreground "purple"))))
     '(keyword-face ((((class color) (background light))
		      (:foreground "blue"))))
     '(constant-face ((((class color) (background light))
		       (:foreground "black"))))
     '(function-name-face ((((class color) (background light))
			    (:foreground "blue"))))
     '(variable-name-face ((((class color) (background light))
			    (:foreground "DarkGreen"))))
     ;'(variable-name-face ((((class color) (background light))
	;		    (:foreground "Green"))))
     '(type-face ((((class color) (background light))
		   (:foreground "IndianRed"))))
     '(warning-face ((((class color) (background light))
		      (:foreground "blue"))))))

