(if (locate-library "yc")
    (progn
      (load "yc")
      (global-yc-mode 1)
      (global-set-key "\C-o" 'canna-toggle-japanese-mode)
      (global-set-key "\C-o" 'yc-input-mode)
      (setq yc-use-color nil)
      (define-key yc-edit-mode-map "\C-h" 'yc-edit-backward-delete-char)))







