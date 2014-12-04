;;; init-mozrepl.el --- Initialize MozRepl

;; Copyright (C) 2014  Sugano `Koshian' Yoshihisa(E)

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

;;; Code:

(when (require 'moz nil t)
  (defun auto-reload-firefox-on-after-save-hook ()
    (add-hook 'after-save-hook
              '(lambda ()
                 (interactive)
                 (comint-send-string (inferior-moz-process) "
                    BrowserReload();
                  "))))
  (add-hook 'php-mode-hook 'auto-reload-firefox-on-after-save-hook)
  (add-hook 'ruby-mode-hook 'auto-reload-firefox-on-after-save-hook)
  (add-hook 'slim-mode-hook 'auto-reload-firefox-on-after-save-hook)
  (add-hook 'ruby-mode-hook 'auto-reload-firefox-on-after-save-hook)
  (add-hook 'html-mode-hook 'auto-reload-firefox-on-after-save-hook)
  (add-hook 'css-mode-hook 'auto-reload-firefox-on-after-save-hook))

(provide 'init-mozrepl)
;;; init-mozrepl.el ends here
