(remove-hook 'ruby-mode-hook 'ruby-electric-mode)
 
; enable and disable ruby-electric-mode to stop ruby-mode 
; from handling curly braces
;(defun ruby-mode-hook-for-fixing-ruby-electric ()
;  (require 'ruby-electric)
;  (ruby-electric-mode)
;  (ruby-electric-mode -1))
;(add-hook 'ruby-mode-hook 
;          'ruby-mode-hook-for-fixing-ruby-electric)
;(remove-hook 'ruby-mode-hook 'ruby-electric-mode)


(if (locate-library "auto-complete")
    (add-hook 'ruby-mode-hook
              (lambda () (add-to-list 'ac-sources 'ac-source-abbrev)))
  (if (locate-library "robe")
      (add-hook 'robe-mode-hook 'ac-robe-setup)))

(if (locate-library "ruby-end")
    (require 'ruby-end))

