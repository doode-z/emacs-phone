(load "functions.el")

(global-set-key (kbd "M-s") 'leaf/compile-cpp-gpp)
(global-set-key (kbd "C-x 3") (lambda ()
                                (interactive)
                                (split-window-right)
                                (other-window 1)))

(defalias 'df 'describe-function)
(defalias 'dk 'describe-key)
(defalias 'dv 'describe-variable)
(defalias 'ka 'leaf/kill-all)

(defalias 'ec 'leaf/except-close)
(defalias 'ho (lambda ()
                (interactive)
                (find-file "~/hotties.txt")))

