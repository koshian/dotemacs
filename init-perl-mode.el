;; 新規perlスクリプトはUTF-8
(add-hook 'perl-mode-hook
          (lambda ()
            (if (<= (buffer-size) 0)
                (set-buffer-file-coding-system 'utf-8-unix))))

;; auto-mode の追加
(setq auto-mode-alist (append '(("\\.pm\\'" . perl-mode)
                                ("\\.ph\\'" . perl-mode))
                                auto-mode-alist))

;; 行頭でcperl-mode指定すんのきんし(TT
(setq interpreter-mode-alist
      (append
       '(("cperl" . perl-mode)) interpreter-mode-alist))
(add-hook 'cperl-mode-hook 'perl-mode)


;; for PHP-mode
(add-hook 'php-mode-hook
          '(lambda ()
             (progn
               (setq indent-tabs-mode t)
               (setq tab-width 8)
               (setq standard-indent 8))))

;; for template
(setq auto-insert-alist
      (append
       '(("\\.pl$" . "perl-template.pl")
         ("\\.pm$" . "perl-module-template.pm"))
       auto-insert-alist))
