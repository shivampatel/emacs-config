; custom key bindings that make my life easier


;; 1. Change copy/cut commands so that c-w and m-w copy and cuts
;;    a complete line if no selection is made
;;    Borrowed from:
;;    http://www.emacswiki.org/emacs/WholeLineOrRegion

; for copy entire line with M-w when no selection is made
 (defun my-kill-ring-save (beg end flash)
      (interactive (if (use-region-p)
                       (list (region-beginning) (region-end) nil)
                     (list (line-beginning-position)
                           (line-beginning-position 2) 'flash)))
      (kill-ring-save beg end)
      (when flash
        (save-excursion
          (if (equal (current-column) 0)
              (goto-char end)
            (goto-char beg))
          (sit-for blink-matching-delay))))
    (global-set-key [remap kill-ring-save] 'my-kill-ring-save)


;; ; for cut entire line with C-w when no selection is made
 (defun my-kill-region (beg end flash)
      (interactive (if (use-region-p)
                       (list (region-beginning) (region-end) nil)
                     (list (line-beginning-position)
                           (line-beginning-position 2) 'flash)))
      (kill-region beg end)
      (when flash
        (save-excursion
          (if (equal (current-column) 0)
              (goto-char end)
            (goto-char beg))
          (sit-for blink-matching-delay))))
    (global-set-key [remap kill-region] 'my-kill-region)


;; End of binding 1
