; GNU EmacsのdeleteキーとBackspaceキーを正しく動作させる
(unless (featurep 'xemacs)
    (progn
      (define-key function-key-map [backspace] "\010")
      ;(define-key function-key-map [backspace] "\177") ;個人的な好みでBSもDELに
      (define-key function-key-map [delete] "\177")
      (global-set-key "\177" 'delete-char)))

;; GNU Emacs21 の [Home] Key と [End] Key を従来の動作に戻す
(unless (featurep 'xemacs)
  (if (>= emacs-major-version 21)
      (progn
	(define-key global-map [home] 'beginning-of-buffer)
	(define-key global-map [end] 'end-of-buffer))))

;; C-z を無効化 (うっかりバックグラウンドに送ってしまわないように。)
(unless (locate-library "elscreen")
  (global-unset-key "\C-z"))
;(global-unset-key "\C-z" 'undo)

;; 置換(これもバックグラウンドへ送ってしまうのを防ぐため)
(global-set-key "\C-x\C-z" 'query-replace)

;; C-x pでC-x oの逆動作(前のバッファに戻る)
;(global-set-key "\C-x\p" 'previous-multiframe-window)
(unless (featurep 'xemacs)
  ;; from *Messages* <http://pure.fan.gr.jp/simm/d/20040102.html#p02>
  (defun backward-other-window (arg &optional all-frames)
    "Select AEG'th different window on this frame, going backwards.
This is just like calling `other-window' with ARG negated."
    (interactive "p")
    (other-window (- arg) all-frames)))
(define-key global-map "\M-o" 'backward-other-window)
(global-set-key "\C-x\p" 'backward-other-window)

;; auto-fill-modeの切替え
(global-set-key [(super a)] 'auto-fill-mode)

;; isearch中にキーワードをエディット
(define-key isearch-mode-map "\C-k" 'isearch-edit-string)

;; クリップボードに入ってる単語をCannaに登録
(global-set-key "\C-x\C-o" 'canna-touroku-region)

;; bufferの文字コード変換
;;(global-set-key [(super c)] 'set-buffer-file-coding-system)
(global-set-key [(super c)] 'set-buffer-correct-coding-system)

(defun set-buffer-correct-coding-system(coding-system &optional force nomodify)
  "Correct coding system"
  (interactive
   (list (read-buffer-file-coding-system)
         current-prefix-arg))
  (let ((coding-system-for-read coding-system)
        (coding-system-for-write coding-system)
        (coding-system-require-warning t))
    (find-alternate-file buffer-file-name)))
    
;  (message "Correct coding system is %s" coding-system))

(defun multiply-by-seven (number)
  "Multiply NUMBER by seven."
  (interactive "p")
  (message "The result is %d" (* 7 number)))
  
(if (boundp 'buffer-file-coding-system)
    (setq-default buffer-file-coding-system 'utf-8)
  (setq default-buffer-file-coding-system 'utf-8))

;; Carbon EmacsではOptionキーをSuperとして使う
(if (featurep 'carbon-emacs-package)
    (setq mac-option-modifier 'super))

;; その他(なんで設定してあるか不明な物
(global-set-key "\C-h" 'backward-delete-char)
(global-set-key "\C-h" 'delete-backward-char)
(global-set-key "\[3~" 'delete-char)
;(global-set-key "\C-x\C-i" 'edict-search-english)
;(global-set-key "\C-s" 'isearch-forward-regexp)
;(global-set-key "\C-r" 'isearch-backward-regexp)

;;; super + hjkl でカーソル移動
;(define-key global-map [(super h)] 'backward-char)
;(define-key global-map [(super j)] 'next-line)
;(define-key global-map [(super k)] 'previous-line)
;(define-key global-map [(super l)] 'forward-char)

;; ^H が backspace になってるので
(define-key global-map [(super h)] 'help)

;; Command-Key and Option-Key
(when (eq window-system 'ns)
  (setq ns-command-modifier (quote meta))
  (setq ns-alternate-modifier (quote super)))

;新しい行を勝手に作らない
(setq next-line-add-newlines nil)

;; Emacs20以降ならiswitchbを使う。
(if (and (>= emacs-major-version 20)
         (< emacs-major-version 24))
    (progn
      (iswitchb-mode)
      (iswitchb-default-keybindings)))

;; After Emacs 24, use icomplete-mode
(if (>= emacs-major-version 24)
      (icomplete-mode))

(setq fill-column 60)

(require 'font-lock)
(if (not (featurep 'xemacs))
    (global-font-lock-mode t))

;; no use tab code;
(setq-default indent-tabs-mode nil)

;; tab style
(setq-default standard-indent 4)
(setq-default c-basic-offset 4)

;; 大文字小文字を区別しない
(setq read-file-name-completion-ignore-case t)

;; use aspell
(setq ispell-program-name "aspell")

;; it's all text の文字化け対策
(add-hook 'server-visit-hook
          (lambda ()
            (set-terminal-coding-system 'utf-8)
            (set-keyboard-coding-system 'utf-8)))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(builtin-face ((((class color) (background light)) (:foreground "purple"))))
 '(comment-face ((((class color) (background light)) (:foreground "IndianRed"))))
 '(constant-face ((((class color) (background light)) (:foreground "black"))))
 '(function-name-face ((((class color) (background light)) (:foreground "blue"))))
 '(keyword-face ((((class color) (background light)) (:foreground "blue"))))
 '(sh-heredoc-face ((((class color) (background light)) (:foreground "IndianRed"))) t)
 '(string-face ((((class color) (background light)) (:foreground "purple"))))
 '(type-face ((((class color) (background light)) (:foreground "IndianRed"))))
 '(variable-name-face ((((class color) (background light)) (:foreground "DarkGreen"))))
 '(warning-face ((((class color) (background light)) (:foreground "blue")))))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (vue-mode rainbow-mode yaml-mode typescript-mode slim-mode scss-mode ruby-tools ruby-test-mode ruby-refactor ruby-interpolation ruby-hash-syntax ruby-end ruby-electric ruby-block ruby-additional robe rinari jump php-mode moz-controller moz markdown-mode+ markdown-mode less-css-mode inflections haml-mode epl elscreen edit-server-htmlize edit-server dash codic ac-inf-ruby pcre2el))))
