(require 'cc-mode)

(add-to-list 'load-path "~/.emacs.d/org-bullets.el")
(require 'org-bullets "~/.emacs.d/org-bullets.el")
(add-hook 'org-mode-hook (lambda () (org-bullets-mode t)))

(add-hook 'find-file-hook (lambda ()
                            (when (and (string= (buffer-name) "hotties.txt") (not buffer-read-only))
                              (read-only-mode))))
