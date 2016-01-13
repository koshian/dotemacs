(autoload 'js-mode "js" "JavaScript" t)
(setq auto-mode-alist
      (cons
       '("\\.js$" . js-mode) auto-mode-alist))

;; flycheck
(add-hook 'js-mode-hook
          '(lambda ()
             (flycheck-add-next-checker 'javascript-jshint
                                        'javascript-gjslint)
             (flycheck-mode 1)))
