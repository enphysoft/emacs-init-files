;; /home/albertsk/.emacs.d/org-roam-setup-new.el
(setq my-org-roam-directory "~/kailani/teaching/CEE696S21-ENG-MATH/")

(server-start)
(add-to-list 'load-path my-org-roam-directory)
;;(add-to-list 'load-path "~/org/")
(require 'org-protocol)


(setq source-org-roam-directory org-roam-directory)
(require 'org-roam-protocol)
(require 'simple-httpd)
(setq httpd-root "/var/www")
(httpd-start)

(add-to-list 'load-path org-roam-directory)
(add-hook 'after-init-hook 'org-roam-mode) ;; starting org-roam-mode on startup


(use-package org-roam
             :hook
             (after-init . org-roam-mode)
             :custom
             (org-roam-directory my-org-roam-directory)
             :bind (:map org-roam-mode-map
                         (("C-c n l" . org-roam)
                          ("C-c n f" . org-roam-find-file)
                          ("C-c n j" . org-roam-jump-to-index)
                          ("C-c n b" . org-roam-switch-to-buffer)
                          ("C-c n i" . org-roam-insert)
                          ("C-c n t" . org-roam-dailies-today)
                          ("C-c n y" . org-roam-dailies-yesterday)
                          ("C-c n w" . org-roam-dailies-tomorrow)
                          ("C-c c" . org-roam-capture))))



;; (setq org-todo-keywords
      ;; '((sequence "TODO(t)" "NEXT(n)" "PROJECT(p)" "WAIT(w@/!)" "|" "DONE(d!)" "CANCELLED(c@)")))
(setq org-roam-list-files-commands '(elisp))
;; (setq org-roam-directory "~/org/")
(setq org-roam-directory my-org-roam-directory)

(setq org-roam-buffer-position 'left)
(setq org-roam-buffer-width 0.15)
(setq org-roam-link-title-format "R:%s")
(setq org-roam-index-file "~/org/index.org")
(setq org-roam-completion-system 'default)
;; (setq org-roam-capture-templates
;;       '(("d" "default" plain (function org-roam--capture-get-point)
;;          "%?"
;;          :file-name "${slug}"
;;          :head "#+TITLE: ${title}\n#+CREATED: %<%Y-%m-%d>\n#+ROAM_ALIAS:\n#+ROAM_TAGS:\n\n* ${title}\n"
;;          :unnarrowed t)
;;         ))
;; (setq org-roam-dailies-capture-templates
;;       '(("d" "daily" plain #'org-roam--capture-get-point ""
;;          :immediate-finish t
;;          :file-name "%<%Y-%m-%d>"
;;          :head "#+TITLE: ${title}\n#+CREATED: %<%Y-%m-%d>\n#+ROAM_ALIAS:\n#+ROAM_TAGS:\n\n* ${title}\n"
;;          :unnarrowed t)
;;         ))

;; (use-package org-roam-server
;;              :ensure t
;;              :config
;;              (setq org-roam-server-host "127.0.0.1"
;;                    org-roam-server-port 8080
;;                    org-roam-server-export-inline-images t
;;                    org-roam-server-authenticate nil
;;                    org-roam-server-label-truncate t
;;                    org-roam-server-label-truncate-length 60
;;                    org-roam-server-label-wrap-length 20))


(use-package org-roam-server
  :ensure nil
  ;; :load-path "/home/albertsk/kailani/projects/Emacs/org-roam/"
  :load-path org-roam-directory
  :config
  (setq org-roam-server-host "127.0.0.1"
        org-roam-server-port 8080
        org-roam-server-authenticate nil
        org-roam-server-export-inline-images t
        org-roam-server-serve-files nil
        org-roam-server-served-file-extensions '("pdf" "mp4" "ogv")
        org-roam-server-network-poll t
        org-roam-server-network-arrows nil
        org-roam-server-network-label-truncate t
        org-roam-server-network-label-truncate-length 60
        org-roam-server-network-label-wrap-length 20))
;;


;;(defun b ( ) "Description: " (interactive) (insert "HaHa"))
;;(define-skeleton w/todo "/" "/" "todo is ")
;;(global-set-key (kbd "M-4") "    ")
;;(global-visual-line-mode t)
;;(visual-line-mode 1)
