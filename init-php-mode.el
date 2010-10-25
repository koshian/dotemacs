;; for PHP-mode
(add-hook 'php-mode-hook
          '(lambda ()
             (progn
               (setq indent-tabs-mode t)
               (setq tab-width 8)
               (setq standard-indent 8))))
