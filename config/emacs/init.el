(require 'package)
(add-to-list 'package-archives '("gnu"   . "https://elpa.gnu.org/packages/"))
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(eval-and-compile
  (setq use-package-always-ensure t
        use-package-expand-minimally t))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("a27c00821ccfd5a78b01e4f35dc056706dd9ede09a8b90c6955ae6a390eb1c1e" default))
 '(fit-frame-to-buffer-margins '(nil nil nil nil))
 '(package-selected-packages
   '(catppuccin-theme treemacs use-package centaur-tabs all-the-icons))
 '(warning-suppress-log-types '((comp))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :extend nil :stipple nil :background "#1e1e2e" :foreground "#cdd6f4" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 130 :width normal :foundry "UKWN" :family "Iosevka"))))
 '(all-the-icons-blue ((t (:foreground "#89b4fa"))))
 '(all-the-icons-blue-alt ((t (:foreground "#89dceb"))))
 '(all-the-icons-green ((t (:foreground "#a6e3a1"))))
 '(all-the-icons-orange ((t (:foreground "#fab387"))))
 '(all-the-icons-pink ((t (:foreground "#f2cdcd"))))
 '(all-the-icons-purple ((t (:foreground "#f5c2e7"))))
 '(all-the-icons-purple-alt ((t (:foreground "#cba6f7"))))
 '(all-the-icons-red ((t (:foreground "#eba0ac"))))
 '(all-the-icons-red-alt ((t (:foreground "#f38ba8"))))
 '(all-the-icons-yellow ((t (:foreground "#f9e2af"))))
 '(centaur-tabs-close-mouse-face ((t (:background "#1e1e2e" :foreground "#f38ba8"))))
 '(centaur-tabs-close-selected ((t (:background "#1e1e2e" :foreground "#cdd6f4"))))
 '(centaur-tabs-default ((t (:background "#181825" :foreground "#a6adc8"))))
 '(centaur-tabs-jump-identifier-selected ((t (:weight extra-bold :background "#1e1e2e" :inherit centaur-tabs-modified-marker-selected))))
 '(centaur-tabs-modified-marker-selected ((t (:background "#1e1e2e" :inherit centaur-tabs-selected-modified))))
 '(centaur-tabs-name-mouse-face ((t (:background "#181825" :foreground "#cdd6f4"))))
 '(centaur-tabs-selected ((t (:background "#1e1e2e" :foreground "#cdd6f4"))))
 '(centaur-tabs-selected-modified ((t (:background "#1e1e2e" :foreground "#f38ba8"))))
 '(doom-modeline-bar ((t (:background "#cba6f7"))))
 '(doom-modeline-panel ((t (:background "#cba6f7"))))
 '(fringe ((t (:background "#1e1e2e" :foreground "#45475a" :width normal))))
 '(olivetti-fringe ((t (:background "#181825" :width normal))))
 '(org-code ((t (:background "#11111b" :foreground "#a6e3a1"))))
 '(org-level-1 ((t (:height 1.99 :foreground "#cdd6f4" :extend nil :inherit bold))))
 '(org-level-2 ((t (:height 1.7 :foreground "#cdd6f4" :extend nil :inherit bold))))
 '(org-level-3 ((t (:extend nil :foreground "#cdd6f4" :weight bold :height 1.5))))
 '(org-level-4 ((t (:extend nil :foreground "#cdd6f4" :weight bold :height 1.2))))
 '(org-level-5 ((t (:extend nil :foreground "#cdd6f4" :weight bold :height 1.2))))
 '(org-level-6 ((t (:extend nil :foreground "#cdd6f4" :weight bold :height 1.2))))
 '(org-level-7 ((t (:extend nil :foreground "#cdd6f4" :weight bold :height 1.2))))
 '(org-level-8 ((t (:extend nil :foreground "#cdd6f4" :weight bold :height 1.2))))
 '(org-meta-line ((t nil)))
 '(tab-bar ((t (:background "#181825" :foreground "#a6adc8"))))
 '(treemacs-window-background-face ((t (:background "#181825")))))

(use-package all-the-icons
  :if (display-graphic-p))

(use-package centaur-tabs
  :demand
  :config
  (centaur-tabs-mode t)
  (setq centaur-tabs-style "rounded"
   	centaur-tabs-set-icons t
   	centaur-tabs-set-bar 'over
   	x-underline-at-descent-line t
	centaur-tabs-height 32
   	centaur-tabs-label-fixed-length 20)
  (centaur-tabs-change-fonts "arial" 160)
  :bind
  ("C-<prior>" . centaur-tabs-backward)
  ("C-<next>" . centaur-tabs-forward))
(centaur-tabs-headline-match)

(use-package treemacs
  :ensure t
  :defer t
  :init
  (with-eval-after-load 'winum
    (define-key winum-keymap (kbd "M-0") #'treemacs-select-window))
  :config
  (progn
    (setq treemacs-collapse-dirs                   (if treemacs-python-executable 3 0)
          treemacs-deferred-git-apply-delay        0.5
          treemacs-directory-name-transformer      #'identity
          treemacs-display-in-side-window          t
          treemacs-eldoc-display                   'simple
          treemacs-file-event-delay                2000
          treemacs-file-extension-regex            treemacs-last-period-regex-value
          treemacs-file-follow-delay               0.2
          treemacs-file-name-transformer           #'identity
          treemacs-follow-after-init               t
          treemacs-expand-after-init               t
          treemacs-find-workspace-method           'find-for-file-or-pick-first
          treemacs-git-command-pipe                ""
          treemacs-goto-tag-strategy               'refetch-index
          treemacs-header-scroll-indicators        '(nil . "^^^^^^")
          treemacs-hide-dot-git-directory          t
	  treemacs-indent-guide-mode               1
	  treemacs-indent-guide-style              'line
          treemacs-is-never-other-window           nil
          treemacs-max-git-entries                 5000
          treemacs-missing-project-action          'ask
          treemacs-move-forward-on-expand          nil
          treemacs-no-png-images                   nil
          treemacs-no-delete-other-windows         t
          treemacs-project-follow-cleanup          nil
          treemacs-persist-file                    (expand-file-name ".cache/treemacs-persist" user-emacs-directory)
          treemacs-position                        'left
          treemacs-read-string-input               'from-child-frame
          treemacs-recenter-distance               0.1
          treemacs-recenter-after-file-follow      nil
          treemacs-recenter-after-tag-follow       nil
          treemacs-recenter-after-project-jump     'always
          treemacs-recenter-after-project-expand   'on-distance
          treemacs-litter-directories              '("/node_modules" "/.venv" "/.cask")
          treemacs-project-follow-into-home        nil
          treemacs-show-cursor                     nil
          treemacs-show-hidden-files               t
          treemacs-silent-filewatch                nil
          treemacs-silent-refresh                  nil
          treemacs-sorting                         'alphabetic-asc
          treemacs-select-when-already-in-treemacs 'move-back
          treemacs-space-between-root-nodes        t
          treemacs-tag-follow-cleanup              t
          treemacs-tag-follow-delay                1.5
          treemacs-text-scale                      nil
          treemacs-user-mode-line-format           nil
          treemacs-user-header-line-format         nil
          treemacs-wide-toggle-width               70
          treemacs-width                           35
          treemacs-width-increment                 1
          treemacs-width-is-initially-locked       t
          treemacs-workspace-switch-cleanup        nil)

    ;; The default width and height of the icons is 22 pixels. If you are
    ;; using a Hi-DPI display, uncomment this to double the icon size.
    ;;(treemacs-resize-icons 44)

    (treemacs-follow-mode t)
    (treemacs-filewatch-mode t)
    (treemacs-fringe-indicator-mode 'always)
    (when treemacs-python-executable
      (treemacs-git-commit-diff-mode t))

    (pcase (cons (not (null (executable-find "git")))
                 (not (null treemacs-python-executable)))
      (`(t . t)
       (treemacs-git-mode 'deferred))
      (`(t . _)
       (treemacs-git-mode 'simple)))

    (treemacs-hide-gitignored-files-mode nil))
  :bind
  (:map global-map
        ("M-0"       . treemacs-select-window)
        ("C-x t 1"   . treemacs-delete-other-windows)
        ("C-x t t"   . treemacs)
        ("C-x t d"   . treemacs-select-directory)
        ("C-x t B"   . treemacs-bookmark)
        ("C-x t C-t" . treemacs-find-file)
        ("C-x t M-t" . treemacs-find-tag)))

(add-hook 'treemacs-mode-hook (lambda() (display-line-numbers-mode -1)))

(use-package treemacs-evil
  :after (treemacs evil)
  :ensure t)

; (use-package treemacs-projectile
;   :after (treemacs projectile)
;   :ensure t)

(use-package evil)
(evil-mode 1)

(use-package doom-modeline
  :ensure t
  :init (doom-modeline-mode 1)
  :config
  (setq doom-modeline-height 35
	doom-modeline-project-detection 'auto
	doom-modeline-buffer-file-name 'relative-from-project
	doom-modeline-icon t
	doom-modeline-buffer-modification-icon t
	doom-modeline-buffer-encoding t
	))

(use-package projectile)
(projectile-mode +1)
(define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)

(use-package olivetti
  :config
  (setq-default
   olivetti-style 'fancy))
(use-package org-modern)

(use-package svg-tag-mode
  :config
  (setq svg-tag-tags
	'((":TODO" . ((lambda (tag) (svg-tag-make "TODO"))))
	  ("\\(:#[A-Za-z0-9]+\\)" . ((lambda (tag) (svg-tag-make tag :bed 2))))
	  ("\\(:#[A-Za-z0-9)+:\\)$" . ((lambda (tag) (svg-tag-make tag :beg 2 :end -1)))))))

(defun turn-on-olivetti-mode ()
  (olivetti-mode)
  (olivetti-set-width 0.3)
  (display-line-numbers-mode -1)
  (evil-mode 1)
  (global-org-modern-mode)
  (setq header-line-format " ")
  (interactive)
  (setq buffer-face-mode-face '(:family "Iosevka" :height 150))
  (buffer-face-mode))
(add-hook 'text-mode-hook 'turn-on-olivetti-mode)

(setq inhibit-startup-message t)
(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)
(global-display-line-numbers-mode 1)
(load-theme 'catppuccin :no-confirm)

(add-to-list 'default-frame-alist '(font . "Iosevka" ))
(set-face-attribute 'default t :font "Iosevka" )
