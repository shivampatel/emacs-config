(disable-theme 'zenburn)

(setq inhibit-startup-message t)  ; do not display the initial startup and splash screens
(setq inhibit-splash-screen t)

(set-face-background 'hl-line "#3e4446")
(set-face-foreground 'highlight nil)


;; ==== download these selected packages if not already installed ====
(setq package-list '(dash enh-ruby-mode 
			  js2-mode rubocop
			  smartparens markdown-mode
			  projectile projectile-rails
			  org auto-complete web-mode
			  ))

;; activate all the packages (in particular autoloads)
(package-initialize)

;; fetch the list of packages available 
(unless package-archive-contents
  (package-refresh-contents))

;; install the missing packages
(dolist (package package-list)
  (unless (package-installed-p package)
    (package-install package)))
;; ==== download these selected packages if not already installed ====


;; hooks for all programming modes
(add-hook 'prog-mode-hook 'auto-fill-mode)
(add-hook 'prog-mode-hook 'column-number-mode)
(add-hook 'prog-mode-hook 'flycheck-mode)
(add-hook 'prog-mode-hook 'auto-complete-mode)

;; hook(s) for go-mode major mode (set tabs to 4 spaces and do a gofmt before save)
(add-hook 'go-mode-hook
          (lambda ()
            (add-hook 'before-save-hook
                      'gofmt-before-save)
            (setq tab-width 2)
            (setq indent-tabs-mode 1)))

;; hooks for ruby major mode
(add-hook 'enh-ruby-mode-hook 'rubocop-mode)
(add-hook 'enh-ruby-mode-hook 'robe-mode)
(add-hook 'enh-ruby-mode-hook 'ac-robe-setup)
(add-hook 'enh-ruby-mode-hook 'projectile-mode)

;; enable minor mode org-mode when editing markdown
;; facilitates many nice features like table editing etc
;; http://unix.stackexchange.com/a/33808/84542
(add-hook 'markdown-mode-hook 'turn-on-orgtbl)

;; open web-mode while using web-mode
(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.html\\'" . web-mode))
