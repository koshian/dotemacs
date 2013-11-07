(autoload 'lookup "lookup" nil t)
(autoload 'lookup-region "lookup" nil t)
(autoload 'lookup-pattern "lookup" nil t)
;(setq lookup-search-agents '((ndtp "localhost")))
(setq lookup-search-agents '((ndspell)
                             (ndeb "/usr/local/share/dict/chujiten")
                             (ndeb "/usr/local/share/dict/kojien")
                             (ndeb "/usr/local/share/dict/tougou99-2"
                                   :disable ("chujiten"))
                             (ndeb "/usr/local/share/dict/wdic")
                             ))

;; キーバインドの設定
;;(define-key ctl-x-map "l" 'lookup)              ; C-x l - lookup
;;(define-key ctl-x-map "i" 'lookup-region)       ; C-x y - lookup-region
(define-key ctl-x-map "\C-i" 'lookup-pattern)   ; C-x C-y - lookup-pattern
(setq lookup-use-kakasi t)

;; 最大表示数
(setq lookup-max-hits 256)

;; Mac Dictionaries
;; from http://sakito.jp/mac/dictionary.html
(defun dictionary ()
  "dictionary.app"
  (interactive)

  (let ((editable (not buffer-read-only))
        (pt (save-excursion (mouse-set-point last-nonmenu-event)))
        beg end)

    (if (and mark-active
             (<= (region-beginning) pt) (<= pt (region-end)) )
        (setq beg (region-beginning)
              end (region-end))
      (save-excursion
        (goto-char pt)
        (setq end (progn (forward-word) (point)))
        (setq beg (progn (backward-word) (point)))
        ))

    (browse-url
     (concat "dict:///"
             (url-hexify-string (buffer-substring-no-properties beg end))))))

(when (eq window-system 'ns)
  (define-key global-map (kbd "C-x C-i") 'dictionary))

