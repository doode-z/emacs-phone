(defun leaf/compile-cpp-gpp ()
  "Compiles cpp programs via the GCC compiler from within emacs"
  (interactive)
  (let ((compile-mode (read-string "Compile Mode: "))
        (links)
        (compile-command))
    (cond
     ((string= compile-mode "0")
      (setq compile-command (concat "g++ " (buffer-file-name) " -o main_exec.exe && start main_exec.exe"))
      (shell-command compile-command))
     ((string= compile-mode "1")
      (setq links (read-string "Links: "))
      (setq compile-command (concat "g++ " (buffer-file-name) " " links " -o main_exec.exe && start main_exec.exe"))
      (shell-command compile-command)))))


(defun leaf/except-close ()
  "Kills all buffers except the one you're working in, useful for organizing" 
  (interactive)
  (let ((work-buffer (buffer-name))
        marked-buffer)
    (delete-other-windows)
    (next-buffer)
    (while (not (string= (buffer-name) work-buffer))
      (setq marked-buffer (get-buffer (buffer-name)))
      (kill-buffer marked-buffer)
      (next-buffer)))
  (message "%s" "Killed all buffers"))

(defun leaf/org-init ()
  "Org customizations"
  (setq org-hide-emphasis-markers t)
  (setq org-return-follows-link t)
  (transient-mark-mode t)
  (setf (cdr (assoc 'file org-link-frame-setup)) 'find-file)
  (hide-sublevels 1)
  (add-hook 'org-mode-hook 'leaf/sensible-zoom))

(defun leaf/kill-all ()
  "Kill those bastard buffers"
  (interactive)
  (switch-to-buffer "*scratch*")
  (leaf/except-close))
