;; for PHP-mode
(autoload 'php-mode "php-mode" "Major mode for editing php code." t)
(add-to-list 'auto-mode-alist '("\\.php$" . php-mode))
(add-to-list 'auto-mode-alist '("\\.inc$" . php-mode))
(add-hook 'php-mode-hook
          '(lambda ()
             (progn
               (c-set-style "stroustrup")
               (setq indent-tabs-mode t)
               (setq tab-width 8)
               (setq c-basic-offset 8)
               (setq standard-indent 8))))
;; (add-hook 'php-mode-hook
;;           '(lambda ()
;;              (progn
;;                (c-set-style "stroustrup")
;;                (setq indent-tabs-mode nil)
;;                (setq tab-width 2)
;;                (setq c-basic-offset 2)
;;                (setq standard-indent 2))))
