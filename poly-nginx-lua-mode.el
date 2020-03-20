;;; poly-nginx-lua-mode.el --- Poly mode for nginx configs with embedded lua -*- coding: utf-8 lexical-binding: t -*-

;; Copyright (C) 2020 Joakim Hårsman

;; Author: Joakim Hårsman <joakim.harsman@gmail.com>
;; Version: 0.1
;; Package-Requires: ((polymode "0.2")(nginx-mode "1.1.9")(emacs "26"))
;; Keywords: languages nginx lua
;; URL: https://github.com/harsman/poly-nginx-lua.git

;; This file is not part of GNU Emacs.

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
;; poly-nginx-lua-mode is a polymode minor mode for editing nginx
;; configuration files with embedded Lua code. It uses polymode to support
;; dual major modes in one file.
;;
;; Get the latest version at https://github.com/harsman/poly-nginx-lua-mode

;;; Code:



(require 'polymode)

(define-hostmode poly-nginx-lua-hostmode
  :mode 'nginx-mode)

(defun poly-nginx-lua-tail-matcher (_count)
  "Provided point is at start of header, move to end of lua block."
  (when (eq (char-before) ?{)
    (backward-char)
    (condition-case nil
        (forward-sexp)
      (scan-error nil))
    (cons (point)(point))))

(define-innermode poly-nginx-lua-innermode
  :mode 'lua-mode
  :head-matcher (concat "^\\s-*"
                        (regexp-opt '("content" "access" "init"
                                    "init_worker" "rewrite"
                                    "set" "header_filter"
                                    "body_filter" "log"
                                    "balancer" "ssl_certificate"
                                    "ssl_session_fetch"
                                    "ssl_session_store"))
                        "_by_lua_block\\s-*{")
  :tail-matcher #'poly-nginx-lua-tail-matcher
  :head-mode 'host
  :tail-mode 'host)

(define-polymode poly-nginx-lua-mode
  :hostmode 'poly-nginx-lua-hostmode
  :innermodes '(poly-nginx-lua-innermode))


(provide 'poly-nginx-lua-mode)

;;; poly-nginx-lua-mode.el ends here
