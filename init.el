;;; init.el --- inisialize emacs
;;; -*- mode: emacs-lisp; coding: utf-8-unix; indent-tabs-mode: nil -*-

;; Copyright (C) 2010  Sugano `Koshian' Yoshihisa(E)

;; Author: Sugano `Koshian' Yoshihisa(E) <koshian@foxking.org>

;;; Code:

(setq user-full-name "Sugano `Koshian' Yoshihisa(E)"
      user-mail-address "koshian@foxking.org")

(setq vc-header-alist nil)

; use auto-complete
(if (locate-library "auto-complete")
    (ac-config-default))

(if (locate-library "package")
    (progn
      (require 'package)
      (add-to-list 'load-path "~/.emacs.d/packages/")
      (add-to-list 'package-archives
		   '("melpa" . "http://melpa.milkbox.net/packages/") t)
      (add-to-list 'package-archives
		   '("marmalade" . "http://marmalade-repo.org/packages/") t)
      (package-initialize)))

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

;; template settings
(setq auto-insert-directory templates-directory)
(auto-insert-mode t)
(setq auto-insert-query nil)

;; load private setting
(if (locate-library private-file)
    (load private-file))

;; load essential libraries.
;(load-directory-files libraries-directory "^.+el$")

;; load preferences.
(load-directory-files preferences-directory "^init-.+el$")
(load custom-file)

;;; init.el ends here
