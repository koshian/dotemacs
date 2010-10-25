(when (require 'rcodetools nil t)
  (setq rct-find-tag-if-available nil)

  (defun make-ruby-scratch-buffer ()
    (with-current-buffer (get-buffer-create "*ruby scratch*")
      (ruby-mode)
      (current-buffer)))

  (defun ruby-scratch ()
    (interactive)
    (pop-to-buffer (make-ruby-scratch-buffer)))

  (add-hook
   'ruby-mode-hook
   '(lambda ()
      (mapc (lambda (pair)
              (apply #'define-key ruby-mode-map pair))
            (list
             '([(meta i)] rct-complete-symbol)
             '([(meta control i)] rct-complete-symbol)
             '([(control c) (control t)] ruby-toggle-buffer)
             '([(control c) (control d)] xmp)
             '([(control c) (control f)] rct-ri))))))

(autoload 'ruby-mode "ruby-mode"
  "Mode for editing ruby source files" t)
(setq auto-mode-alist
      (append '(("\\.rb$" . ruby-mode)) auto-mode-alist))
(setq interpreter-mode-alist (append '(("ruby" . ruby-mode))
                                     interpreter-mode-alist))
(autoload 'run-ruby "inf-ruby"
  "Run an inferior Ruby process")
(autoload 'inf-ruby-keys "inf-ruby"
  "Set local key defs for inf-ruby in ruby-mode")
(add-hook 'ruby-mode-hook
          '(lambda ()
            (inf-ruby-keys)))
