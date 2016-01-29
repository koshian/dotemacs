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

(el-get-bundle elpa:ac-inf-ruby)
(el-get-bundle elpa:anything)
(el-get-bundle elpa:auto-complete)
(el-get-bundle elpa:auto-install)
(el-get-bundle elpa:codesearch)
(el-get-bundle elpa:codic)
(el-get-bundle elpa:coffee-mode)
(el-get-bundle elpa:dash)
(el-get-bundle elpa:edit-server)
(el-get-bundle elpa:edit-server-htmlize)
(el-get-bundle elpa:elscreen)
(el-get-bundle elpa:epl)
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
(el-get-bundle elpa:react-snippets)
(el-get-bundle elpa:rinari)
(el-get-bundle elpa:robe)
(el-get-bundle elpa:ruby-additional)
(el-get-bundle elpa:ruby-block)
(el-get-bundle elpa:ruby-compilation)
(el-get-bundle elpa:ruby-dev)
(el-get-bundle elpa:ruby-electric)
(el-get-bundle elpa:ruby-end)
(el-get-bundle elpa:ruby-hash-syntax)
(el-get-bundle elpa:ruby-interpolation)
(el-get-bundle elpa:ruby-refactor)
(el-get-bundle elpa:ruby-test-mode)
(el-get-bundle elpa:ruby-tools)
(el-get-bundle elpa:rubyinterpol)
(el-get-bundle elpa:sass-mode)
(el-get-bundle elpa:scss-mode)
(el-get-bundle elpa:slim-mode)
(el-get-bundle elpa:typescript)
(el-get-bundle elpa:yaml-mode)
(el-get-bundle elpa:dropdown-list)
(el-get-bundle elpa:yasnippet)
(el-get-bundle elpa:emoji-fontset
  (emoji-fontset-enable "Symbola"))
(el-get-bundle elpa:emoji-cheat-sheet-plus)

;;; Code:



(provide 'el-get-config)
;;; el-get-config.el ends here
