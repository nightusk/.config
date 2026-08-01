;;; -*- lexical-binding: t; -*-
(let ((init-el (locate-user-emacs-file "init.el"))
       (init-org (locate-user-emacs-file "init.org")))
  (unless (file-exists-p init-el)
    (when (file-exists-p init-org)
      (require 'ob-tangle)
      (add-to-list 'safe-local-eval-forms
        '(add-hook 'after-save-hook #'org-bable-tangle nil t))
      (let ((enable-local-variables nil))
        (org-babel-tangle-file
          (locate-user-emacs-file "init.org")
          (locate-user-emacs-file "init.el"))))))

(setopt custom-file (locate-user-emacs-file "custom.el"))

(add-to-list 'default-frame-alist '(alpha-background . 60))
(add-to-list 'default-frame-alist '(fullscreen . maximized))
(menu-bar-mode -1)
(tool-bar-mode -1)
