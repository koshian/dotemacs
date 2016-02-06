;;; init-prog-mode.el --- Settings for several programming modes.  -*- lexical-binding: t; -*-

;; Copyright (C) 2016  Sugano `Koshian' Yoshihisa(E)

;; Author: Sugano `Koshian' Yoshihisa(E) <koshian@foxking.org>
;; Keywords: c

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

;; flycheck
(add-hook 'after-init-hook #'global-flycheck-mode)
(global-set-key [(super n)] 'flycheck-next-error)
(global-set-key [(super p)] 'flycheck-previous-error)

;; yasnippet
(require 'yasnippet)
(require 'dropdown-list)
(setq yas-prompt-functions '(yas-dropdown-prompt yas-ido-prompt))
(yas-global-mode 1)

; use auto-complete
(ac-config-default)
(add-to-list 'ac-sources 'ac-source-yasnippet)
(setq ac-use-menu-map t)
(global-auto-complete-mode t)

; use rainbow-mode on css/scss/less mode
(require 'rainbow-mode)
(add-hook 'css-mode-hook 'rainbow-mode)
(add-hook 'scss-mode-hook 'rainbow-mode)
(add-hook 'less-mode-hook 'rainbow-mode)

(provide 'init-prog-mode)
;;; init-prog-mode.el ends here
