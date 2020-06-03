;;; init.el --- inisialize emacs
;;; -*- mode: emacs-lisp; coding: utf-8-unix; indent-tabs-mode: nil -*-

;; Copyright (C) 2010  Sugano `Koshian' Yoshihisa(E)

;; Author: Sugano `Koshian' Yoshihisa(E) <koshian@foxking.org>

;;; Code:

;; initial setting from http://tarao.hatenablog.com/entry/20150221/1424518030
(when load-file-name
  (setq user-emacs-directory (file-name-directory load-file-name)))

;; my name and address
(setq user-full-name "Sugano `Koshian' Yoshihisa(E)"
      user-mail-address "koshian@foxking.org")

;; no use vc-header
(setq vc-header-alist nil)

; no use tab
(setq-default indent-tabs-mode nil)

; (if (locate-library "package")
;     (progn
;       (require 'package)
;       (add-to-list 'load-path "~/.emacs.d/packages/")
;       (add-to-list 'package-archives
; 		   '("melpa" . "http://melpa.org/packages/") t)
;       (add-to-list 'package-archives
; 		   '("marmalade" . "http://marmalade-repo.org/packages/") t)
;       (package-initialize)))

(add-to-list 'load-path "/usr/local/share/emacs/site-lisp")

(when (require 'edit-server nil t)
  (setq edit-server-new-frame nil)
  (edit-server-start))
(server-start)

(dolist (dir (list
              "/sbin"
              "/usr/sbin"
              "/bin"
              "/usr/bin"
              "/usr/local/bin"
              (expand-file-name "~/bin")
              (expand-file-name "~/.emacs.d/bin")
              (expand-file-name "~/var/go/bin")
              (expand-file-name "/usr/local/var/rbenv/shims")
              ))
  (when (and (file-exists-p dir) (not (member dir exec-path)))
    (setenv "PATH" (concat dir ":" (getenv "PATH")))
    (setq exec-path (append (list dir) exec-path))))

(when (> 23 emacs-major-version)
  (setq user-emacs-directory "~/.emacs.d"))
(setq preferences-directory user-emacs-directory
      libraries-directory (expand-file-name "library" user-emacs-directory)
      templates-directory (expand-file-name "template" user-emacs-directory)
      custom-file
      (expand-file-name "customize.el" user-emacs-directory)
      private-file
      (expand-file-name "private.el" user-emacs-directory))


(defun load-directory-files (dir &optional regex)
  (let*
      ((regex (or regex ".+"))
       (files (and
               (file-accessible-directory-p dir)
               (directory-files dir 'full regex))))
    (mapc (lambda (file)
            (when (load file nil t)
              (message "`%s' loaded." file))) files)))

;; Template settings
(setq auto-insert-directory templates-directory)
(auto-insert-mode t)
(setq auto-insert-query nil)

;; load private setting
(if (locate-library private-file)
    (load private-file))

;; load essential libraries.
;(load-directory-files libraries-directory "^.+el$")

;; load el-get config
(load (expand-file-name "el-get-config.el" user-emacs-directory))
;; load preferences.
(load-directory-files preferences-directory "^init-.+el$")
(load custom-file)

(setenv "EDITORCONFIG_CORE_LIBRARY_PATH"
        (substitute-in-file-name "$HOME/.emacs.d/el-get/editorconfig/"))

(with-eval-after-load 'editorconfig
  (add-to-list 'editorconfig-indentation-alist
               '(vue-mode css-indent-offset
                          sgml-basic-offset
                          vue-html-tab-width
                          ssass-tab-width
                          )))
(editorconfig-mode t)

;;; init.el ends here
