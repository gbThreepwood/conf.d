; Store configuration changes done in the user interface
; in a separate file 'custom.el'
(setq custom-file (locate-user-emacs-file "custom.el"))
(load custom-file :no-error-if-file-is-missing)


; Initalize the package manager
(require 'package)
(package-initialize)

(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))


; Prevent warnings buffer from poping up when installing packages
(add-to-list 'display-buffer-alist
             '("\\`\\*\\(Warnings\\|Compile-Log\\)\\*\\'"
               (display-buffer-no-window)
               (allow-no-window . t)))


;; Enable Evil-mode
(unless (package-installed-p 'evil)
  (package-install 'evil))
(require 'evil)

;; Disable C-i to jump forward to restore TAB functionality in Org mode.
(setq evil-want-C-i-jump nil)
(evil-mode 1)
(evil-define-key 'normal org-mode-map (kbd "<tab>") #'org-cycle)

; Load the rest of the configuration from a .org file
(org-babel-load-file (expand-file-name "~/.emacs.d/config.org"))

