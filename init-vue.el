;;; init-vue.el --- config vue-mode                  -*- lexical-binding: t; -*-

;; Copyright (C) 2017  Sugano `Koshian' Yoshihisa(E)

;; Author: Sugano `Koshian' Yoshihisa(E) <koshian@foxking.org>
;; Keywords: 

;(setq auto-mode-alist
;      (cons
;       '("\\.vue$" . vue-mode) auto-mode-alist))
(add-hook 'vue-mode-hook
          (lambda ()
            (add-to-list 'ac-sources 'ac-source-abbrev)
            (add-to-list 'ac-sources 'ac-source-yasnippet)
            (auto-complete-mode t)))

;(provide 'init-vue)
;;; init-vue.el ends here
