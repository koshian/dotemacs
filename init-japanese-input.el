(when (locate-library "yc")
  (load "yc")
  (global-yc-mode 1)
  (global-set-key "\C-o" 'canna-toggle-japanese-mode)
  (global-set-key "\C-o" 'yc-input-mode)
  (setq yc-use-color nil)
  (define-key yc-edit-mode-map "\C-h" 'yc-edit-backward-delete-char))

(when (locate-library "uim")
  (set-language-environment "Japanese")
  ;; MacUIM
  ; (when (eq system-type 'darwin)
  ;  (setq uim-bin-path "/Library/Frameworks/UIM.framework/Versions/Current/bin/")
  ;  (setq uim-el-agent (concat uim-bin-path "uim-el-agent"))
  ;  (setq uim-el-helper-agent (concat uim-bin-path "uim-el-helper-agent")))

  ;; uim.el
  (require 'uim)
  (setq uim-default-im-prop '("action_anthy_utf8_hiragana"
                              "action_google-cgiapi-jp_hiragana"
                              "action_mozc_hiragana"))
  (setq uim-default-im-engine "google-cgiapi-jp")
  (global-set-key "\C-o" 'uim-mode)
  (setq uim-candidate-display-inline t)
  (setq uim-lang-code-alist
        (cons '("Japanese" "Japanese" utf-8 "UTF-8")
              (delete (assoc "Jpanese" uim-lang-code-alist)
                      uim-lang-code-alist))))

(when (locate-library "mozc")
  (require 'mozc)
  (set-language-environment "Japanese")
  (setq default-input-method "japanese-mozc")
  (setq mozc-candidate-style 'echo-area)
  (setq mozc-candidate-style 'overlay)
  (global-set-key (kbd "C-o") 'toggle-input-method))
