(defvar rainbow-delimiters-switch nil
  "t if rainbow-delimiters are currently punched")
(defvar rainbow-delimiters-face-cookies nil
  "a list of face-remap-add-relative cookies to reset")

(make-variable-buffer-local 'rainbow-delimiters-switch)
(make-variable-buffer-local 'rainbow-delimiters-face-cookies)

(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)
(add-hook 'text-mode-hook #'rainbow-delimiters-mode)

(with-eval-after-load 'rainbow-delimiters
  (set-face-foreground 'rainbow-delimiters-depth-1-face "#889899")
  (set-face-foreground 'rainbow-delimiters-depth-2-face "#9b7b6b")
  (set-face-foreground 'rainbow-delimiters-depth-3-face "#7b88a5")
  (set-face-foreground 'rainbow-delimiters-depth-4-face "#889899")
  (set-face-foreground 'rainbow-delimiters-depth-5-face "#839564")
  (set-face-foreground 'rainbow-delimiters-depth-6-face "#6391aa")
  (set-face-foreground 'rainbow-delimiters-depth-7-face "#9d748f")
  (set-face-foreground 'rainbow-delimiters-depth-8-face "#7b88a5")
  (set-face-foreground 'rainbow-delimiters-depth-9-face "#659896")

  (defun rainbow-delimiters-focus-on ()
    "Punch the rainbow-delimiters"
    (setq rainbow-delimiters-face-cookies
      (list
        (face-remap-add-relative 'rainbow-delimiters-depth-1-face
          '((:foreground "#3B9399") rainbow-delimiters-depth-1-face))
        (face-remap-add-relative 'rainbow-delimiters-depth-2-face
          '((:foreground "#9B471D") rainbow-delimiters-depth-2-face))
        (face-remap-add-relative 'rainbow-delimiters-depth-3-face
          '((:foreground "#284FA5") rainbow-delimiters-depth-3-face))
        (face-remap-add-relative 'rainbow-delimiters-depth-4-face
          '((:foreground "#3B9399") rainbow-delimiters-depth-4-face))
            (face-remap-add-relative 'rainbow-delimiters-depth-5-face
          '((:foreground "#679519") rainbow-delimiters-depth-5-face))
        (face-remap-add-relative 'rainbow-delimiters-depth-6-face
          '((:foreground "#0E73AA") rainbow-delimiters-depth-6-face))
        (face-remap-add-relative 'rainbow-delimiters-depth-7-face
          '((:foreground "#9D2574") rainbow-delimiters-depth-7-face))
        (face-remap-add-relative 'rainbow-delimiters-depth-8-face
          '((:foreground "#284FA5") rainbow-delimiters-depth-8-face))
        (face-remap-add-relative 'rainbow-delimiters-depth-9-face
          '((:foreground "#199893") rainbow-delimiters-depth-9-face)))
      rainbow-delimiters-switch t))

  (defun rainbow-delimiters-focus-off ()
    "Reset the rainbow-delimiters faces"
    (mapc #'face-remap-remove-relative rainbow-delimiters-face-cookies)
    (setq rainbow-delimiters-switch nil))

  (defun rainbow-delimiters-focus-on-maybe ()
    "Punch the rainbow-delimiters if the point is on a paren"
    (when (looking-at "[][(){}]")
      (unless (or rainbow-delimiters-switch (minibufferp))
        (rainbow-delimiters-focus-on))))

  (defun rainbow-delimiters-focus-off-maybe ()
    "Reset the rainbow-delimiters if the point is not on a paren"
    (unless (looking-at "[][(){}]")
      (when rainbow-delimiters-switch
        (rainbow-delimiters-focus-off))))

  (run-with-idle-timer 0.6 t 'rainbow-delimiters-focus-on-maybe)
  (run-with-idle-timer 0.1 t 'rainbow-delimiters-focus-off-maybe))
