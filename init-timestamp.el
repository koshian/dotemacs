(setq time-stamp-start "[Ll]ast[ \-][Mm]odified:[ \t]*")
(setq time-stamp-end "\\($\\|<\\)")
(setq time-stamp-format "%3a %3b %2d %02H:%02M:%02S %Z %:y")
(add-hook 'before-save-hook 'time-stamp)
(defun time-stamp-with-locale-c ()
  (let ((system-time-locale "C"))
    (time-stamp)
    nil))
(if (not (memq 'time-stamp-with-locale-c write-file-hooks))
    (add-hook 'write-file-hooks 'time-stamp-with-locale-c))
(setq time-stamp-line-limit 10) ;; ファイルの先頭から10行以内を探す
;(setq time-stamp-line-limit -4) ;; ファイルの後ろから４行以内を検索
;(add-hook 'yahtml-mode-hook
;          '(lambda ()
;             (setq time-stamp-start ":[ \t]+<")
;             (setq time-stamp-end ">")
;             (setq time-stamp-format "%:y 年/%02m 月/%02d 日")
;             ))
(add-hook 'html-helper-mode-hook
          '(lambda ()
             (make-variable-buffer-local 'time-stamp-line-limit)
             (setq time-stamp-line-limit -10)))

(add-hook 'html-mode-hook
          '(lambda ()
             (make-variable-buffer-local 'time-stamp-line-limit)
             (setq time-stamp-line-limit -10)))
