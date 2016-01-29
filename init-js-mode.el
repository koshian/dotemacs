(autoload 'js-mode "js" "JavaScript" t)
(setq auto-mode-alist
      (cons
       '("\\.js$" . js-mode) auto-mode-alist))

(if (locate-library "auto-complete")
    (add-hook 'js-mode-hook
              (lambda ()
                (add-to-list 'ac-sources 'ac-source-abbrev)
                (load-auto-complete))))
