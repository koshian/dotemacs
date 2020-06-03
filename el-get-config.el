;;; el-get-config.el --- Configuration for el-get    -*- lexical-binding: t; -*-

;; Copyright (C) 2016  Sugano `Koshian' Yoshihisa(E)

;; Author: Sugano `Koshian' Yoshihisa(E) <koshian@foxking.org>
;; Keywords: 

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:

;; 

(setq
 el-get-install-url
 "https://raw.githubusercontent.com/dimitri/el-get/master/el-get-install.el")

;; el-get setting from http://tarao.hatenablog.com/entry/20150221/1424518030
(add-to-list 'load-path (locate-user-emacs-file "el-get/el-get"))
(unless (require 'el-get nil 'noerror)
  (with-current-buffer
      (url-retrieve-synchronously el-get-install-url)
    (goto-char (point-max))
    (eval-print-last-sexp)))

(unless (require 'el-get nil 'noerror)
  (require 'package)
  (add-to-list 'package-archives
 		   '("melpa" . "http://melpa.org/packages/") t)
  (package-refresh-contents)
  (package-initialize)
  (package-install 'el-get)
  (require 'el-get))

(add-to-list 'el-get-recipe-path "~/.emacs.d/el-get/el-get/recipes")
;(add-to-list 'el-get-recipe-path "~/.emacs.d/melpa")
(el-get 'sync 'el-get)

(el-get-bundle elpa:pcre2el)
(el-get-bundle anything)
(el-get-bundle popup)
(el-get-bundle auto-complete)
(el-get-bundle ac-inf-ruby)
(el-get-bundle elpa:codic)
(el-get-bundle elpa:dash)
(el-get-bundle elpa:edit-server)
(el-get-bundle elpa:edit-server-htmlize)
(el-get-bundle elpa:elscreen)
(el-get-bundle elpa:epl)
(el-get-bundle elpa:pkg-info)
(el-get-bundle elpa:flycheck)
(el-get-bundle elpa:haml-mode)
(el-get-bundle elpa:inf-ruby)
(el-get-bundle elpa:inflections)
(el-get-bundle elpa:less-css-mode)
(el-get-bundle elpa:markdown-mode)
(el-get-bundle elpa:markdown-mode+)
(el-get-bundle elpa:moz)
(el-get-bundle elpa:moz-controller)
(el-get-bundle elpa:php-mode)
(el-get-bundle elpa:jump)
(el-get-bundle elpa:rinari)
(el-get-bundle elpa:findr)
(el-get-bundle elpa:robe)
(el-get-bundle elpa:ruby-additional)
(el-get-bundle elpa:ruby-block)
(el-get-bundle elpa:ruby-compilation)
(el-get-bundle elpa:ruby-electric)
(el-get-bundle elpa:ruby-end)
(el-get-bundle elpa:ruby-hash-syntax)
(el-get-bundle elpa:ruby-interpolation)
(el-get-bundle elpa:ruby-refactor)
(el-get-bundle elpa:ruby-test-mode)
(el-get-bundle elpa:ruby-tools)
(el-get-bundle elpa:sass-mode)
(el-get-bundle elpa:scss-mode)
(el-get-bundle elpa:slim-mode)
(el-get-bundle elpa:typescript-mode)
(el-get-bundle elpa:yaml-mode)
;(el-get-bundle elpa:emoji-fontset
;  (emoji-fontset-enable "Symbola"))
;(el-get-bundle elpa:emoji-cheat-sheet-plus)
(el-get-bundle elpa:rainbow-mode)
;(el-get-bundle elpa:rainbow-mode)
(el-get-bundle elpa:yasnippet)
(el-get-bundle mmm-mode)
(el-get-bundle elpa:edit-indirect)
(el-get-bundle elpa:ssass-mode)
(el-get-bundle elpa:typescript-mode)
(el-get-bundle elpa:vue-mode)
(el-get-bundle elpa:vue-html-mode)
(el-get-bundle elpa:flymake-jslint)
(el-get-bundle dockerfile-mode)
(el-get-bundle web-mode)
(el-get-bundle editorconfig)
(el-get-bundle add-node-modules-path)
;;; Code:



(provide 'el-get-config)
;;; el-get-config.el ends here
