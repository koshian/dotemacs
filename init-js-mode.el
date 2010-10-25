  (autoload 'js-mode "js" "JavaScript" t)
  (setq auto-mode-alist
	(cons
	 '("\\.js$" . js-mode) auto-mode-alist))
