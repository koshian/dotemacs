;;; init.el --- inisialize emacs
;;; -*- mode: emacs-lisp; coding: utf-8-unix; indent-tabs-mode: nil -*-

;; Copyright (C) 2010  Sugano `Koshian' Yoshihisa(E)

;; Author: Sugano `Koshian' Yoshihisa(E) <koshian@foxking.org>

;;; Code:

(when (> 23 emacs-major-version)
  (setq user-emacs-directory "~/.emacs.d"))
(setq preferences-directory user-emacs-directory
      libraries-directory (expand-file-name "library" user-emacs-directory)
      temlates-directory (expand-file-name "template" user-emacs-directory)
      custom-file
      (expand-file-name "customize.el" user-emacs-directory))

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
(setq auto-insert-directory temlates-directory)
(auto-insert-mode t)
(setq auto-insert-query nil)

;; load essential libraries.
(load-directory-files libraries-directory "^.+el$")

;; load preferences.
(load-directory-files preferences-directory "^init-.+el$")
(load custom-file)

;;; init.el ends here
