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

