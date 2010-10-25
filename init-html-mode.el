(add-hook 'html-mode-hook
          (lambda ()
            (if (<= (buffer-size) 0)
                (set-buffer-file-coding-system 'utf-8-unix))))

(define-skeleton html-blockquote
  "HTML blockquote tag."
  nil
  (if (bolp) nil ?\n)
  "<blockquote>" _ (if sgml-xml-mode "</blockquote>"))

(define-skeleton html-strong
  "HTML strong tag."
  nil
  "<strong>" _ "</strong>")

(add-hook
 'html-mode-hook
 (lambda ()
   (progn
     (define-key html-mode-map "\C-c\C-cb" 'html-blockquote)
     (define-key html-mode-map "\C-c\C-cs" 'html-strong))))

(setq auto-insert-alist
      (append
       '(("\\.html$" . "html-template.html")) auto-insert-alist))

