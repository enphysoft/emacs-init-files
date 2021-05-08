;;
;; emacs package management
;;
(require 'package)
;;
(setq package-archives
   '(
     ("gnu" . "https://elpa.gnu.org/packages/")
     ("milkbox" . "http://melpa.milkbox.net/packages/")
     ("melpa" . "http://melpa.org/packages/")
     ("orgmode" . "http://orgmode.org/elpa/")))
;;
;;
;;
(defcustom dse/package-menu/package-column-width 32
  "Column width of package name in list-packages menu."
  :type 'number :group 'package)
(defcustom dse/package-menu/archive-column-width 12
  "Column width of archive name in list-packages menu."
  :type 'number :group 'package)
(defun dse/package-menu/fix-column-widths ()
  (let ((tlf (append tabulated-list-format nil)))
    (setf (cadr (assoc "Package" tlf)) dse/package-menu/package-column-width)
    (setf (cadr (assoc "Archive" tlf)) dse/package-menu/archive-column-width)
    (setq tabulated-list-format (vconcat tlf))))
(add-hook 'package-menu-mode-hook #'dse/package-menu/fix-column-widths)
;;
(package-initialize)

;;
;; ======================================================
;;
;; basic and default setups
;;
(ignore-errors (read-from-string contents pos))
;;
;;
(setq user-emacs-directory "~/Emacs2021/")
(add-to-list 'load-path "~/.emacs.d/extra/emacs-native-shell-complete/")
(require 'native-complete)
;;
(blink-cursor-mode 0) ;; to stop cursor blinking
(global-visual-line-mode t) ;; for word wrapping
(global-visual-line-mode t) ;; put twice
(global-auto-revert-mode 1)
(electric-pair-mode 1)
(show-paren-mode 1)             	;; to highlight parenthesis pairs
(beacon-mode 1)
(column-number-mode 1)
(global-superword-mode nil)	;; global-superword/subword-mode ;; --- cannot turn on both
(global-subword-mode 1)                 ; 2020-12-26-13-58-34
;; (global-linum-mode) ;; don't use this
(setq show-paren-style 'parenthesis)	;; highlight brackets
(setq initial-scratch-message "")       ; To get rid of the start message
(setq scroll-conservatively  100000)    ;; to make continuous scroll behavior
(setq scroll-step            1 )        ;; to scroll line by line
(setq vc-follow-symlinks t)	;; to follow symbolic link with out asking.
;; to initially setup frame sizes [02/10/2021 07:00:14 AM]
(add-to-list 'default-frame-alist '(height . 80))
(add-to-list 'default-frame-alist '(width . 128))
;;
;;  ===== auto-mode  =====
(add-to-list 'auto-mode-alist '("\\.gpl\\'" . gnuplot-mode))
(add-to-list 'auto-mode-alist '("\\.plt\\'" . gnuplot-mode))
(add-to-list 'auto-mode-alist '("\\.tex\\'" . latex-mode))
(add-to-list 'auto-mode-alist '("\\.m\\'"   . octave-mode))
(add-to-list 'auto-mode-alist '("\\.mac\\'" . maxima-mode))
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
(add-to-list 'auto-mode-alist '("\\.cu\\'"   . cuda-mode))
(add-to-list 'auto-mode-alist '("\\.h90\\'" . f90-mode))
(add-to-list 'auto-mode-alist '("\\.m4\\'"  . m4-mode))
(add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))
(add-to-list 'auto-mode-alist '("\\.paper\\'" . org-mode))
(add-to-list 'auto-mode-alist '("\\.report\\'" . org-mode))
(add-to-list 'auto-mode-alist '("\\.py\\'"  . python-mode))
(add-to-list 'auto-mode-alist '("\\.sh\\'"  . sh-mode))
(add-to-list 'auto-mode-alist '("\\.tcl\\'"  . tcl-mode))
(add-to-list 'auto-mode-alist '("\\.ppr\\'" . org-mode))

;; ================================================================================
;; Package ace-window is installed.
(global-set-key (kbd "M-o") 'ace-window)
(setq aw-keys '(?1 ?2 ?3 ?4 ?5 ?6 ?7 ?8 ?9))

;; ==============
;; xah packages
;; ==============
 (require 'xah-lookup)
 (require 'xah-fly-keys)
 (setq xah-fly-use-meta-key nil)
 (xah-fly-keys-set-layout "qwerty")
 (xah-fly-keys 1)
 (xah-fly-command-mode-activate)
 (defun save-buffer-xah-fly-command-mode-activate-no-hook ( ) "Description: "
        (interactive)
        (save-buffer)
        (xah-fly-command-mode-activate-no-hook))
 (global-set-key (kbd "<f8>") 'save-buffer-xah-fly-command-mode-activate-no-hook)
 (add-hook 'org-mode-hook 'xah-fly-command-mode-activate)

;; ================================================
;;                   PACKAGES
;;
;;
;; ============== ido ==================
(require 'ido)
(ido-mode t)
;; ==============
(require 'display-line-numbers)
(defcustom display-line-numbers-exempt-modes '(vterm-mode eshell-mode shell-mode term-mode ansi-term-mode)
  "Major modes on which to disable the linum mode, exempts them from global requirement"
  :group 'display-line-numbers
  :type 'list
  :version "green")
(defun display-line-numbers--turn-on ()
  "turn on line numbers but excempting certain majore modes defined in `display-line-numbers-exempt-modes'"
  (if (and
       (not (member major-mode display-line-numbers-exempt-modes))
       (not (minibufferp)))
      (display-line-numbers-mode)))
(global-display-line-numbers-mode)

;; ======================================================
(use-package helm-fuzzy-find)

;; ==================================================================================
;; Package buffer-move is available obsolete.
;; define some keybindings. For example, i use :
(global-set-key (kbd "<C-s-up>")     'buf-move-up)
(global-set-key (kbd "<C-s-down>")   'buf-move-down)
(global-set-key (kbd "<C-s-left>")   'buf-move-left)
(global-set-key (kbd "<C-s-right>")  'buf-move-right)

;;
;; ======================================================
;;
;; use-package
;;
(require 'use-package)
(setq use-package-always-ensure t)
(eval-when-compile
  ;; Following line is not needed if use-package.el is in ~/.emacs.d
  (add-to-list 'load-path "~/.emacs.d/elpa/use-package-20210106.2145/")
  (require 'use-package))
(setq use-package-compute-statistics t)
;;



;; =======================================================
;; (setq browse-url-browser-function 'browse-url-chrome)
;; (setq browse-url-browser-function 'browse-url-chrome)
;; (setq browse-url-chrome-program "/opt/google/chrome/chrome")
;
;; ======================================================
;;
(require 'org-protocol)
;;
(setq org-roam-directory "~/kailani/teaching/CEE696S21-ENG-MATH/")
(setq source-org-roam-directory org-roam-directory)
(setq httpd-root "/var/www")

(require 'org-roam)
(require 'org-roam-protocol)
(require 'simple-httpd)
(httpd-start)

(add-to-list 'load-path org-roam-directory)
(add-hook 'after-init-hook 'org-roam-mode) ;; starting org-roam-mode on startup


(use-package org-roam-server
  :ensure t
  ;;:ensure nil
  ;; :load-path "/home/albertsk/kailani/projects/Emacs/org-roam/"
  :load-path "~/kailani/teaching/CEE696S21-ENG-MATH/"
  ;;org-roam-directory
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

(setq org-link-file-path-type 'adaptive)

(defun remake-org-roam ()
  "To reset org-roam-directory as an input directory, and remake org-roam-db."
  (interactive)
  (let (word)
    (setq word
	  (if (use-region-p)
              (buffer-substring-no-properties (region-beginning) (region-end))
            (current-word)))
    (message word)
    (setq org-roam-directory word)
    (org-roam-db-build-cache)
    ))

(org-roam-mode +1)
(org-roam-server-mode +1)

;;
;;(use-package org-roam
;;    ;;  :ensure t
;;      :hook
;;      (after-init . org-roam-mode)
;;      :custom
;;      ;;(org-roam-directory (file-truename org-roam-directory ))
;;             :bind (:map org-roam-mode-map
;;                         (("C-c n l" . org-roam)
;;                          ("C-c n f" . org-roam-find-file)
;;                          ("C-c n j" . org-roam-jump-to-index)
;;                          ("C-c n b" . org-roam-switch-to-buffer)
;;                          ("C-c n i" . org-roam-insert)
;;                          ("C-c n t" . org-roam-dailies-today)
;;                          ("C-c n y" . org-roam-dailies-yesterday)
;;                          ("C-c n w" . org-roam-dailies-tomorrow)
;;                          ("C-c c" . org-roam-capture)))
;;              )

;;
;;; org-roam configuration
;;
;; (setq org-roam-directory "~/org-roam")
;;
;;
;; ===========================================================
;;
;; auto-compile
;;
(use-package auto-compile
  :init
  (setq load-prefer-newer t)
  :config
  (auto-compile-on-load-mode)
  (auto-compile-on-save-mode))




;;
(defun efs/display-startup-time ()
  (interactive)
  (message "Emacs loaded in %s with %d garvage collesions."
	   (format "%.2f seconds"
		   (float-time
		    (time-subtract after-init-time before-init-time)))
	   gcs-done) )
(add-hook 'emacs-startup-hook #'efs/display-startup-time)



(setq abbrev-file-name "~/.emacs.d/abrv.el") ; /home/albertsk/.emacs.d/abrv.el
(setq save-abbrevs 'silent)	;; save abbrevs when files are saved
(setq-default abbrev-mode t)	;; turn on abbrev mode globally

(defun my-after-abbrev-expand ()
  (when (looking-back "\"\"\\|''\\|()\\|\\[\\]\\|{}")
    (backward-char 1))  t)
(put 'my-after-abbrev-expand 'no-self-insert t)


;;
(wrap-region-global-mode t)
(wrap-region-add-wrappers '(
("'" "'" "!")
("@" " " "@")
("/* " " */" "#")
("$" "$")
("``" "''" "%")
("/" "/" "?") ;; Shift+/
;;
("[" "]" "}")
("{" "}" "{")
;;
("<" ">" "<")
("<<" ">>" ">")
;;
("'" "'" "'")
("'" "'" "\\") ;; to add a single qutoation pair by pressing "\" (once).
("*" "*")
("|" "|")
("~" "~" "~")
("&" "&" "&")
("+" "+" "+")
("_" "_" "_")
))

;; ===============================================================================

(require 'openwith)
(when (require 'openwith nil 'noerror)
      (setq openwith-associations
            (list
             (list (openwith-make-extension-regexp
                    '("mpg" "mpeg" "mp3" "mp4" "avi" "wmv"
		      "wav" "mov" "flv" "ogm" "ogg" "mkv"))
		   "vlc"
		   '(file))
             (list (openwith-make-extension-regexp
		    '("doc" "xls" "xlsx" "ppt" "odt" "ods"
		      "odg" "odp"))
		   "libreoffice"
		   '(file))
             (list (openwith-make-extension-regexp
                    '("pdf" "ps" "ps.gz" "dvi"))
                   "okular"
                   ;; "/usr/local/bin/pdfstudio2020"
                   '(file))
             '("\\.chm"         "kchmviewer"            (file))
             '("\\.planner\\'"  "planner"               (file))
             '("\\.gan\\'"      "ganttproject"          (file))
             '("\\.kmy\\'"      "kmymoney"              (file))
             '("\\.lyx\\'"      "lyx"                   (file))
             '("\\.png\\'"      "gwenview"              (file))
             '("\\.docx\\'"     "libreoffice"           (file))
             '("\\.html\\'"     "chromium-browser"	(file))
             ;; '("\\.html\\'"     "firefox"               (file))
             '("\\.mppz\\'"     "/usr/bin/java -Xmx1000m -jar ~/usr/bin/MagicPlotPro.jar" (file))
             '("\\.xmind\\'"    "/home/albertsk/usr/bin/XMind_64"     (file))
             ))
      (openwith-mode t))
;;

;;
(yas-global-mode 1)
;; to get rid of warning messages
(unless (boundp 'warning-suppress-types)
  (setq warning-suppress-types nil))
(push '(yasnippet backquote-change) warning-suppress-types)





;; to directly go to the projectile dired directories
(global-set-key (kbd "s-i c") 'flyspell-correct-word-before-point) ;; to select a correct word from sel.
(global-set-key (kbd "C-x p") 'helm-projectile-switch-project)
(global-set-key (kbd "C-x /") 'ibuffer-sidebar-toggle-sidebar)
(global-set-key (kbd "M-a") 'beginning-of-line)
(global-set-key (kbd "M-e") 'end-of-line)

(add-hook 'text-mode-hook 'flyspell-mode)
(add-hook 'prog-mode-hook 'flyspell-prog-mode)

;;
;; ================================================================================
;; custom packages
;;
(add-to-list 'load-path "~/.emacs.d/ask-pkgs/ask-setup/")
(require 'ask-setup)
(add-to-list 'load-path "~/.emacs.d/ask-pkgs/ask-defs/")
(require 'ask-defs)
;;
(load-file "~/.emacs.d/org.el")
;;
;;

;;
;; ======================== Do not change anything below ==============================
;;
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["#2d3743" "#ff4242" "#74af68" "#dbdb95" "#34cae2" "#008b8b" "#00ede1" "#e1e1e0"])
 '(column-number-mode t)
 '(custom-enabled-themes '(misterioso))
 '(custom-safe-themes
   '("ccc851a24050d46c4caf35012c7a9eb2718e4afdf6a7de7cf6af3a7a26646e13" default))
 '(mode-line-format
   '("%e" mode-line-front-space mode-line-mule-info mode-line-client mode-line-modified mode-line-auto-compile mode-line-remote mode-line-frame-identification mode-line-buffer-identification " "
     (:eval
      (format-time-string "%x %r"))
     " " mode-line-misc-info " " mode-line-position
     (vc-mode vc-mode)
     " " mode-line-modes mode-line-end-spaces))
 '(org-agenda-files
   '("~/Documents/research/projects/NHSEMP2021/desc/NHSEMP2021-subprojects.org" "~/kailani/projects/NSF-BPE-2021-2024/TechnicalWriting/NSF-BPE-TW.org" "~/kailani/myselves/speech/InstructorHopkins.org" "~/kailani/projects/NHSEMP2021/desc/NHSEMP2021.org" "~/kailani/projects/auto-journal/python/sample1-task.org" "~/kailani/services/CEE/committees/curri-comm-sp2021/curri-comm-sp2021.org" "~/kailani/projects/auto-journal/project-auto-journal.org" "~/kailani/services/CEE/graduate-chair/work/2021-Spring/review-applications/Application-Review-CEE-F21.org" "~/kailani/services/CEE/graduate-chair/cee-grad-competition/cee-grad-competition.org" "~/kailani/services/CEE/graduate-chair/work/CEE-co-advising-policy.org" "~/kailani/services/CEE/graduate-chair/cee-grad-exams/QE/CEE-QE-2021S.org" "~/usr/org/Contacts/sasaoka.brenton/sasaoka.brenton.org" "~/kailani/research/presentations/ITIWC-2021/ITIWC-2021.org" "~/kailani/teaching/CEE305-2021Sm/CEE305-2021Sm.org" "~/kailani/research/accounts/research-account-management.org" "~/kailani/research/proposals/BoReclamation/2021-wk06-02-10-095238-Proposal-meeting-w-Soryong-Chae.org" "~/kailani/services/CEE/graduate-chair/cee-grad-competition/cee-grad-competition-generating-thesis-template.org" "~/kailani/services/CEE/graduate-chair/work/new.applicants.org" "~/kailani/teaching/CEE696S21-ENG-MATH/CEE696-Eng-Math-2020S.org" "~/kailani/services/CEE/graduate-chair/cee-grad-exams/CE/CEE-CE-2021S.org" "~/usr/org/aboutme.org" "~/Documents/research/projects/SaudiArabia2020/SaudiArabia-post-project-manage.org" "~/usr/org/8th-International-OTEC-Symposium.org" "/mnt/default/albertsk/Dropbox/proposals/NSF-BPE-2019/curr-props-NSF-BPE-2019.org" "~/Documents/research/presentations/OTEC2020/otec-8th-symposium-2021.org" "~/Documents/research/projects/hicovid2021/hicovid2021.org" "/home/albertsk/usr/org/KOSMEE.org" "/home/albertsk/usr/org/UROP-HICOVID.org" "/home/albertsk/usr/org/academicWriting.org" "/home/albertsk/usr/org/apply-UWTacoma.org" "/home/albertsk/usr/org/ask-tips.org" "/home/albertsk/usr/org/ask-updateCV.org" "/home/albertsk/usr/org/book-EngDynBook.org" "/home/albertsk/usr/org/contacts.org" "/home/albertsk/usr/org/devel-DHD-formalism.org" "/home/albertsk/usr/org/devel-emacs-lisp.org" "/home/albertsk/usr/org/devel-programming.org" "/home/albertsk/usr/org/dhd-dev-log.org" "/home/albertsk/usr/org/diary.org" "/home/albertsk/usr/org/gcal_uhm.org" "/home/albertsk/usr/org/gcal_mtn.org" "/home/albertsk/usr/org/gcal_psn.org" "/home/albertsk/usr/org/gcal_tch.org" "/home/albertsk/usr/org/gcal_grd.org" "/home/albertsk/usr/org/lastweek.org" "/home/albertsk/usr/org/links.org" "/home/albertsk/usr/org/online-password.org" "/home/albertsk/usr/org/org-bookmarks.org" "/home/albertsk/usr/org/org-ids.org" "/home/albertsk/usr/org/simFlow.org" "/home/albertsk/usr/org/tasks.org" "/home/albertsk/usr/org/thisweek.org" "/home/albertsk/usr/org/refile/done_cepl.org" "/home/albertsk/usr/org/refile/done_emails.org" "/home/albertsk/usr/org/refile/done_research.org" "/home/albertsk/usr/org/refile/done_service.org" "/home/albertsk/usr/org/refile/done_teaching.org" "/home/albertsk/usr/org/refile/done_work.org"))
 '(org-file-apps
   '((auto-mode . emacs)
     (directory . emacs)
     ("\\.mm\\'" . default)
     ("\\.x?html?\\'" . default)))
 '(package-selected-packages
   '(zpresent yasnippet xclip xah-lookup xah-fly-keys xah-find wrap-region which-key weblorg use-package ujelly-theme twilight-theme transpose-mark tj3-mode synosaurus spray speed-type shell-command s-buffer rainbow-mode rainbow-identifiers rainbow-delimiters px password-vault pass ox-report ox-latex-subfigure org-wc org-treescope org-tree-slide org-sidebar org-projectile org-present org-plus-contrib org-mime org-journal-list org-journal org-dashboard org-commentary org-capture-pop-frame org-bullets org-analyzer openwith multi-vterm monkeytype meta-presenter matlab-mode manage-minor-mode langtool keyfreq js2-mode imenus ibuffer-sidebar hl-sentence hl-indent hl-anything highlight-operators helm-youtube helm-wordnet helm-projectile helm-pass helm-notmuch helm-fuzzy-find grizzl golden-ratio-scroll-screen gkroam git-commit flycheck-grammarly fd-dired eyebrowse exwm-x ess epresent epc el-get dumb-jump company-maxima company-math company-ledger color-theme-modern color-theme-buffer-local cmake-mode caps-lock buffer-move birds-of-paradise-plus-theme beacon auto-compile anaconda-mode amread-mode ample-regexps ag ace-window academic-phrases ac-math ac-helm))
 '(ring-bell-function 'ignore)
 '(show-paren-mode t)
 '(warning-suppress-types '((comp) (comp) (yasnippet backquote-change))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "DejaVu Sans Mono" :foundry "PfEd" :slant normal :weight normal :width normal :height 108))))
 '(bold ((t (:foreground "gold" :weight bold))))
 '(cursor ((t (:background "orange red"))))
 '(italic ((t (:foreground "deep sky blue" :slant italic))))
 '(mode-line ((t (:box (:line-width 2 :color "green")))))
 '(mode-line-buffer-id ((t (:background "black" :foreground "tan" :weight bold :height 1))))
 '(org-block ((t (:inherit shadow :extend t :background "#121212"))))
 '(org-block-background ((t (:background "#dcedc1"))))
 '(org-block-begin-line ((t (:background "#EAEAFF" :foreground "#008ED1" :inverse-video t :underline "#A7A6AA" :weight semi-bold))))
 '(org-block-end-line ((t (:background "#EAEAFF" :foreground "#008ED1" :inverse-video t :overline "#A7A6AA" :weight semi-bold))))
 '(org-level-1 ((t (:inherit outline-1 :box nil :weight bold :height 1.4 :foreground "DeepSkyBlue"))))
 '(org-level-2 ((t (:inherit outline-2 :box nil :weight bold :height 1.35 :foreground "Green"))))
 '(org-level-3 ((t (:inherit outline-3 :box nil :weight bold :height 1.3 :foreground "Orange"))))
 '(org-level-4 ((t (:inherit outline-4 :box nil :weight bold :height 1.25 :foreground "DeepSkyBlue"))))
 '(org-level-5 ((t (:inherit outline-5 :box nil :weight bold :height 1.2 :foreground "LimeGreen"))))
 '(org-level-6 ((t (:inherit outline-6 :box nil :weight bold :height 1.15 :foreground "Red"))))
 '(org-level-7 ((t (:inherit outline-7 :box nil :weight bold :height 1.1 :foreground "Yellow"))))
 '(org-level-8 ((t (:inherit outline-8 :box nil :weight bold :height 1.05 :foreground "Cyan"))))
 '(org-link ((t (:inherit link :foreground "light green" :box (:line-width 2 :color "spring green" :style released-button) :underline nil))))
 '(org-mode-line-clock ((t (:extend t :background "black" :foreground "dark orange" :underline t :slant normal :weight bold :height 1.2))))
 '(region ((t (:background "OliveDrab4" :foreground "cornsilk"))))
 '(show-paren-match ((t (:background "tan4")))))

;;
