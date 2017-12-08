(add-hook 'java-mode-hook
  '(lambda () (put 'c-indent-command 'disabled t)
     (define-key java-mode-map "\t" 'tab-to-tab-stop)
     (setq tab-width 4)
     (setq indent-tabs-mode t)))
