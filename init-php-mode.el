;; for PHP-mode
(autoload 'php-mode "php-mode" "Major mode for editing php code." t)
(add-to-list 'auto-mode-alist '("\\.php$" . php-mode))
(add-to-list 'auto-mode-alist '("\\.inc$" . php-mode))


(add-hook 'php-mode-hook
          (lambda ()
            ; (c-set-style "linux")
            (setq php-mode-force-pear t)
            (setq tab-width 4
                  c-basic-offset 4
                  standard-indent 4
                  c-hanging-comment-ender-p nil
                  indent-tabs-mode nil)))

(add-hook 'php-mode-hook (lambda ()
    (defun ywb-php-lineup-arglist-intro (langelem)
      (save-excursion
        (goto-char (cdr langelem))
        (vector (+ (current-column) c-basic-offset))))
    (defun ywb-php-lineup-arglist-close (langelem)
      (save-excursion
        (goto-char (cdr langelem))
        (vector (current-column))))
    (c-set-offset 'arglist-intro 'ywb-php-lineup-arglist-intro)
    (c-set-offset 'arglist-close 'ywb-php-lineup-arglist-close)))

;          (setq php-mode-force-pear t)
;            (setq tab-width 4)
;            (setq c-basic-offset 4)
;            (setq indent-tabs-mode nil)))

             ; (php-set-style "pear)

;; (add-hook 'php-mode-hook
;;           '(lambda ()
;;              (progn
;;                (c-set-style "stroustrup")
;;                (setq indent-tabs-mode nil)
;;                (setq tab-width 2)
;;                (setq c-basic-offset 2)
;;                (setq standard-indent 2))))
