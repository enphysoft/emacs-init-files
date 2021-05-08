

;; ;; =====================
;; ;; === org-mode options
;; ;; =====================
;; ;; org-mode installed
;; ;;     Status: Installed in ‘org-20210111/’,
;; ;;             shadowing a built-in package (unsigned). Delete
;; ;;    Version: 20210111
;; ;;    Summary: Outline-based notes management and organizer
;; ;; Other versions: 20210111 (orgmode), 9.4.4 (builtin).

;; (require 'org)          ;; Always necessary
;; ;;
(setq default-directory "~/usr/org/")
(setq diary-file "~/usr/org/diary/diary.org")
(setq org-adapt-indentation t)		;; prevent demoting heading also shifting text inside sections
(setq org-babel-min-lines-for-block-output 0) ;; 0 to force babel to always use the begin_example format.
(setq org-columns-default-format "%FILE %TODO %25SCHEDULED %PRIORITY %50ITEM %25DEADLINE %TAGS")
(setq org-default-notes-file (concat org-directory "~/usr/org/notes"))
(setq org-default-priority ?B)
;;
(setq org-startup-with-inline-images t)                 ;; images will automatically show up where you want them..
(setq org-display-inline-images t)
(setq org-redisplay-inline-images t)
(setq org-startup-with-inline-images "inlineimages")    ;; to have a bigger font of LaTex equations in Emacs org-mode.
;;
(setq org-duration-format (quote h:mm))
(setq org-format-latex-options (plist-put org-format-latex-options :scale 1.5)) ;; latex size ratio in buffer  <<2021-04-25 Sun 10:57:48>>
(setq org-highest-priority ?A)
(setq org-image-actual-width nil)                       ;; to show images inline
(setq org-list-allow-alphabetical t)                    ;; to include alphabetical list in org-mode
(setq org-list-description-max-indent 5)                ;; set maximum indentation for description lists
(setq org-log-done 'time)
(setq org-lowest-priority ?E)
(setq org-return-follows-link t)
(setq org-src-tab-acts-natively t)
(setq org-time-clocksum-format (quote (:hours "%d" :require-hours t :minutes ":%02d" :require-minutes t)))
(setq org-src-preserve-indentation nil) ; not to have any unnecessary indentation within babel source block [2020DEC29T001356]
(setq org-edit-src-content-indentation 0) ;

;; ========
;; agenda
;; ========
(setq org-enforce-todo-dependencies t)
(setq org-agenda-include-diary t)  ;; Calendar/Diary integration
(setq org-agenda-clockreport-parameter-plist
      '(:link t :maxlevel 6 :fileskip0 t :compact nil :narrow 80 :formula %))

(setq org-agenda-files (list "/home/albertsk/usr/org/refile/")) ;; <<2021-01-27 Wed 01:03:52>> 01/27/2021
;; (setq org-agenda-files (list "/home/albertsk/usr/org/" "/home/albertsk/usr/org/refile/"  ))
;; (setq org-agenda-files (list "/home/albertsk/usr/org" "/home/albertsk/usr/org/refile" ))
;; (setq org-agenda-files (list "/home/albertsk/usr/org" "/home/albertsk/usr/org/refile" "/home/albertsk/usr/org/journal" ))
;; ;; (setq org-agenda-files (directory-files-recursively "~/org/" "\.org$"))

;; ;; ===================
;; ;; ==== org-refile
;; ;; ===================
(setq org-refile-targets '((org-agenda-files :maxlevel . 3)))
(setq org-refile-use-outline-path 'file)
(setq org-outline-path-complete-in-steps nil)
(setq org-refile-allow-creating-parent-nodes 'confirm)
(setq org-refile-targets
  (quote (
    ("~/usr/org/refile/someday.org"          :maxlevel . 3)
    ("~/usr/org/refile/done_research.org"    :maxlevel . 3)
    ("~/usr/org/refile/done_teaching.org"    :maxlevel . 3)
    ("~/usr/org/refile/done_service.org"     :maxlevel . 3)
    ("~/usr/org/refile/done_work.org"        :maxlevel . 3)
    ("~/usr/org/refile/done_cepl.org"        :maxlevel . 3)
    ("~/usr/org/refile/done_emails.org"      :maxlevel . 3)
)))

;; ===================
;; === org-todo
;; ===================
;; << usage >>
;; the ‘!’ after the slash means that in addition to the note taken when entering the state,
;; a timestamp should be recorded when leaving the ‘WAIT’ state,
;; if and only if the target state does not configure logging for entering it.
;; So it has no effect when switching from ‘WAIT’ to ‘DONE’,
;; because ‘DONE’ is configured to record a timestamp only.
;;
;; But when switching from ‘WAIT’ back to ‘TODO’, the ‘/!’ in the ‘WAIT’ setting now
;; triggers a timestamp even though ‘TODO’ has no logging configured.
;;  ‘!’ (for a timestamp) or ‘@’ (for a note with timestamp)
;;
(setq org-todo-keywords
'((sequence  ;; Sequence for TASKS
     "TODO(t)"  ; next action
     "MEET(m@!)";      ONGOING needs to be replaced by PROCESSING.
     ;; "WAITING(w!)"
 	"STARTED(s@/!)"
 	"PROCESSING(p!)"  ; next action
 	"NEXTSTEP(N!)"  ; next action
 	"DISCUSSING(d@/!)"  ; next action
 	"DELEGATED(l@/!)"
	"CARRIED-OVER(v!)"
 	"WRAPPINGUP(u@/!)" "|" "CANCELLED(C@)" "|" "FUTURE(F!)" "|" "WAITING(w!)" "|" "DONE(x!)")
	;; "|" "COMPLETE(X!)"
	;;"SOMEDAY(S/!)"
	(sequence ;; Sequence for Programming
	 "FLOWCHARTING" "LIBRARYING" "CODING" "DEBUGGING" "PROFILING" "TESTING" "PACKAGING(K)" "|" "GITHUBBED(G)")
	(sequence ;; sequence for review
	 "PRN2PDF" "READING" "COMMENTING" "BIBWORK" "REPORTING" "|" "SUBMITTED(S@/!)")
	(sequence ;; sequence for teaching
	 "WHAT2TEACHING"      ;; outline of each lecture
	 "HWSETUP(h)"         ;; homework problems and solutions
 	 "NOTEPREP(l)"        ;; lecture notes
 	 "MEDIAPREP(v)"       ;; AV meida
 	 "POSTMARKING(M)"     ;; post-lecture-review + a new draft outline
	 "BOOKMEMO"           ;; post-lecture-review + a new draft outline
 	 "|" "TAUGHT(A)")
	 ( sequence ;; sequence for paper wriring
	   "SCAVENGING" "LITERATURING" "PREABSTRACTING" "OUTLINING" "NOVELTY2CONCL" "APPEDIX" "INTRODUCTION" "SECTIONING" "RESDISC"
	   "CONCL" "PROOFREADING" "SUBMITED" "REVISING" "RESUBMITTED" "GALLEYPROOFING" "|" "PUBONLINE(O)")
	 ))
;;
;;
(setq org-todo-keyword-faces
        '( ;;  Heading 1
          ("TODO"               . (:foreground "OrangeRed1"    :weight bold))
          ("FLOWCHARTING"       . (:foreground "OrangeRed1"    :weight bold))
          ("PRN2PDF"            . (:foreground "OrangeRed1"    :weight bold))
          ("SCAVENGING"         . (:foreground "OrangeRed1"    :weight bold))
          ("WHAT2TEACHING"      . (:foreground "OrangeRed1"    :weight bold))
          ("SCAVENGING"         . (:foreground "OrangeRed1"    :weight bold))
          ("INTRODUCTION"       . (:foreground "OrangeRed1"    :weight bold))
          ("REVISING"           . (:foreground "OrangeRed1"    :weight bold))
            ("DONE"             . (:foreground "azure3"   :weight bold))
            ;;  Heading 2
          ("PLANNING"           . (:foreground "DarkOrange"    :weight bold))
          ("LIBRARYING"         . (:foreground "DarkOrange"    :weight bold))
          ("READING"            . (:foreground "DarkOrange"    :weight bold))
          ("HWSETUP"            . (:foreground "DarkOrange"    :weight bold))
          ("LITERATURING"       . (:foreground "DarkOrange"    :weight bold))
          ("SECTIONING"         . (:foreground "DarkOrange"    :weight bold))
          ("RESUBMITTED"        . (:foreground "DarkOrange"    :weight bold))
          ("WRAPPINGUP"         . (:foreground "DarkOrange"    :weight bold))
	  ("MEET"               . (:foreground "DarkOrange"    :weight bold)) ;
              ;;  Heading 3
          ("PROCESSING"         . (:foreground "gold"    :weight bold))
          ("ONGOING"            . (:foreground "gold"    :weight bold))
          ("CODING"             . (:foreground "gold"    :weight bold))
          ("COMMENTING"         . (:foreground "gold"    :weight bold))
          ("NOTEPREP"           . (:foreground "gold"    :weight bold))
          ("PREABSTRACTING"     . (:foreground "gold"    :weight bold))
          ("PREABSTRACTING"     . (:foreground "gold"    :weight bold))
          ("RESDISC"            . (:foreground "gold"    :weight bold))
          ("GALLEYPROOFING"     . (:foreground "gold"    :weight bold))
              ;;  Heading 4
          ("NEXTSTEP"         . (:foreground "lime green"    :weight bold))
          ("DEBUGGING"          . (:foreground "lime green"    :weight bold))
          ("BIBWORK"            . (:foreground "lime green"    :weight bold))
          ("MEDIAPREP"          . (:foreground "lime green"    :weight bold))
          ("OUTLINING"          . (:foreground "lime green"    :weight bold))
          ("REPORTING"          . (:foreground "lime green"    :weight bold))
          ("CONCL"              . (:foreground "lime green"    :weight bold))
              ;;  Heading 5
          ("DISCUSSING"       . (:foreground "DeepSkyBlue"    :weight bold))
          ("PROFILING"        . (:foreground "DeepSkyBlue"    :weight bold))
          ("POSTMARKING"      . (:foreground "DeepSkyBlue"    :weight bold))
          ("NOVELTY2CONCL"    . (:foreground "DeepSkyBlue"    :weight bold))
          ("PROOFREADING"     . (:foreground "DeepSkyBlue"    :weight bold))
              ;;  Heading 6
          ("DELEGATED"        . (:foreground "LightSkyBlue"    :weight bold))
          ("TESTING"          . (:foreground "LightSkyBlue"    :weight bold))
          ("BOOKMEMO"         . (:foreground "LightSkyBlue"    :weight bold))
          ("APPEDIX"          . (:foreground "LightSkyBlue"    :weight bold))
          ("SUBMITED"         . (:foreground "LightSkyBlue"    :weight bold))
              ;;  Heading 7 special
          ("PACKAGING"        . (:foreground "magenta"    :weight bold))
          ("WAITING"          . (:foreground "magenta"    :weight bold))
              ;;  Heading 9 ending
          ("CANCELLED"        . (:foreground "azure3"   :weight bold))
          ("FUTURE"           . (:foreground "azure3"   :weight bold))
          ("CANCELLED"        . (:foreground "azure3"   :weight bold))
          ("GITHUBBED"        . (:foreground "azure3"   :weight bold))
          ("SUBMITTED"        . (:foreground "azure3"   :weight bold))
          ("TAUGHT"           . (:foreground "azure3"   :weight bold))
          ("PUBONLINE"        . (:foreground "azure3"   :weight bold))
          ;; ("DONE"             . (:foreground "azure3"   :weight bold))
          ("COMPLETE"         . (:foreground "azure3"   :weight bold))
          ))
;;

;; ==============================
;; === org-latex and org-beamer
;; ==============================
;;
(setq org-latex-toc-command "\\tableofcontents \\clearpage")
;;
(customize-set-value 'org-latex-with-hyperref nil)
;;
;;
(with-eval-after-load 'ox-latex
(add-to-list 'org-latex-classes
 `("beamer"
   ,(concat
     "\\documentclass[presentation]{beamer}\n"
     "\\usepackage{beamerthemesplit,beamerthemeshadow}\n"
     "\\setbeamerfont{frametitle}{size=\\normalsize}\n"
     "\\setbeamertemplate{footline}[frame number]\n"
     "\\usetheme{Antibes}\n"
     "\\usecolortheme{crane}\n"
     "\\usefonttheme{professionalfonts}\n"
     "\\usefonttheme{serif}\n"
     "[PACKAGES]" "[EXTRA]\n")
   ("\\section{%s}" . "\\section*{%s}")
   ("\\subsection{%s}" . "\\subsection*{%s}")
   ("\\subsubsection{%s}" . "\\subsubsection*{%s}"))))

;; (with-eval-after-load 'ox-latex
;; (add-to-list 'org-latex-classes
;;  `("beamer"
;;    ,(concat "\\documentclass[presentation]{beamer}\n" "[DEFAULT-PACKAGES]" "[PACKAGES]" "[EXTRA]\n")
;;    ("\\section{%s}" . "\\section*{%s}")
;;    ("\\subsection{%s}" . "\\subsection*{%s}")
;;    ("\\subsubsection{%s}" . "\\subsubsection*{%s}")))
;; )
;; (add-to-list 'org-latex-default-packages-alist "\\PassOptionsToPackage{hyphens}{url}")

(with-eval-after-load 'ox-latex
  (add-to-list 'org-latex-classes
	       '("moderncv" "\\documentclass{moderncv}"
		("\\section{%s}" . "\\section*{%s}")
		("\\subsection{%s}" . "\\subsection*{%s}"))))
;; ;;
(setq org-latex-listings t)
(require 'ob-tcl) ;; to include tcl <<2021-01-23 Sat 00:39:17>>
(setq org-latex-listings-langs
    '((emacs-lisp "Lisp")
      (lisp "Lisp")
      (clojure "Lisp")
      (c "C")
      (cc "C++")
      (fortran "fortran")
      (maxima "maxima")
      (matlab "MATLAB")
      (f90 "Fortran")
      (perl "Perl")
      (cperl "Perl")
      (python "Python")
      (ruby "Ruby")
      (html "HTML")
      (xml "XML")
      (tex "TeX")
      (latex "[LaTeX]TeX")
      (shell-script "bash")
      (plantuml "plantuml")
      (gnuplot "gnuplot")
      (ocaml "Caml")
      (caml "Caml")
      (sql "SQL")
      (sqlite "sql")
      (makefile "make")))

;; ;; ===============
;; ;; === org-bibtex
;; ;; ===============
;; (setq bibtex-completion-pdf-field "File")
;; (setq bibtex-completion-find-additional-pdfs t)
;; ;; (setq bibtex-completion-browser-function 'browser-url-chromium) ;; Sat Apr 24 10:23:22
;; (setq bibtex-completion-pdf-open-function
;; 	(lambda (fpath)    (call-process "/usr/bin/evince" nil 0 nil fpath)))
;; ;; (lambda (fpath)    (call-process "pdfstudio2020" nil 0 nil fpath)))
;; ;;

;; (setq bibtex-autokey-year-length 4
;;           bibtex-autokey-name-year-separator "-"
;;           bibtex-autokey-year-title-separator "-"
;;           bibtex-autokey-titleword-separator "-"
;;           bibtex-autokey-titlewords 3
;;           bibtex-autokey-titlewords-stretch 1
;;           bibtex-autokey-titleword-length 5)
;; ;;

;; (setq org-latex-pdf-process
;;         '("pdflatex -interaction nonstopmode -output-directory %o %f"
;;           "bibtex %b"
;;           "pdflatex -interaction nonstopmode -output-directory %o %f"
;;           "pdflatex -interaction nonstopmode -output-directory %o %f"))
;; ;;
(autoload 'helm-bibtex "helm-bibtex" "" t)

(setq bibtex-completion-bibliography
      '("/home/albertsk/usr/lib/zotero.bib"        ;; "/path/to/bibtex-file-2.bib"
))

(setq org-latex-pdf-process
        '("pdflatex -interaction nonstopmode -output-directory %o %f"
          "bibtex %b"
          "pdflatex -interaction nonstopmode -output-directory %o %f"
          "pdflatex -interaction nonstopmode -output-directory %o %f"))

;;
;; =============================================================================
;; org-latex-fragment setup, obtained from
;; https://ivanaf.com/automatic_latex_fragment_toggling_in_org-mode.html
;; =============================================================================
;;
(defvar org-latex-fragment-last nil
  "Holds last fragment/environment you were on.")
;;
(defun my/org-latex-fragment--get-current-latex-fragment ()
  "Return the overlay associated with the image under point."
  (car (--select (eq (overlay-get it 'org-overlay-type) 'org-latex-overlay) (overlays-at (point)))))
;;
(defun my/org-in-latex-fragment-p ()
    "Return the point where the latex fragment begins, if inside
  a latex fragment. Else return false"
    (let* ((el (org-element-context))
           (el-type (car el)))
      (and (or (eq 'latex-fragment el-type) (eq 'latex-environment el-type))
          (org-element-property :begin el))))
;;
(setq val_run-with-idle-timer .75)
(defun org-latex-fragment-toggle-auto ()
  ;; Wait for the s
  (interactive)
  (while-no-input
  ;;  (run-with-idle-timer .1 nil 'org-latex-fragment-toggle-helper)
    (run-with-idle-timer val_run-with-idle-timer nil 'org-latex-fragment-toggle-helper)
    ))  ;; latex in Emacs buffer, run idel time  Sun Apr 25 11:10:14 2021
;;
(defun org-latex-fragment-toggle-helper ()
    "Toggle a latex fragment image "
    (condition-case nil
        (and (eq 'org-mode major-mode)
             (let* ((begin (my/org-in-latex-fragment-p)))
               (cond
                ;; were on a fragment and now on a new fragment
                ((and
                  ;; fragment we were on
                  org-latex-fragment-last
                  ;; and are on a fragment now
                  begin
                  ;; but not on the last one this is a little tricky. as you edit the
                  ;; fragment, it is not equal to the last one. We use the begin
                  ;; property which is less likely to change for the comparison.
                  (not (= begin
                          org-latex-fragment-last)))
                 ;; go back to last one and put image back
                 (save-excursion
                   (goto-char org-latex-fragment-last)
                   (when (my/org-in-latex-fragment-p) (org-latex-preview))
		   ;; (when (my/org-in-latex-fragment-p) (org-toggle-latex-fragment))
                   ;; now remove current imagea
                   (goto-char begin)
                   (let ((ov (my/org-latex-fragment--get-current-latex-fragment)))
                     (when ov
                       (delete-overlay ov)))
                   ;; and save new fragment
                   (setq org-latex-fragment-last begin)))
                ;; were on a fragment and now are not on a fragment
                ((and
                  ;; not on a fragment now
                  (not begin)
                  ;; but we were on one
                  org-latex-fragment-last)
                 ;; put image back on
                 (save-excursion
                   (goto-char org-latex-fragment-last)
                   ;; (when (my/org-in-latex-fragment-p)(org-toggle-latex-fragment)))
		    (when (my/org-in-latex-fragment-p)(org-latex-preview)))
                 ;; unset last fragment
                 (setq org-latex-fragment-last nil))
                ;; were not on a fragment, and now are
                ((and
                  ;; we were not one one
                  (not org-latex-fragment-last)
                  ;; but now we are
                  begin)
                 (save-excursion
                   (goto-char begin)
                   ;; remove image
                   (let ((ov (my/org-latex-fragment--get-current-latex-fragment)))
                     (when ov
                       (delete-overlay ov)))
                   (setq org-latex-fragment-last begin)))
                ;; else not on a fragment
                ((not begin)
                 (setq org-latex-fragment-last nil)))))
      (error nil)))
;;
(add-hook 'post-command-hook 'org-latex-fragment-toggle-auto)
;; (remove-hook  'post-command-hook 'org-latex-fragment-toggle-auto)
(setq org-latex-fragment-toggle-helper (byte-compile 'org-latex-fragment-toggle-helper))
(setq org-latex-fragment-toggle-auto   (byte-compile 'org-latex-fragment-toggle-auto))
;;
(defun ask/toggle-latex-fragment ()
  "Toggle the status of latex-fragment: <<2021-01-25 Mon 00:24:35>>  "
  (interactive)
  ;; use a property “state”. Value is t or nil
  (if (get 'ask-state-latex-fragment 'state)
      (progn
        ;; (set-background-color "seashell")
	(add-hook 'post-command-hook 'org-latex-fragment-toggle-auto)
        (put 'ask-state-latex-fragment 'state nil))
    (progn
      ;; (set-background-color "honeydew")
      (remove-hook  'post-command-hook 'org-latex-fragment-toggle-auto)
      (put 'ask-state-latex-fragment 'state t))))
;;


;; =========================================================================================
;; ==================
;; === org-babel
;; ==================
;; <<language command>>
;; (setq org-plantuml-jar-path (expand-file-name "/usr/share/plantuml/plantuml.jar"))
;; (setq org-babel-python-command "/usr/bin/python3")
;; (setq python-shell-interpreter "/usr/bin/python3")
;; (setq org-babel-python-command "/usr/bin/python3")
;;
(setq org-babel-python-command "~/anaconda3/bin/python3")
(setq python-shell-interpreter "~/anaconda3/bin/python3")
(setq org-babel-python-command "~/anaconda3/bin/python3")
(setq org-confirm-babel-evaluate nil)  ;; (setq org-confirm-babel-evaluate t)
(org-babel-do-load-languages
 'org-babel-load-languages
 '(
   (awk . t)
   (calc . t)
   (C . t)
   (ditaa . t)
   (dot . t)
   (emacs-lisp . t)
   ;; (eshell . t)
   (fortran . t)
   (gnuplot . t)
   (groovy . t)
   (haskell . t)
   (latex . t)
   (lisp . t)
   (makefile . t)
   (matlab . t)
   (maxima . t)
   (octave . t)
   (perl . t)
   (plantuml . t)
   (python . t)
   (R . t)
   (ruby . t)
   (sed . t)
   (shell . t)
   (tangle . t)
   ))
;;

;;  (autoload 'maxima-mode "maxima" "Maxima mode" t)
;;  (autoload 'maxima "maxima" "Maxima interaction" t)

;; ;;
;; ;; ========
;; ;; org-babel
;; ;; ========
;; (setq org-plantuml-jar-path (expand-file-name "/usr/share/plantuml/plantuml.jar"))
;; ;; (setq org-babel-python-command "~/anaconda3/bin/python")
;; ;; (setq python-shell-interpreter "~/anaconda3/bin/python")
;; ;; (setq org-babel-python-command "~/anaconda3/bin/python")
;; ;;
;; (setq org-confirm-babel-evaluate nil)
;; ;; (setq org-confirm-babel-evaluate t)
;; ;; (org-babel-do-load-languages
;; ;;  'org-babel-load-languages
;; ;;  '( (awk . t) (calc . t) (C . t) (ditaa . t) (dot . t) (emacs-lisp . t) (eshell . t) (fortran . t) (gnuplot . t) (groovy . t) (haskell . t) (latex . t) (lisp . t) (makefile . t) (matlab . t) (maxima . t) (octave . t) (perl . t) (plantuml . t) (python . t) (R . t) (ruby . t) (sed . t) (shell . t) (tangle . t) ))
;; (setq org-src-fontify-natively t)
;; ;;
;; ;;
;; ;;
;;  ;;
;; ;;(add-to-list 'load-path "~/.emacs.d/elpa/exwm-0.24/")
;; ;;(add-to-list 'load-path "~/.emacs.d/elpa/xelb-0.18/")
;; ;;(require 'exwm)
;; ;; use
;; ;;(require 'exwm-config)
;; ;;(exwm-config-example)
;; ;; or
;; ;;(exwm-enable)
;; ;;
;; ;;(require 'exwm-systemtray)
;; ;;(exwm-systemtray-enable)
;; ================================================================================
;;                                    LANGUAGES
;; [matlab]
;; setup matlab in babel
(setq org-babel-default-header-args:matlab
  '((:results . "output") (:session . "*MATLAB*")))
;;
(autoload 'matlab-mode "matlab" "Matlab Editing Mode" t)
(add-to-list
  'auto-mode-alist
  '("\\.m$" . matlab-mode))
(setq matlab-indent-function t)
(setq matlab-shell-command "/usr/local/MATLAB/R2020b/bin/matlab")
(add-hook 'matlab-mode-hook
    (lambda () (progn (setq matlab-comment-char ?%)
                      (setq comment-start "% ")
                      (setq comment-add 0))))

;;
;; [octave]
(add-to-list 'load-path "~/.emacs.d/extra/ob-octave-fix/")
(require 'ob-octave-fix nil t):

;;
;; anaconda
;;
(add-hook 'python-mode-hook 'anaconda-eldoc-mode)


;; ==============
;;

;;
;; =====================
;; === org-journal-dir
;; =====================
(setq org-journal-dir "~/usr/org/journal"       ; where my journal files are
      org-journal-file-format "%Y%m%d.org"      ; their file names
      org-journal-enable-agenda-integration t   ; so entries are on the agenda
      org-icalendar-include-todo "all"          ; include TODOs and DONEs
      org-icalendar-combined-agenda-file "~/usr/org/calendar/org-journal.ics")
;;  ===============================================================================

;;  ===============================================================================
;;Package org-capture-pop-frame is installed.
;;     Status: Installed in ‘org-capture-pop-frame-20160518.1008/’ (unsigned). Delete
;;    Version: 20160518.1008
;;     Commit: b16fd712de62cf0d1f9befd03be6ab5983cb3301
;;    Summary: Run org-capture in a new pop frame
;;   Requires: emacs-24.4
;;   Homepage: https://github.com/tumashu/org-capture-pop-frame.git
;; Maintainer: Feng Shu <tumashu@163.com>
;;     Author: Feng Shu <tumashu@163.com>
;;Other versions: 20160518.1008 (melpa).
;;
(require 'org-capture)
(require 'org-capture-pop-frame)
;; (setq org-capture-templates
      ;; '(("f" "org-capture-from-web" entry  (file+headline "~/note.org" "Notes-from-web"))))
(setq org-capture-templates
      '(
	("c" "Contact" entry (file+headline "~/usr/org/contacts.org" "People")
	 "* \n:PROPERTIES: \n:CUSTOM_ID: \n:FIRSTNAME: \n:LASTNAME: \n:BIRTHDAY: \n:TITLE: \n:WEBSITE1: \n:WEBSITE2: \n:WORKEMAIL: \n:HOMEADDR: \n:WORKADDR: \n:INSTITUTION: \n:WORKPHONE: \n:CELLPHONE: \n:HOMEPHONE: \n:SPOUSE: \n:CHILD1: \n:CHILD2: \n:CHILD3: \n:NOTE1: \n:RESEARCH: \n:INTEREST: \n:LATESTEMAIL: \n:END: ")
;;
	("t" "Todo" entry (file+headline "~/usr/org/tasks.org" "Tasks")
	 "** TODO [#A] %?\nprp/\nSCHEDULED: %(org-insert-time-stamp (org-read-date nil t \"+0d\"))\nEntered on %U \nPrevious %a")
;;
	("j" "Journal entry" entry (file+olp+datetree generate-org-journal-name) "* to-do & diary %?\nprp/\nEntered on %U \n%a ")
;;
	("n" "note" plain (file generate-org-note-name)
	 "%(format \"# -*- mode: org; -*- \n #+TITLE: %s \n #+STAMP: %s\n\" my-org-note--post my-org-note--time)")
;;
	("l" "Link entry" entry (file+headline "~/usr/org/links.org" "Links")
	 "** link name \n:PROPERTIES: \n:DATE:  %U\n:ID: `(insert-time-n-ask) \n:CUSTOM_ID: \n:END: \n-  ")
;;
  ("g" "Gmail-link" entry (file+headline "~/usr/org/tasks.org" "Gmail-links") "%A")
))




















;;
