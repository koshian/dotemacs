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

;; dot.lookup
;; ;; stemmer
;; (lookup-set-dictionary-option
;;  "ndtp+localhost:eiwa/chujiten" ':stemmer 'stem-english)
;; (lookup-set-dictionary-option
;;  "ndeb+/usr/local/share/dict/chujiten:chujiten" ':stemmer 'stem-english)

;; ;; max
;; ;(defcustom lookup-max-hits 0
;; ;	:type 'integer
;; ;	:group 'lookup-general-options)
;; ;(defcustom lookup-max-text 0
;; ;	:type 'integer
;; ;	:group 'lookup-general-options)

;; (setq ndeb-binary-programs
;; 	'((wave "mplayer")
;; 	  (mpeg "mplayer")))
;; 	;'((wave "artsplay")
;; 	;  (mpeg "mplayer")))

;; (setq ndeb-play-sound-from-entry "z")
;; (setq ndeb-play-movie-from-entry "x")
;; ;(define-key lookup-entry-mode-map "z" 'lookup-entry-play-ndeb-sound)
;; ;(define-key lookup-entry-mode-map "x" 'lookup-entry-play-ndeb-movie)

;; (if (<= emacs-major-version 20)
;;     (setq lookup-use-bitmap t))
