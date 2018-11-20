

(when (>= emacs-major-version 24)
;  (add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
  (add-to-list 'package-archives '("melpa" . "http://elpa.emacs-china.org/melpa/") t)  
  )

(require 'cl)

(defvar my/packages '(
		      ;;company
		      hungry-delete
		      swiper
		      counsel
		      smartparens
		      material-theme
		      evil
		      elpy ;;python 相关插件
		      company-ycmd ;;自动补全
		      jedi ;; a Python auto-completion for Emacs
		      py-autopep8
  		      flycheck
		      better-defaults
		      monokai-theme
		      go-mode
		      highlight-parentheses
		      )"Default packages")
(setq package-selected-packages my/packages)

(defun my/packages-installed-p()
  (loop for pkg in my/packages
	when (not (package-installed-p pkg)) do (return nil)
		  finally (return t)))

(unless (my/packages-installed-p)
  (message "%s" "Refreshing package database...")
  (package-refresh-contents)
  (dolist (pkg my/packages)
    (when (not (package-installed-p pkg))
      (package-install pkg))))

;;(require 'ycmd)
;;(add-hook 'after-init-hook #'global-ycmd-mode)

(global-hungry-delete-mode)

(smartparens-global-mode t)

(global-company-mode t)

;; python
;;(elpy-enable)
;;(add-hook 'elpy-mode-hook 'py-autopep8-enable-on-save)


(global-highlight-parentheses-mode t)
;;(evil-mode 1)
;;(load-theme 'monokai t)
;(load-theme 'material t)
(provide 'init-packages)
