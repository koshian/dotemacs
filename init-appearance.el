;メニューバーオフ
(menu-bar-mode 0)
; スクロールバーオフ
(scroll-bar-mode nil)
; さらにemacs21以上の場合はこれを追加。
(if (>= emacs-major-version 21)
    (progn
      ; ツールバーオフ
      (tool-bar-mode 0)
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

  (let ((my-font-height 120)
        ;(my-font "Monaco")  ;; XCode 3.1 で使っているフォント
        (my-font "Menlo")   ;; XCode 3.2 で使ってるフォント
        ;(my-font "Inconsolata")
        ; (my-font-ja "TakaoGothic")
        (my-font-ja "Osaka")
        ;(my-font-ja "Hiragino Maru Gothic Pro")
        (my-font-ascii "Inconsolata-14"))
    (setq mac-allow-anti-aliasing t)
    ;; フォントサイズの微調節 (12ptで合うように)
    (setq face-font-rescale-alist
          '(("^-apple-hiragino.*" . 1.2)
            (".*osaka-bold.*" . 1.2)
            (".*osaka-medium.*" . 1.2)
            (".*Takao.*" . 1.2)
            (".*Inconsolata.*" . 1.0)
            (".*courier-bold-.*-mac-roman" . 1.0)
            (".*monaco cy-bold-.*-mac-cyrillic" . 0.9)
            (".*monaco-bold-.*-mac-roman" . 0.9)
            ("-cdac$" . 1.3)))

    ;; デフォルトフォント設定
    (when my-font
      (set-face-attribute 'default nil :family my-font :height my-font-height)
      ;;(set-frame-font (format "%s-%d" my-font (/ my-font-height 10)))
      )
    ;; 日本語文字に別のフォントを指定
    (when my-font-ja
      (let ((fn (frame-parameter nil 'font))
            (rg "iso10646-1"))
        (set-fontset-font fn 'ascii `(,my-font-ascii . ,rg))
        (set-fontset-font fn 'katakana-jisx0201 `(,my-font-ja . ,rg))
        (set-fontset-font fn 'japanese-jisx0208 `(,my-font-ja . ,rg))
        (set-fontset-font fn 'japanese-jisx0212 `(,my-font-ja . ,rg))))))


