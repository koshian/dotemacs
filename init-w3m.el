(autoload 'w3m "w3m" "Interface for w3m on Emacs." t)
(autoload 'w3m-find-file "w3m" "w3m interface function for local file." t)
(autoload 'w3m-search "w3m-search" "Search QUERY using SEARCH-ENGINE." t)
(autoload 'w3m-weather "w3m-weather" "Display weather report." t)
(autoload 'w3m-antenna "w3m-antenna" "Report chenge of WEB sites." t)
(autoload 'w3m-namazu "w3m-namazu" "Search files with Namazu." t)
(if (>= emacs-major-version 21)
    (progn
      (setq w3m-default-display-inline-images t)
      (setq w3m-display-inline-images t)))

;(autoload 'w3m "w3m" t)
;(autoload 'browse-url "w3m" t)
(setq w3m-command "w3m")
;(setq w3m-command "w3mmee")
;(setq w3m-command-arguments '("-cookie" "-F"))
(setq w3m-use-cookies t)
;(setq w3m-cookie-accept-domains "slashdot.jp")
;(setq w3m-command-arguments '("-cookie"))
;(setq w3m-command-arguments '(""))
;(setq w3m-command-arguments nil)
;(setq w3m-async-exec t)
;(setq w3m-type 'w3mmee)
;(require 'mime-w3m)
(setq mime-w3m-display-inline-image t)
(setq w3m-search-default-engine "google")
(setq w3m-namazu-default-index "~/.namazu/works")
(setq namazu-system-index-dir "/usr/local/var/namazu/index")
(setq w3m-namazu-index-alist
      '(("works" "~/.namazu/works")
	("irc" "~/.namazu/irc")
	("maildir" "~/.namazu/maildir/")
;	("doc-linux-ja" "~/.namazu/doc-linux-ja")
;	("doc-linux-en" "~/.namazu/doc-linux-en")
	("doc-linux" "/usr/local/var/namazu/index/doc-linux")
	("rfc" "/usr/local/var/namazu/index/rfc")))
(global-set-key [(super s)] 'w3m-namazu)

;w3m-search-engine-alist
;(setq browse-url-browser-function
;	'(("^mailto:" . browse-url-plus-compose-mail)
;	  ("^ftp:"    . browse-url-plus-wget-url)
;	  ("."        . w3m-browse-url)))

;   (if (featurep 'xemacs)
;    (
;     (define-key global-map [(control return)] 'browse-url-plus-x)
;     (define-key global-map [(meta return)] 'browse-url-alternative))
;    (
;     (global-set-key [C-return] 'browse-url)
;     (global-set-key [M-return] 'browse-url-alternative)))
    ;;; @ browse-url

;; autoload
; (autoload 'browse-url-interactive-arg "browse-url")
;
; (autoload browse-url-browser-function "browse-url"
;   "Ask a WWW browser to show a URL." t)
; (autoload 'browse-url-at-point "browse-url"
;   "Ask a WWW browser to load the URL at or before point." t)
; (autoload 'browse-url-at-mouse "browse-url"
;   "Ask a WWW browser to load a URL clicked with the mouse." t)
; (autoload 'browse-url-of-buffer "browse-url"
;   "Ask a WWW browser to display BUFFER." t)
; (autoload 'browse-url-of-file "browse-url"
;   "Ask a WWW browser to display FILE." t)
; (autoload 'browse-url-of-dired-file "browse-url"
;   "In Dired, ask a WWW browser to display the file named on this line." t)
;
;;; key bindings（PM 版で２ボタンマウスだとこうすればいいでしょう）
;  ;; Emacs の全てのバッファ、モードで使用可能にする
  ;; 以下の例では [Shift]+[ボタン１] に割り当てる
;     (global-set-key [S-mouse-1] 'browse-url-at-mouse)
  ;; Mew のメッセージモードで使う場合。以下の例は [ボタン２]に割り当てる
  ;; 実際には mew-message-mode-hook とか mew-init-hook に記述してください。
  ;   (define-key mew-message-mode-map [mouse-2] 'browse-url-at-mouse)
;(global-set-key [C-return] 'browse-url)
;(global-set-key [M-return] 'browse-url-alternative)


;(setq browse-url-browser-function 'w3m-browse-url)

;(setq browse-url-browser-function 'w3m-browse-url)
;(autoload 'w3m-browse-url "w3m" "Ask a WWW browser to show a URL." t)
;(global-set-key "\C-xm" 'browse-url-at-point)
;(global-set-key "\C-xm" 'w3m-browse-url)

(autoload 'w3m-browse-url "w3m" "Ask a WWW browser to show a URL." t)
(setq browse-url-browser-function 'w3m-browse-url)

;(if (featurep 'xemacs)
;    (global-set-key [(control return)] 'w3m-browse-url)
;  (global-set-key [C-return] 'w3m-browse-url))
;(global-set-key "\C-x\C-m" 'w3m-browse-url)
(global-set-key [(meta return )] 'w3m-browse-url)
;(global-set-key [(super m)] 'w3m-view-url-with-external-browser)
(global-set-key [(super f)] 'w3m-find-file)
(global-set-key [(super m)] 'w3m-view-this-url-new-session)

;; emacs-wget
(if (>= emacs-major-version 20)
    (progn
     (add-to-list 'load-path "~/lib/site-lisp/wget")
     (autoload 'wget "wget" "wget interface for Emacs." t)
     (autoload 'wget-web-page "wget" "wget interface to download whole web page." t)
     (load "w3m-wget")
     (autoload 'w3-wget "w3-wget" "wget interface for Emacs/W3." t)
     (setq wget-download-directory "~/tmp")
     (global-set-key [(super g)] 'wget)
     ))
  

; mailto anchor
;(defun w3m-wl-draft (arg)
;  (setq to (cdr (split-string
;		  (car (split-string arg "?")) ":")))
;  (setq subject (cdr (split-string 
;		  (cdr (split-string arg "?")) "=")))
;  (setq subject "w3m-wl-draft experience")
;  (wl-draft (list (cons 'To to)
;		  (cons 'Cc cc)
;		  (cons 'Subject subject))))



;(setq w3m-mailto-url-function 'w3m-wl-draft)
;(w3m-wl-draft "mailto:koshian@misao.gr.jp")

;;
;; emacs-w3m で見られない URL のブラックリスト
;; from: http://at-aka.blogspot.com/2005/10/quickurl-emacs-w3m-firefox-url.html
(setq browse-url-dhtml-url-list
      '("http://www.google.com/reader/"
	"http://maps.google.co.jp/"
	"http://map.yahoo.co.jp/"
	"http://map.labs.goo.ne.jp/"
	"http://www.haloscan.com/"
	"http://sitemeter.com/"
	"http://www.hmv.co.jp/"
	"http://www.youtube.com"
))
;;
;; ブラッリストにマッチしたら firefox、しなかったら emacs-w3m。 
;;
(setq browse-url-browser-function 
      `((,(concat "^" (regexp-opt browse-url-dhtml-url-list)) . browse-url-mozilla)
	("." . w3m-browse-url)))


;; Amazon Simple URI
(setq w3m-use-filter t)
 
(setq w3m-filter-rules
      `(
        ("\\`https?://\\(www.\\)?amazon\\.co\\.jp/.+" w3m-filter-amazon)
        ))

(defun w3m-filter-amazon (url)
  (when (and url
             (or (string-match
                  "^\\(https?://\\(?:www\\.\\)?amazon\\.co\\.jp\\)/exec/obidos/ASIN/\\([0-9]+\\)"
                  url)
                 (string-match
                  "^\\(https?://\\(?:www\\.\\)?amazon\\.co\\.jp\\)/o/ASIN/\\([0-9]+\\)"
                  url)
                 (string-match
                  "^\\(https?://\\(?:www\\.\\)?amazon\\.co\\.jp\\)/gp/product/\\([0-9]+\\)"
                  url)
                 (string-match
                  "^\\(https?://\\(?:www\\.\\)?amazon\\.co\\.jp\\)/\\(?:[^/]+/\\)?dp/\\([0-9]+\\)"
                  url)))
    (let* ((base (match-string 1 url))
           (asin (match-string 2 url))
           (shorturls `(,(concat base "/dp/" asin "/")
                        ,(concat base "/o/ASIN/" asin "/")
                        ,(concat base "/gp/product/" asin "/")))
           (case-fold-search t)
           shorturl)
      (goto-char (point-min))
      (setq url (file-name-as-directory url))
      (when (search-forward "<body>" nil t)
        (insert "\n")
        (while (setq shorturl (car shorturls))
          (setq shorturls (cdr shorturls))
          (unless (string= url shorturl)
	    (insert (format "Amazon Short URL: <a href=\"%s\">%s</a><br>\n"
                        shorturl shorturl))))
        (insert "\n")))))

(if (<= emacs-major-version 21)
    (progn
      (setq browse-url-browser-function 'browse-url-netscape)
      (autoload 'browse-url-at-mouse "browse-url"
        "Ask a WWW browser to load a URL clicked with the mouse." t)
      (global-set-key [mouse-2] 'browse-url-netscape))
  (progn
    (setq browse-url-browser-function 'browse-url-firefox)
    (autoload 'browse-url-at-mouse "browse-url-firefox"
      "Ask a WWW browser to load a URL clicked with the mouse." t)
    (global-set-key [mouse-2] 'browse-url-firefox)))


