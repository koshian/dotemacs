(add-hook 'java-mode-common-hook
  '(lambda () (put 'c-indent-command 'disabled t)
     (define-key java-mode-map "\t" 'tab-to-tab-stop)
     (setq tab-width 8)
     (setq indent-tabs-mode t)))
