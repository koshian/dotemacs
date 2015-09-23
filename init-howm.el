;;; init-howm.el --- Customize howm

;; Copyright (C) 2013  Sugano `Koshian' Yoshihisa(E)

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

;(require 'org)
;(setq howm-view-title-header "*")
;(add-hook 'org-mode-hook 'howm-mode)

(if (locate-library "howm")
    (progn
      (require 'howm)
      (setq howm-keyword-file "~/howm/.howm-keys")
      (setq howm-file-name-format "%Y/%m/%Y-%m-%d-%H%M%S.howm.txt")
      (add-to-list 'auto-mode-alist '("\\.howm.txt$" . markdown-mode))

;; markdown template
;(setq howm-user-template (concat "= %title%cursor\n"
;                                 "--------------------------------\n"
;                                 "%date %file"))
      (setq howm-template "= %title%cursor\n--------------------------------\n%file\n\n")))


(provide 'init-howm)
;;; init-howm.el ends here
