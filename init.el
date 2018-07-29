
;; install a el-get when not installed
(add-to-list 'load-path (locate-user-emacs-file "el-get/el-get"))

(unless (require 'el-get nil 'noerror)
  (require 'package)
  (add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
  (add-to-list 'package-pinned-packages '((el-get . "melpa")))
  (package-refresh-contents)
  (package-initialize)
  (package-install 'el-get)
  (require 'el-get))

;; el-get
(el-get-bundle 'elpy)
(el-get-bundle 'flycheck)
(el-get-bundle 'jedi)
(el-get-bundle 'smartrep)
(el-get 'sync)

;; beep sound mute
(setq ring-bell-function 'ignore)

;; display linenum
(global-linum-mode t)

;; elpy setting
(elpy-enable)
(elpy-use-ipython)
(setq elpy-rpc-backend "jedi")

;; flycheck setting
(when (require 'flycheck nil t)
  (remove-hook 'elpy-modules 'elpy-module-flymake)
  (add-hook 'elpy-mode-hook 'flycheck-mode))

(define-key elpy-mode-map (kbd "C-c C-v") 'helm-flycheck)
(require 'smartrep)
(smartrep-define-key elpy-mode-map "C-c"
		     '(("C-n" . flycheck-next-erorr)
		       ("C-p" . flycheck-previous-erorr)))
;;;
