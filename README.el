(condition-case nil
    (set-frame-font "Profont For Powerline-12")
  (error
   (set-frame-font "DejaVu Sans Mono-10")))

(setq inhibit-startup-screen t                    ;; Disable startup-screen
      initial-scratch-message ""
      garbage-collection-messages t               ;; Garbage Collector - show when working
      load-prefer-newer t                         ;; Always load newest byte code
      large-file-warning-threshold 200000000      ;; warn when opening files bigger than 200MB
      gnutls-min-prime-bits 4096                  ;; remove the warnings from the GnuTLS library when using HTTPS
      global-auto-revert-non-file-buffers t       ;; Also auto refresh dired, but be quiet about it
      auto-revert-verbose nil
      require-final-newline t                     ;; Newline at end of file
      sentence-end-double-space nil               ;; Don't assume that sentences should have two spaces after periods. This ain't a typewriter.
      global-subword-mode t                       ;;  Treat CamelCase subwords as unique
      confirm-kill-emacs 'y-or-n-p                ;; Don't ask `yes/no?', ask `y/n?'.
      history-length 1000
      savehist-save-minibuffer-history t
      savehist-autosave-interval nil ; save on kill only
      show-trailing-whitespace t
      show-paren-delay 0                          ;; small delay before showing a matching parenthesis
      visible-bell t                              ;; When you perform a problematic operation, flash the screen instead of ringing the terminal bell.
      version-control t                           ;; Version control
      vc-follow-symlinks t                        ;; don't ask for confirmation when opening symlinked file
      delete-old-versions t                       ;; delete excess backup versions silently
      vc-make-backup-files t                      ;; make backups file even when in version controlled dir
      create-lockfiles nil
      sentence-end-double-space nil               ;; sentence SHOULD end with only a point.
      fill-column 80                              ;; toggle wrapping text at the 80Th character
      enable-recursive-minibuffers t              ;; Allow recursive minibuffers
      default-directory "~/"                      ;; When opening a file, start searching at the user's home directory.
      savehist-file "~/.emacs.d/configs/savehist" ;; Save minibuffer history
      save-place-file "~/.emacs.d/configs/saveplace"
      bookmark-default-file "~/.emacs.d/configs/bookmarks" ;; bookmark
      backup-directory-alist `(("." . "~/.emacs.d/backups"))      ;; ; which directory to put backups file
      ;; auto-save-file-name-transforms '((".*" "~/.emacs.d/configs/auto-save-list/"
      ;; t))   ;;transform backups file name
      dired-recursive-deletes (quote top)         ;; “top” means ask once
      dired-dwim-target t
      dired-recursive-deletes t                   ;; Dired can delete nonempty directories including all their contents
      dired-hide-details-mode t
      eldoc-idle-delay 0.1                        ;; eldoc-mode
      eldoc-echo-area-use-multiline-p nil         ;; eldoc-mode
      ;; text-scale-mode-step 0.8
      text-quoting-style 'grave                   ;; Quoting style for warnings
      ring-bell-function 'ignore                  ;; disable the annoying bell ring
      ;; scroll-step 1                               ;; keyboard scroll one line at a time
      scroll-conservatively 101                   ;; automatic scrolling never centers point, no matter how far point moves;
      scroll-preserve-screen-position t           ;; scroll commands to keep point at the same screen position, so that scrolling back to the same screen conveniently returns point to its original position
      line-number-mode t
      suggest-key-bindings t                      ;; message says that command has a key binding
      column-number-mode t
      buffer-file-coding-system 'utf-8            ;; UTF8
      coding-system-for-read 'utf-8
      coding-system-for-write 'utf-8
      make-pointer-invisible t                    ;; hide cursor while typing
      display-time-day-and-date t                 ;; date - hours - day(name/number)
      display-time-24hr-format t                  ;; display time in the mini-buffer
      display-time-default-load-average nil
      electric-indent-mode nil                    ;; No electric indent
      save-interprogram-paste-before-kill t       ;; Save clipboard data of other programs in the kill ring when possible
      apropos-sort-by-scores t                    ;; sort results by relevancy
      ediff-diff-options "-w"                     ;; A saner ediff
      delete-by-moving-to-trash t                 ;; affected files or directories into the operating system's Trash, instead of deleting them outright
      ediff-split-window-function 'split-window-horizontally
      ediff-window-setup-function 'ediff-setup-windows-plain
      ;; split-width-threshold nil                   ;; never split the window (nice for rtags and compile errors).
      ;; split-height-threshold nil
      browse-url-browser-function 'browse-url-xdg-open ;; Open URLs with xdg-open
      register-separator ?+                       ;; separate individual collected pieces using a separator
      user-full-name "lyr3"
      user-mail-address "lyr3@protonmail.com")

(defalias 'list-buffers 'ibuffer)                 ;; make ibuffer the default buffer lister.
(defalias 'yes-or-no-p 'y-or-n-p)                 ;; Don't make me type 'yes' or 'no', y/n will do

(setq-default  indent-tabs-mode nil                ;; use space to indent by default
               dired-listing-switches "-laGh1v --group-directories-first"       ;; Add file sizes in human-readable units (KB, MB, etc) to dired buffers.
               ;; tab-width 4                         ;; set appearance of a tab that is represented by 4 spaces

               ;; fill-column 80                      ;; Set the default line length to LINE-LENGTH.
               save-place t                        ;; remember cursor position, for emacs 25.1 or later
               frame-title-format
               '((:eval
                  (if (buffer-file-name)
                      (abbreviate-file-name (buffer-file-name)) "%b")
                  )(:eval
                  4q2
                  (if (buffer-modified-p)
                      " *")) " emacs")           ;; buffer name
               indent-tabs-mode nil                ;; Indent with spaces by default
               )

;; Show me empty lines after buffer end
;; (set-default 'indicate-empty-lines t)

;; UTF-8 Everywhere
(prefer-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)

(progn
  ;; (put 'scroll-left 'disabled nil)
  ;; (put 'dired-find-alternate-file 'disabled nil)
  ;; stop warning prompt for some commands. There's always undo.
  (put 'narrow-to-region 'disabled nil)
  (put 'narrow-to-page 'disabled nil)
  (put 'upcase-region 'disabled nil)
  (put 'downcase-region 'disabled nil)
  (put 'erase-buffer 'disabled nil)
  (put 'downcase-region 'disabled nil)            ;; Downcase Region
  (put 'dired-find-alternate-file 'disabled nil)
  )

;; When something changes a file, automatically refresh the buffer containing that file so they can't get out of sync.
(global-auto-revert-mode t)

(size-indication-mode t)

;; No blinking
(blink-cursor-mode 0)

;; delete the selection with a keypress
(delete-selection-mode t)

;; Turn on transient-mark-mode.
(transient-mark-mode t)

;; (save-place-mode 1)
(savehist-mode t)

;; Register separator
;; (set-register register-separator "\n\n")

;; Turn on syntax highlighting whenever possible.
(global-font-lock-mode t)

;; Visually indicate matching pairs of parentheses.
(show-paren-mode 1)

;; Time
(display-time-mode)

;; Undo/Redo
;; (winner-mode 1)
;; (remove-hook 'minibuffer-setup-hook 'winner-save-unconditionally)

(add-hook 'prog-mode-hook #'hs-minor-mode) ;; folding
(add-hook 'before-save-hook 'delete-trailing-whitespace)  ;; Delete trail
(add-hook 'focus-out-hook #'garbage-collect) ;; Garbage-collect on focus-out, Emacs should feel snappier.
;; (add-hook 'window-setup-hook #'delete-other-windows) ;; Don't open with splits
(add-hook 'dired-mode-hook
          (lambda ()
            (define-key dired-mode-map (kbd "^")
              (lambda () (interactive) (find-alternate-file "..")))
                                        ; was dired-up-directory
            ))



(use-package recentf
  :ensure nil
  :init
  (recentf-mode 1)
  (run-at-time nil (* 5 60) 'recentf-save-list)
  (setq
   ;; recentf-save-file (expand-file-name "recentf" prelude-savefile-dir)
   recentf-max-saved-items 1000
   recentf-max-menu-items 60
   ;; disable recentf-cleanup on Emacs start, because it can cause
   ;; recentf-auto-cleanup 'never ;; problems with remote files
   recentf-auto-cleanup 600  ;; clean up the recent files
   ;; exclude ** from recentfiles buffer
   recentf-exclude '("^/var/folders\\.*"
                     "COMMIT_MSG"
                     "[0-9a-f]\\{32\\}-[0-9a-f]\\{32\\}\\.org"
                     "github.*txt$"
                     "COMMIT_EDITMSG\\'"
                     ".*-autoloads\\.el\\'"
                     "recentf"
                     ".*pang$" ".*cache$"
                     "[/\\]\\.elpa/")))

(defun ielm-auto-complete ()
  "Enables `auto-complete' support in \\[ielm]."
  (setq ac-sources '(ac-source-functions
                     ac-source-variables
                     ac-source-features
                     ac-source-symbols
                     ac-source-words-in-same-mode-buffers))
  (add-to-list 'ac-modes 'inferior-emacs-lisp-mode)
  (auto-complete-mode 1))
(add-hook 'ielm-mode-hook 'ielm-auto-complete)

;; Save buffers
;; (use-package desktop
;;   :ensure nil
;;   :commands desktop-save-mode
;;   :init
;;   (progn
;;     (desktop-save-mode t)
;;     (setq desktop-dirname "~/.emacs.d/configs/"
;;           desktop-base-file-name "desktop"
;;           desktop-base-lock-name "desktop.lock"
;;           desktop-restore-frames t
;;           desktop-restore-reuses-frames t
;;           desktop-restore-in-current-display t
;;           desktop-restore-forces-onscreen t))
;;   :custom
;;   (desktop-auto-save-timeout 60 "Save desktop after one minute of idle")
;;   (desktop-restore-eager 5)
;;   (desktop-load-locked-desktop t))

;; meaningful names for buffers with the same name
(use-package uniquify
  :ensure nil
  :init
  (setq uniquify-buffer-name-style 'reverse
        uniquify-after-kill-buffer-p t                   ;; rename after killing uniquified
        uniquify-separator "/"
        uniquify-ignore-buffers-re "^\\*"                ;; don't muck with special buffers
        ))

(defvar my-term-shell "/bin/bash")
(defadvice ansi-term (before force-bash)
  (interactive (list my-term-shell)))
(ad-activate 'ansi-term)

(use-package flyspell
  :diminish flyspell-mode
  :init
  (add-hook 'prog-mode-hook 'flyspell-prog-mode)
  (add-hook 'text-mode-hook 'flyspell-mode))

(use-package dired-atool
  :defer 2
  :diminish
  :init (dired-atool-setup)
  :config
  (define-key dired-mode-map "z" #'dired-atool-do-unpack)
  (define-key dired-mode-map "Z" #'dired-atool-do-pack))

(use-package dired-k
  :defer 2
  :diminish
  :config
  (progn
    (add-hook 'dired-initial-position-hook 'dired-k)))

(use-package dired-hacks-utils
  :defer 2
  :diminish
  :config
  (setq dired-collapse-mode t
        dired-open-extensions
        '(("pdf" . "firefox")
                                        ;("ogg" . "mpv")
          ("ogv" . "mpv")
          ("mkv" . "mpv")
          ("mp4" . "mpv")
          ("avi" . "mpv"))))

(use-package dired-collapse
  :config
  (setq dired-collapse-mode t))

(use-package dired-quick-sort
  :config (dired-quick-sort-setup))

;; (use-package stripe-buffer              ; Add stripes to a buffer
;;   :init (add-hook 'dired-mode-hook #'stripe-buffer-mode))

;; Terminal in emacs
(use-package multi-term
  :defer 2
  :diminish
  :commands multi-term)

(use-package eshell-prompt-extras
  :defer 2
  :diminish eshell-mode
  :config
  (with-eval-after-load "esh-opt"
    (autoload 'epe-theme-lambda "eshell-prompt-extras")
    (setq eshell-highlight-prompt nil
          eshell-prompt-function 'epe-theme-lambda)))

(use-package eshell-z
  :defer 2
  :diminish
  :config
  (add-hook 'eshell-mode-hook
            (defun my-eshell-mode-hook ()
              (require 'eshell-z))))

(use-package esh-help
  :defer 2
  :diminish
  :config (setup-esh-help-eldoc)  ;; To use eldoc in Eshell
  )

(use-package eshell-bookmark
  :defer 2
  :diminish
  :config
  (add-hook 'eshell-mode-hook 'eshell-bookmark-setup))

(use-package eshell-did-you-mean
  :defer 2
  :config (eshell-did-you-mean-setup))

(use-package eshell-git-prompt
  :defer 2
  :config (eshell-git-prompt-use-theme 'git-radar))

;; (use-package esh-autosuggest
;;   :hook (eshell-mode . esh-autosuggest-mode)
;;   ;; If you have use-package-hook-name-suffix set to nil, uncomment and use the
;;   ;; line below instead:
;;   ;; :hook (eshell-mode-hook . esh-autosuggest-mode)
;;   )

(use-package exec-path-from-shell
  :diminish
  :defer 2
  :config
  (exec-path-from-shell-initialize))

(use-package which-key
  :diminish which-key-mode
  :commands which-key-mode
  :init
  (which-key-mode))

(use-package hydra
  :config

  (defhydra hydra-zoom (global-map "C-c x h")
    "zoom"
    ("e" enlarge-window "Enlarge Window")
    ("E" enlarge-window-horizontally "Enlarge Window Horizontally"))

  (defhydra hydra-launcher (:color blue)
    "Launch"
    ("h" man "man")
    ("r" (browse-url "http://www.reddit.com/r/emacs/") "reddit")
    ("w" (browse-url "http://www.emacswiki.org/") "emacswiki")
    ("s" shell "shell")
    ("q" nil "cancel"))
  (global-set-key (kbd "C-c x r") 'hydra-launcher/body))

;;; Custom prefixes
(eval-and-compile
  (mapc #'(lambda (entry)
            (define-prefix-command (cdr entry))
            (bind-key (car entry) (cdr entry)))
        '(
          ("C-c x b" . Bultin)
          ("C-c x @" . Hs)
          ("C-c x x d" . DefineWord)
          ("C-c x d" . Devel)
          ("C-c x g" . Goto-last)
          ("C-c x g" . Goto-last)
          ("C-c x e" . Move-text)
          ("C-c x s" . Smartparens)
          ;; ("C-c x S" . Spell)
          ("C-c x x" . Apps)
          ("C-c x x e" . Emms)
          ("C-c x o" . OraFunctions)
          ("C-c x f" . CustomDefun)
          ("C-c x y" . Yasnippet)
          ("C-c x h" . Hydra)
          ("C-c x u" . Url)
          ("C-c x t" . Tools)
          ("C-c x t d" . Dumb-Jump)
          ;; ("C-,"   . my-ctrl-comma-map)
          ;; ("<C-m>" . my-ctrl-m-map)
          )))

(bind-keys
 ;; Bultin
 ("C-c x b a" . ansi-term)
 ("C-c x b s" . shell)
 ("C-c x b e" . eshell)
 ("C-c x b v" . eval-buffer)
 ("C-c x b k" . kill-buffer-and-window)
 ("C-x K" . kill-this-buffer)

 ;; Custom defuns
 ("C-c x f d" . xah-delete-current-file-make-backup)

 ;; Orafunctions
 ("C-c x o w" . ora-open-wikipedia)

 ;; use hippie-expand instead of dabbrev
 ("M-/" . hippie-expand)
 )

;; [LEGACY]
;; (define-key dired-mode-map (kbd "RET") 'dired-find-alternate-file) ; was dired-advertised-find-file
;; (define-key dired-mode-map (kbd "^") (lambda () (interactive) (find-alternate-file "..")))  ; was dired-up-directory

;; Moving through windows
;; (global-set-key (kbd "C-c x w p") 'windmove-up)
;; (global-set-key (kbd "C-c x w n") 'windmove-down)
;; (global-set-key (kbd "C-c x w f") 'windmove-right)
;; (global-set-key (kbd "C-c x w b") 'windmove-left)

(use-package gruvbox-theme
  :config (load-theme 'gruvbox-dark-soft t))

;; all-the-icons-install-fonts
(use-package all-the-icons
  :defer 2)

(use-package all-the-icons-dired
  :defer 2
  :commands (all-the-icons-dired-mode)
  :init
  (add-hook 'dired-mode-hook 'all-the-icons-dired-mode))

(use-package all-the-icons-ivy
  :defer 2
  :init (all-the-icons-ivy-setup))

(use-package spaceline
  :defer 2
  :diminish  (spaceline-mode)
  :config
  (require 'spaceline-config)
  (spaceline-spacemacs-theme)
  (setq    spaceline-line-column-p t
           spaceline-line-p t
           powerline-default-separator nil
           spaceline-buffer-encoding-abbrev-p nil
           spaceline-erc-track-p nil
           spaceline-buffer-size-p nil
           spaceline-which-function-p t
           spaceline-buffer-modified-p nil
           spaceline-version-control-p nil
           spaceline-minor-modes-p nil
           spaceline-buffer-position-p nil
           )
  (spaceline-compile))

(use-package cl-generic
  :demand)

(use-package xelb)

(use-package dmenu
  :diminish
  :defer 4
  :config
  (setq dmenu--history-list nil)
  (startup-apps))

(use-package symon
  :diminish symon-mode
  :defer 2)

(use-package pulseaudio-control
  :defer 2
  ;; :config (pulseaudio-control-default-keybindings)
)

(use-package exwm
  :init
  (require 'exwm-config)
  :config
  ;; Do not forget to enable EXWM. It will start by itself when things are ready.)
  (exwm-enable))

;; [DEFINITIONS]

(require 'exwm-systemtray)
(exwm-systemtray-enable)

;; disable dialog boxes since they are unusable in exwm
(setq use-dialog-box nil)

;; Allow switching buffers between workspaces
(setq exwm-workspace-show-all-buffers t)
(setq exwm-layout-show-all-buffers t)

  ;;; Allow non-floating resizing with mouse.
(setq window-divider-default-bottom-width 2
      window-divider-default-right-width 2)
(window-divider-mode)

;; N Workplaces
(setq exwm-workspace-number 4)

;; ;; You can hide the minibuffer and echo area when they're not used, by
;; ;; uncommenting the following line.
;; (setq exwm-workspace-minibuffer-position 'bottom)

;; (symbol-value 'are-workspaces-loaded)

;; [FUNCTIONS]

  ;;; Check for start-up errors. See ~/.profile.
(let ((error-logs (directory-files "~" t "errors.*log$")))
  (when error-logs
    (warn "Error during system startup.  See %s." (mapconcat 'identity error-logs ", "))
    (when (daemonp)
      ;; Non-daemon Emacs already brings up the *Warning* buffer.
      (setq initial-buffer-choice
            (lambda () (get-buffer "*Warnings*"))))))

  ;;; Some programs such as 'emacs' are better off being started in char-mode.
(defun ambrevar/exwm-start-in-char-mode ()
  (when (string= exwm-instance-name "emacs")
    (exwm-input-release-keyboard (exwm--buffer->id (window-buffer)))))
(add-hook 'exwm-manage-finish-hook 'ambrevar/exwm-start-in-char-mode)


;; ;; set global var to track if workspaces have been loaded
(defvar are-workspaces-loaded 0
  "are workspaces loaded? start out with value of 0.")

;; ;; quick swtiching between workspaces
(defvar exwm-toggle-workspace 0
  "previously selected workspace. used with `exwm-jump-to-last-exwm'.")


(add-hook 'exwm-update-class-hook
          (lambda ()
            (unless (or (string-prefix-p "sun-awt-X11-" exwm-instance-name)
                        (string= "gimp" exwm-instance-name))
              (exwm-workspace-rename-buffer exwm-class-name))))
(add-hook 'exwm-update-title-hook
          (lambda ()
            (when (or (not exwm-instance-name)
                      (string-prefix-p "sun-awt-X11-" exwm-instance-name)
                      (string= "gimp" exwm-instance-name))
              (exwm-workspace-rename-buffer exwm-title))))

(defvar exwm-workspace-switch-wrap t
  "Whether `exwm-workspace-next' and `exwm-workspace-prev' should wrap.")

(defun exwm-workspace-next ()
  "Switch to next exwm-workspaceective (to the right)."
  (interactive)
  (let* ((only-workspace? (equal exwm-workspace-number 1))
         (overflow? (= exwm-workspace-current-index
                       (1- exwm-workspace-number))))
    (cond
     (only-workspace? nil)
     (overflow?
      (when exwm-workspace-switch-wrap
        (exwm-workspace-switch 0)))
     (t (exwm-workspace-switch  (1+ exwm-workspace-current-index))))))

(defun exwm-workspace-prev ()
  "Switch to next exwm-workspaceective (to the right)."
  (interactive)
  (let* ((only-workspace? (equal exwm-workspace-number 1))
         (overflow? (= exwm-workspace-current-index 0)))
    (cond
     (only-workspace? nil)
     (overflow?
      (when exwm-workspace-switch-wrap
        (exwm-workspace-switch (1- exwm-workspace-number))))
     (t (exwm-workspace-switch  (1- exwm-workspace-current-index))))))

;; Quick swtiching between workspaces
(defvar exwm-toggle-workspace 0
  "Previously selected workspace. Used with `exwm-jump-to-last-exwm'.")

(defun exwm-jump-to-last-exwm ()
  (interactive)
  (exwm-workspace-switch exwm-toggle-workspace))

(defadvice exwm-workspace-switch (before save-toggle-workspace activate)
  (setq exwm-toggle-workspace exwm-workspace-current-index))

(defun reboot-systemctl ()
  "systemD: reboot system"
  (interactive)
  (start-process-shell-command "systemctl reboot" nil "systemctl reboot"))

(defun poweroff-systemctl ()
  (interactive)
  (start-process-shell-command "systemctl poweroff" nil "systemctl poweroff"))

(defun pulseaudio-fix ()
  (interactive)
  (start-process-shell-command "killall pulseaudio & pulseaudio &" nil "killall pulseaudio & pulseaudio &"))

(defun popcorn ()
  (interactive)
  (start-process-shell-command "cd ~/Temps/pop/ || exit && ./Popcorn-Time" nil "cd ~/Temps/pop/ || exit && ./Popcorn-Time"))

(defun background-shell-command (command)
  (interactive (list (read-shell-command "$ ")))
  (with-temp-buffer
    (async-shell-command command (current-buffer))))

(defun startup-apps ()
  "Open some few apps in specific workspaces"
  (interactive)
  ;; (exwm-workspace-switch 1)
  (start-process-shell-command "iceweasel" nil "iceweasel")
  ;; (sleep-for 2)
  ;; (exwm-workspace-switch 3)
  (start-process-shell-command "steam" nil "steam"))

;; Workspaces
(exwm-input-set-key (kbd "s-n") 'exwm-workspace-next)
(exwm-input-set-key (kbd "s-p") 'exwm-workspace-prev)

(exwm-input-set-key (kbd "<s-tab>") 'exwm-jump-to-last-exwm)

;; + set shortcuts to switch to a certain workspace.
(exwm-input-set-key (kbd "s-1")
                    (lambda () (interactive) (exwm-workspace-switch 0)))
(exwm-input-set-key (kbd "s-2")
                    (lambda () (interactive) (exwm-workspace-switch 1)))
(exwm-input-set-key (kbd "s-3")
                    (lambda () (interactive) (exwm-workspace-switch 2)))

;; + bind a key to switch workspace interactively
;; (exwm-input-set-key (kbd "s-W") 'exwm-workspace-switch)

;; + bind a key to switch workspace interactively
(exwm-input-set-key (kbd "s-m") 'exwm-workspace-move-window)

;; Last workspace visited
(exwm-input-set-key (kbd "<s-tab>") #'exwm-jump-to-last-exwm)

;; restart
;; (exwm-input-set-key (kbd "s-r") 'exwm-reset)
;; (exwm-input-set-key (kbd "s-R") 'exwm-restart)

(exwm-input-set-key (kbd "s-F") 'exwm-layout-toggle-fullscreen)
(exwm-input-set-key (kbd "s-T") 'exwm-floating-toggle-floating)

;; exwm mode-line
;; (exwm-input-set-key (kbd "s-<") #'exwm-layout-hide-mode-line)
;; (exwm-input-set-key (kbd "s->") #'exwm-layout-show-mode-line)
;; (exwm-input-set-key (kbd "s-M") 'exwm-layout-toggle-mode-line)
;; (exwm-input-set-key (kbd "s-u") 'exwm-input-toggle-keyboard)

;; [EMACS FEATURES]

(exwm-input-set-key (kbd "s-x") 'counsel-M-x) ;; M-x

;; [BUFFERS]
(exwm-input-set-key (kbd "s-b") 'ivy-switch-buffer)
(exwm-input-set-key (kbd "s-i") 'ibuffer)
(exwm-input-set-key (kbd "s-f") 'counsel-find-file)
(exwm-input-set-key (kbd "s-K") (lambda () (interactive) (kill-buffer))) ;; kill visible buffer
;; (exwm-input-set-key (kbd "s-K") 'kill-this-buffer)

;; [TERM]
(exwm-input-set-key (kbd "s-v") 'multi-term)
(exwm-input-set-key (kbd "s-V") 'eshell)

;; [WINDOWS]

;; jump to buffers with s-[hjkl]
(exwm-input-set-key (kbd "s-h") 'windmove-left)
(exwm-input-set-key (kbd "s-j") 'windmove-down)
(exwm-input-set-key (kbd "s-k") 'windmove-up)
(exwm-input-set-key (kbd "s-l") 'windmove-right)

(exwm-input-set-key (kbd "s-[") 'shrink-window-horizontally)
(exwm-input-set-key (kbd "s-{") 'shrink-window)
(exwm-input-set-key (kbd "s-]") 'enlarge-window-horizontally)
(exwm-input-set-key (kbd "s-}") 'enlarge-window)

(exwm-input-set-key (kbd "s-z") 'dmenu)

;;Emms
(exwm-input-set-key (kbd "s-a") 'emms-player-mpd-previous)
(exwm-input-set-key (kbd "s-d") 'emms-player-mpd-next)
(exwm-input-set-key (kbd "s-W") 'emms-volume-raise)
(exwm-input-set-key (kbd "s-S") 'emms-volume-lower)
(exwm-input-set-key (kbd "s-E") 'emms-smart-browse)
(exwm-input-set-key (kbd "s-SPC") 'emms-pause)

  ;;; Pulseaudio
(when (require 'pulseaudio-control nil t)
  (exwm-input-set-key (kbd "s-w") 'pulseaudio-control-increase-volume)
  (exwm-input-set-key (kbd "s-s") 'pulseaudio-control-decrease-volume)
  (exwm-input-set-key (kbd "s-e") 'pulseaudio-control-toggle-current-sink-mute))


(exwm-input-set-key (kbd "s-g") 'narrow-or-widen-dwim)

;; [Emacs config bindings]
(exwm-input-set-key (kbd "s-r") (lambda () (interactive) (find-file "~/.emacs.d/README.org")))
(exwm-input-set-key (kbd "s-R") (lambda () (interactive) (find-file "~/.emacs.d/init.el")))


;; [EXTERNAL APPLICATIONS]

(exwm-input-set-key (kbd "s-P")
                    #'background-shell-command)

(exwm-input-set-key (kbd "s-c")
                    (lambda ()
                      (interactive)
                      (start-process-shell-command "slock" nil "slock")))

;; (exwm-input-set-key (kbd "s-v")
;;                     (lambda ()
;;                       (interactive)
;;                       (start-process-shell-command "st" nil "st")))


;; Scrot
(exwm-input-set-key (kbd "<print>") (lambda () (interactive) (start-process-shell-command "scrot" nil "scrot ~/Pictures/shot-$(date -Iseconds | cut -d'+' -f1).png")))

;; [LEGACY]

;; alsamixer

;; (exwm-input-set-key (kbd "s-w")
;;                     (lambda () (interactive) (shell-command "amixer set Master 5%+")))
;; (exwm-input-set-key (kbd "s-s")
;;                     (lambda () (interactive) (shell-command "amixer set Master 5%-")))
;; (exwm-input-set-key (kbd "s-e")
;;                     (lambda () (interactive) (shell-command "amixer set Master 1+ toggle")))

;; Screen Brightness
;; (exwm-input-set-key (kbd "<XF86MonBrightnessDown>") (lambda () (interactive) (shell-command "light -U 5; light")))
;; (exwm-input-set-key (kbd "<XF86MonBrightnessUp>") (lambda () (interactive) (shell-command "light -A 5; light")))

;; [Key siminulation]

;; ;; Line-editing shortcuts
;; (exwm-input-set-simulation-keys
;;  '(([?\C-b] . left)
;;    ([?\C-f] . right)
;;    ([?\M-f] . C-right)
;;    ([?\M-b] . C-left)
;;    ([?\C-y] . S-insert)
;;    ([?\C-p] . up)
;;    ([?\C-n] . down)
;;    ([?\C-a] . home)
;;    ([?\C-e] . end)
;;    ([?\M-v] . prior)
;;    ([?\C-v] . next)
;;    ([?\C-d] . delete)
;;    ([?\C-k] . (S-end delete))))

;; The following example demonstrates how to set a key binding only available
;; in line mode. It's simply done by first push the prefix key to
;; ;; `exwm-input-prefix-keys' and then add the key sequence to `exwm-mode-map'.
;; ;; The example shorten 'C-c x q' to 'C-q'.
;; (push ?\C-q exwm-input-prefix-keys)
;; (define-key exwm-mode-map [?\C-q] 'exwm-input-send-next-key)
;; ;; M-m leader, sorry Space Folks
;; (push ?\M-m exwm-input-prefix-keys)
;; ;; Universal Get-me-outta-here
;; (push ?\C-g exwm-input-prefix-keys)
;; ;; Universal Arguments
;; (push ?\C-u exwm-input-prefix-keys)
;; (push ?\C-0 exwm-input-prefix-keys)
;; (push ?\C-1 exwm-input-prefix-keys)
;; (push ?\C-2 exwm-input-prefix-keys)
;; (push ?\C-3 exwm-input-prefix-keys)
;; (push ?\C-4 exwm-input-prefix-keys)
;; (push ?\C-5 exwm-input-prefix-keys)
;; (push ?\C-6 exwm-input-prefix-keys)
;; (push ?\C-7 exwm-input-prefix-keys)
;; (push ?\C-8 exwm-input-prefix-keys)
;; (push ?\C-9 exwm-input-prefix-keys)
;; ;; C-c x, C-x are needed for copying and pasting
;; (delete ?\C-x exwm-input-prefix-keys)
;; (delete ?\C-c x exwm-input-prefix-keys)
;; ;; We can use `M-m h' to access help
;; (delete ?\C-h exwm-input-prefix-keys)

(use-package company
  :diminish company-mode
  :init
  (add-hook 'after-init-hook 'global-company-mode)
  :config
  (setq company-idle-delay 0     ;; no delay
        company-show-numbers t   ;; digits to select company-mode candidates
        company-tooltip-align-annotations 't ;; align annotations to the right tooltip border
        company-begin-commands '(self-insert-command)  ;; start autocompletion only after typing
        company-minimum-prefix-length 2
        company-tooltip-limit 20)
  :bind
  ("C-c x y c" . company-files))

(use-package company-quickhelp
  :diminish company-quickhelp-mode
  :defer 2
  :config
  (company-quickhelp-mode))

(with-eval-after-load 'company
  (company-quickhelp-mode)
  (define-key company-active-map (kbd "C-c x c q") #'company-quickhelp-manual-begin))

(use-package company-shell
  :diminish company-shell-modes
  :defer 2
  :config
  (require 'company)
  :init
  (add-hook 'shell-mode-hook 'shell-mode-company-init))

(use-package company-statistics
  :ensure t
  :defer 2
  :init
  (company-statistics-mode))

(defun shell-mode-company-init ()
  (setq-local company-backends '((company-shell
                                  company-shell-env
                                  company-etags
                                  company-dabbrev-code))))

;; preserve tab-completion in ansi-term
(add-hook 'term-mode-hook (lambda()
                            (setq yas-dont-activate t)))

(use-package headlong
  :defer 2)


(use-package vimrc-mode
  :defer t)

;; [AUTO-COMPLETE]

;; (use-package auto-complete
;;   :diminish (auto-complete-mode)
;;   :config
;;   (require 'auto-complete-config)
;;   (global-auto-complete-mode t)
;;   (dolist (mode '(magit-log-edit-mode log-edit-mode org-mode text-mode haml-mode
;;                                       sass-mode yaml-mode csv-mode espresso-mode haskell-mode
;;                                       html-mode web-mode sh-mode smarty-mode clojure-mode
;;                                       lisp-mode textile-mode markdown-mode tuareg-mode
;;                                       js2-mode css-mode less-css-mode))
;;     (add-to-list 'ac-modes mode))
;;   ;; (define-key ac-complete-mode-map "\C-j" 'newline-and-indent)
;;   ;; (define-key ac-complete-mode-map [return] nil)
;;   ;; (define-key ac-complete-mode-map (kbd "M-TAB") nil)
;;   (setq ac-menu-height 30
;;         ac-use-menu-map t
;;         ac-use-menu-map t
;;         ac-dwim nil ; To get pop-ups with docs even if a word is uniquely completed
;;         ac-delay 0.4
;;         ac-show-menu-immediately-on-auto-complete t)
;;   ;; Select candidates with C-n/C-p only when completion menu is displayed
;;   (define-key ac-menu-map "\C-n" 'ac-next)
;;   (define-key ac-menu-map "\C-p" 'ac-previous)
;;   (ac-config-default)
;;   )

;; (use-package ac-etags
;;   :diminish)

(use-package yasnippet
  :diminish yas-minor-mode
  :bind
  ("C-c x y y" . yas-expand)
  (:map yas-minor-mode-map
        ("TAB" . nil)
        ("<tab>" . nil))
  :init
  ;; (yas-global-mode 1)
  ;; (add-hook 'prog-mode-hook #'yas-minor-mode)
  ;; (add-hook 'shell-mode-hook 'yas-minor-mode)
  :hook
  ((prog-mode . yas-minor-mode)
   (emacs-lisp-mode . yas-minor-mode)
   (org-mode . yas-minor-mode)
   (c-mode . yas-minor-mode)
   (shell-mode . yas-minor-mode)
   (python-mode . yas-minor-mode))
  :config
  (progn
    ;; (define-key yas-minor-mode-map [(tab)] nil)
    ;; (define-key yas-minor-mode-map (kbd "TAB") nil)
    (setq yas-snippet-dirs
          '("~/.emacs.d/configs/snippets")
          yas-triggers-in-field t
          yas-verbosity 0
          yas-fallback-behavior 'return-nil)
    (yas-reload-all)))

(use-package yasnippet-snippets
  :defer t)

(use-package auto-yasnippet
  :defer 2
  :after yasnippet
  :commands (aya-create aya-open-line)
  :bind (("C-c x y a" . aya-create)
         ("C-c x y e" . aya-expand)
         ("C-c x y o" . aya-open-line)))

(use-package flycheck
  :diminish flycheck-mode
  :defer 2
  :init
  (progn
    (global-flycheck-mode))
  :config
  ;; permanently enable syntax checking
  (progn
    (add-hook 'shell-mode-hook 'flycheck-mode)
    (add-hook 'after-init-hook #'global-flycheck-mode)))

(use-package flycheck-pos-tip
  :diminish flycheck-pos-tip-mode
  :defer 2
  :config
  (progn
    (with-eval-after-load 'flycheck
      (flycheck-pos-tip-mode))
    ;; hang longer
    (setq flycheck-pos-tip-timeout 10)))

(use-package projectile
  :diminish projectile-mode
  :defer 2
  :init
  (projectile-mode)
  :config
  (setq projectile-mode-line nil)
  ;; (setq projectile-project-root-files-bottom-up
  ;; '(".projectile"))
  (setq projectile-completion-system 'ivy)
  (setq projectile-indexing-method 'alien)
  (setq projectile-enable-caching nil)
  (setq projectile-verbose nil)
  (setq projectile-do-log nil)
  (setq projectile-switch-project-action
        (lambda ()
          (dired (projectile-project-root)))))

(use-package aggressive-indent
  :diminish aggressive-indent-mode
  :init  (global-aggressive-indent-mode 1)
  :defer 2
  :hook
  ((c-mode . aggressive-indent-mode)
   (emacs-lisp-mode . aggressive-indent-mode)
   (html-mode . aggressive-indent-mode))
  :bind
  (:map aggressive-indent-mode-map
        ("C-q" . nil))
  :config
  ;; (add-hook 'emacs-lisp-mode-hook #'aggressive-indent-mode)
  ;; (add-hook 'c-mode-hook #'aggressive-indent-mode)
  (setq-default aggressive-indent-comments-too t))

(use-package diff-hl
  :diminish diff-hl-mode
  :defer 2
  :config
  (global-diff-hl-mode t)
  (add-hook 'dired-mode-hook 'diff-hl-dired-mode)
  (add-hook 'magit-post-refresh-hook 'diff-hl-magit-post-refresh))

(use-package diffview
  :defer 2
  :commands (diffview-current diffview-region diffview-message))

(use-package smartparens-config
  :diminish (smartparens-mode)
  :ensure smartparens
  :hook
  (org-mode . smartparens-strict-mode)
  (prog-mode . smartparens-strict-mode)
  (scheme-mode . smartparens-strict-mode)
  :config
  (progn
    (show-smartparens-global-mode t))
  :bind
  ("C-c x s f o" . sp-forward-sexp)
  ("C-c x s B" . sp-backward-sexp)
  ("C-c x s b u" . sp-backward-up-sexp)
  ("C-c x s b d" . sp-backward-down-sexp)
  ("C-c x s b e" . sp-beginning-of-sexp)
  ("C-c x s e n" . sp-end-of-sexp)
  ("C-c x s d o" . sp-down-sexp)
  ("C-c x s u p" . sp-up-sexp)
  ("C-c x s n" . sp-next-sexp)
  ("C-c x s p" . sp-previous-sexp)
  ("C-c x s k" . sp-kill-sexp)
  ("C-c x s c" . sp-copy-sexp)
  ("C-c x s u n" . sp-unwrap-sexp)
  ("C-c x s u b" . sp-backward-unwrap-sexp)
  ("C-c x s f s" . sp-forward-slurp-sexp)
  ("C-c x s f b" . sp-forward-barf-sexp)
  ("C-c x s b s" . sp-backward-slurp-sexp)
  ("C-c x s b b" . sp-backward-barf-sexp)
  ("C-c x s s p" . sp-splice-sexp)
  ("C-c x s s b" . sp-splice-sexp-killing-backward)
  ("C-c x s s k" . sp-splice-sexp-killing-around)
  ("C-c x s s n e" . sp-select-next-thing-exchange)
  ("C-c x s s n t" . sp-select-next-thing)
  ("C-c x s m" . sp-mark-sexp)
  ("C-c x s f S" . sp-forward-symbol)
  ("C-c x s b S" . sp-backward-symbol))

(use-package emacs-surround
  :ensure nil
  :bind ("C-c x d q" . emacs-surround))

(use-package rainbow-delimiters
  :diminish rainbow-delimiters-mode
  :init
  (add-hook 'prog-mode-hook #'rainbow-delimiters-mode))

(use-package electric-operator
  :diminish electric-operator-mode)

(use-package undo-tree
  :defer 2
  :diminish undo-tree-mode
  :config
  (progn
    (global-undo-tree-mode)
    (setq undo-tree-visualizer-timestamps t
          undo-tree-visualizer-diff t
          undo-tree-auto-save-history t
          undo-tree-history-directory-alist
          `((".*" . ,temporary-file-directory))
          )))

(use-package dash
  :diminish)

(use-package s
  :diminish)

(use-package f
  :diminish)

(require 'cl)

;; (use-package linum-relative
;;   :diminish linum-relative-mode
;;   :ensure t
;;   :config
;;   (setq linum-relative-current-symbol ""
;;         linum-relative-format "%3s ")
;;   (add-hook 'prog-mode-hook 'linum-relative-mode))

(use-package move-text
  :bind
  ("C-c x d m u" . move-text-bup)
  ("C-c x d m d" . move-text-down))

(use-package anzu
  :diminish anzu-mode
  :init (global-anzu-mode +1)
  :config
  (global-set-key [remap query-replace] 'anzu-query-replace)
  (global-set-key [remap query-replace-regexp] 'anzu-query-replace-regexp))

(use-package goto-chg
  :bind
  ("C-c x d g a" . goto-last-change)
  ("C-c x d g r" . goto-last-change-reverse))

;; (use-package origami
;;   :diminish origami-mode
;;   :after (dash s)
;;   :commands global-origami-mode
;;   :init (global-origami-mode t)
;;   :bind ("C-c x d o" . origami-toggle-node))

;; (use-package vimish-fold
;;   :defer 1
;;   :bind
;;   (:map vimish-fold-folded-keymap ("<tab>" . vimish-fold-unfold)
;;         :map vimish-fold-unfolded-keymap ("<tab>" . vimish-fold-refold))
;;   :init
;;   (setq-default vimish-fold-dir (expand-file-name ".vimish-fold/" user-emacs-directory))
;;   (vimish-fold-global-mode)
;;   :config
;;   (setq-default vimish-fold-header-width 79))

(use-package page-break-lines
  :defer 2
  :diminish page-break-lines-mode
  :init
  (page-break-lines-mode)
  (global-page-break-lines-mode))

;; (use-package whitespace
;;   :demand t
;;   :ensure nil
;;   :hook
;;   ((prog-mode . whitespace-turn-on)
;;    (text-mode . whitespace-turn-on))
;;   :config (setq-default whitespace-style '(face empty tab trailing)))

(use-package expand-region
  :bind
  ("C-+" . er/contract-region)
  ("C-=" . er/expand-region))

(use-package mark-multiple
  :bind ("C-c x d n" . 'mark-next-like-this))

(use-package multiple-cursors
  :defer 2
  ;; :bind
  ;; (("C-S-<mouse-1>" . mc/add-cursor-on-click)
  ;;  ("C-S-c C-S-a" . mc/vertical-align-with-space)
  ;;  ("C-S-c C-S-c" . mc/edit-lines)
  ;;  ("C-S-c C-S-l" . mc/insert-letters)
  ;;  ("C-S-c C-S-n" . mc/insert-numbers)
  ;;  ("C-'" . mc-hide-unmatched-lines-mode))
  :init
  (setq-default
   mc/list-file (expand-file-name ".multiple-cursors.el" user-emacs-directory))
  :config
  (setq-default
   mc/edit-lines-empty-lines 'ignore
   mc/insert-numbers-default 1))

(use-package zzz-to-char
  :ensure t
  :bind ("C-c x d z" . zzz-up-to-char))

(use-package zop-to-char
  :defer 2
  :diminish zop-to-char-mode-line-idle-delay
  :init (global-set-key [remap zap-to-char] 'zop-to-char))

(use-package dumb-jump
  :defer 2
  :diminish dumb-jump-mode
  :bind (("C-c x t d g" . dumb-jump-go)
         ("C-c x t d b" . dumb-jump-back)
         ("C-c x t d q" . dumb-jump-quick-look)))

(use-package focus
  :defer 2
  :diminish focus-mode
  :bind
  (:map focus-mode-map
        ("C-q" . nil))
  :init (focus-mode))

(use-package beacon
  :diminish beacon-mode
  :config (beacon-mode 1))

(use-package dimmer
  :diminish dimmer-mode
  :init (dimmer-mode)
  :config
  (setq dimmer-fraction 0.40))

(use-package open-junk-file)

(use-package ivy
  :diminish ivy-mode
  :bind (("C-x b" . ivy-switch-buffer)
         ;; :map ivy-mini buffer-map
         ;; ("M-y" . ivy-next-line)
         )
  :config
  (ivy-mode 1)
  (setq ivy-use-virtual-buffers t)
  (setq ivy-count-format "%d/%d ")
  (setq ivy-display-style 'fancy))

(use-package counsel
  :diminish counsel-mode
  :bind (("M-x" . counsel-M-x)
         ("M-y" . counsel-yank-pop)
         ;; ("C-c x b r" . counsel-recentf)
         ;; ("C-x C-f" . counsel-find-file)
         ;; ("<f1> f" . counsel-describe-function)
         ;; ("<f1> v" . counsel-describe-variable)
         ;; ("<f1> l" . counsel-find-library)
         ;; ("<f2> i" . counsel-info-lookup-symbol)
         ;; ("<f2> u" counsel-unicode-char)
         ))

(use-package helm
  ;; :config (helm-mode 1)b
  )

(use-package swiper
  :diminish
  :bind (("C-s" . swiper)
         ;; ("C-c x C-r" . ivy-resume)
         )
  :config
  (progn
    (ivy-mode 1)
    (setq ivy-use-virtual-buffers t)
    ;; (setq ivy-display-style fancy)
    ;; (define-key read-expression-map (kbd "C-r") 'counsel-expression-history)
    ))

(use-package ace-link
  :diminish
  :defer 2
  :init
  (ace-link-setup-default))

;; (use-package ace-window
;;   :defer 2
;;   :diminish ace-window-mode
;;   :config
;;   (progn
;;     (setq aw-scope 'frame)
;;     (global-set-key (kbd "C-x O") 'other-frame)
;;     (global-set-key [remap other-window] 'ace-window)
;;     ;; aw-keys
;;     (setq aw-keys '(?a ?s ?d ?f ?g ?h ?j ?k ?l))
;;     (setq aw-background nil)
;;     (custom-set-faces
;;      '(aw-leading-char-face
;;        ((t (:inherit ace-jump-face-foreground :height 3.0)))))
;;     ))

;; (use-package avy
;;   :defer 2
;;   :diminish avy-linum-mode
;;   :bind
;;   ("c-:" . avy-goto-char)   ;; input one char, jump to it with a tree.
;;   ("c-:" . avy-goto-char-2) ;; input two consecutive chars, jump to the first one with a tree.
;;   :config
;;   ;; input zero chars, jump to a line start with a tree.
;;   (global-set-key (kbd "m-g f") 'avy-goto-line)
;;   ;; input one char at word start, jump to a word start with a tree.
;;   (global-set-key (kbd "m-g w") 'avy-goto-word-1)
;;   ;; input zero chars, jump to a word start with a tree.
;;   (global-set-key (kbd "m-g e") 'avy-goto-word-0)
;;   ;; it will bind, for example, avy-isearch to c-' in isearch-mode-map, so that you can select one of the currently visible isearch candidates using avy.
;;   (global-set-key (kbd "c-c c-j") 'avy-resume)
;;   ;; (avy-setup-default)
;;   )

(use-package magit
  :defer 2
  :diminish magit-mode-hook
  :commands magit-status
  :init
  (defadvice magit-status (around magit-fullscreen activate)
    (window-configuration-to-register :magit-fullscreen)
    ad-do-it
    (delete-other-windows))
  :config
  (setq
   git-commit-summary-max-length 50
   magit-push-always-verify nil)

  (defun magit-quit-session ()
    "Restores the previous window configuration and kills the magit buffer"
    (interactive)
    (kill-buffer)
    (jump-to-register :magit-fullscreen))
  :bind
  ("C-x g" . magit-status)
  ("C-x G" . magit-dispatch-popup))

(use-package pdf-tools
  :defer 4
  :diminish pdf-tools-modes
  :init (pdf-tools-install)
  :bind ( :map pdf-view-mode-map
               ("n" . pdf-view-next-line-or-next-page)
               ("p" . pdf-view-previous-line-or-previous-page)
               ("C-n" . pdf-view-next-page-command )
               ("C-p" . pdf-view-previous-page-command)))

;; workaround for pdf-tools not reopening to last-viewed page of the pdf:
;; https://github.com/politza/pdf-tools/issues/18#issuecomment-269515117
(defun brds/pdf-set-last-viewed-bookmark ()
  (interactive)
  (when (eq major-mode 'pdf-view-mode)
    (bookmark-set (brds/pdf-generate-bookmark-name))))

(defun brds/pdf-jump-last-viewed-bookmark ()
  (bookmark-set "fake") ; this is new
  (when
      (brds/pdf-has-last-viewed-bookmark)
    (bookmark-jump (brds/pdf-generate-bookmark-name))))

(defun brds/pdf-has-last-viewed-bookmark ()
  (assoc
   (brds/pdf-generate-bookmark-name) bookmark-alist))

(defun brds/pdf-generate-bookmark-name ()
  (concat "PDF-LAST-VIEWED: " (buffer-file-name)))

(defun brds/pdf-set-all-last-viewed-bookmarks ()
  (dolist (buf (buffer-list))
    (with-current-buffer buf
      (brds/pdf-set-last-viewed-bookmark))))

(add-hook 'kill-buffer-hook 'brds/pdf-set-last-viewed-bookmark)
(add-hook 'pdf-view-mode-hook 'brds/pdf-jump-last-viewed-bookmark)
(unless noninteractive  ; as `save-place-mode' does
  (add-hook 'kill-emacs-hook #'brds/pdf-set-all-last-viewed-bookmarks))

;; Display page numbers
(define-pdf-cache-function pagelabels)

(add-hook 'pdf-view-mode-hook
          (lambda ()
            (setq-local mode-line-position
                        '(" ["
                          (:eval (nth (1- (pdf-view-current-page))
                                      (pdf-cache-pagelabels)))
                          "/"
                          (:eval (number-to-string (pdf-view-current-page)))
                          "/"
                          (:eval (number-to-string (pdf-cache-number-of-pages)))
                          "]"))))

;; [PDFTOOLS End]

(use-package nov
  :diminish
  :init
  (add-to-list 'auto-mode-alist '("\\.epub\\'" . nov-mode))
  :config
  (setq nov-text-width most-positive-fixnum)
  (add-hook 'nov-mode-hook 'visual-line-mode)
  (add-hook 'nov-mode-hook 'visual-fill-column-mode)
  (setq nov-text-width 120
        visual-fill-column-center-text t))

(use-package epresent
  :defer t
  :diminish)

;; (use-package ranger
;;   :bind (:map ranger-normal-mode-map
;;               ("b" . ranger-up-directory)
;;               ("n" . ranger-next-file)
;;               ("p" . ranger-prev-file)
;;               ("f" . ranger-find-file)
;;               ))

;; (use-package dashboard
;;   :diminish dashboard-mode
;;   :init
;;   (dashboard-setup-startup-hook)
;;   :config
;;   (setq dashboard-items '((recents  . 5)))
;;   (setq dashboard-startup-banner 3)
;;   (setq dashboard-items '((recents  . 5)
;; 			  (bookmarks . 5)
;; 			  (projects . 5)
;; 			  (agenda . 5)
;; 			  (registers . 5))))

;; (use-package treemacs
;;   :ensure t
;;   :defer t
;;   :init
;;   (with-eval-after-load 'winum
;;     (define-key winum-keymap (kbd "M-0") #'treemacs-select-window))
;;   :config
;;   (progn
;;     (use-package treemacs-evil
;;       :ensure t
;;       :demand t)
;;     (setq treemacs-change-root-without-asking nil
;;           treemacs-collapse-dirs              (if (executable-find "python") 3 0)
;;           treemacs-file-event-delay           5000
;;           treemacs-follow-after-init          t
;;           treemacs-follow-recenter-distance   0.1
;;           treemacs-goto-tag-strategy          'refetch-index
;;           treemacs-indentation                2
;;           treemacs-indentation-string         " "
;;           treemacs-is-never-other-window      nil
;;           treemacs-never-persist              nil
;;           treemacs-no-png-images              nil
;;           treemacs-recenter-after-file-follow nil
;;           treemacs-recenter-after-tag-follow  nil
;;           treemacs-show-hidden-files          t
;;           treemacs-silent-filewatch           nil
;;           treemacs-silent-refresh             nil
;;           treemacs-sorting                    'alphabetic-desc
;;           treemacs-tag-follow-cleanup         t
;;           treemacs-tag-follow-delay           1.5
;;           treemacs-width                      35)

;;     (treemacs-follow-mode t)
;;     (treemacs-filewatch-mode t)
;;     (pcase (cons (not (null (executable-find "git")))
;;                  (not (null (executable-find "python3"))))
;;       (`(t . t)
;;        (treemacs-git-mode 'extended))
;;       (`(t . _)
;;        (treemacs-git-mode 'simple))))
;;   :bind
;;   (:map global-map
;;         ("C-c x x t t"      . treemacs-toggle)
;;         ("C-c x x t s"      . treemacs-select-window)
;;         ("C-c x x t d"      . treemacs-delete-other-windows)
;;         ;; ("M-m ft"     . treemacs-toggle)
;;         ;; ("M-m fT"     . treemacs)
;;         ;; ("M-m fB"     . treemacs-bookmark)
;;         ;; ("M-m f C-t"  . treemacs-find-file)
;;         ;; ("M-m f M-t"  . treemacs-find-tag)
;;         ))

;; (use-package treemacs-projectile
;;   :defer t
;;   :ensure t
;;   :config
;;   (setq treemacs-header-function #'treemacs-projectile-create-header)
;;   ;; :bind (:map global-map
;;   ;;             ("M-m fP" . treemacs-projectile)
;;   ;;             ("M-m fp" . treemacs-projectile-toggle))
;;   )


;; (use-package neotree
;;   :demand t
;;   :config
;;   (setq neo-theme (if (display-graphic-p) 'icons 'arrow)))

;; (use-package org-pdfview)
;; org-mode links
;; (eval-after-load 'org '(require 'org-pdfview))

;; (add-to-list 'org-file-apps
;;              '("\\.pdf\\'" . (lambda (file link)
;;			       (org-pdfview-open link))))

(use-package emms
  :diminish
  :bind
  ("C-c x x e a" . emms)
  ("C-c x x e b" . emms-smart-browse)
  ("C-c x x e u" . emms-player-mpd-update-all-reset-cache)
  ("C-c x x e c" . emms-playlist-clear)
  ("C-c x x e S" . emms-start)
  ("C-c x x e r" . emms-toggle-repeat-track)
  ("C-c x x e p" . emms-previous)
  ("C-c x x e n" . emms-next)
  ("C-c x x e P" . emms-pause)
  ("C-c x x e U" . mpd-update-database)
  :init
  (add-hook 'after-init-hook #'mpd-start-music-daemon)
  :config
  (emms-all)
  (require 'emms-setup)
  (require 'emms-player-mpd)
  (require 'emms-volume)
  (emms-mode-line nil)  ;; disable minibuffer info
  (emms-playing-time nil) ;; disable track progress timing
  (add-to-list 'emms-info-functions 'emms-info-mpd)
  (add-to-list 'emms-player-list 'emms-player-mpd)
  (setq emms-seek-seconds 5
        emms-volume-change-function 'emms-volume-mpd-change
        emms-browser-default-browse-type 'info-album
        emms-player-list '(emms-player-mpd)
        emms-info-functions '(emms-info-mpd)
        emms-browser-covers 'emms-browser-cache-thumbnail
        emms-player-mpd-server-name "localhost"
        emms-player-mpd-server-port "6600" ;; Setting the default port
        mpc-host "localhost:6600"
        emms-source-file-default-directory "~/Music/"
        ))

;; (use-package helm-emms)

;; (use-package emms-mode-line-cycle
;;   :config
;;   (emms-mode-line-cycle 1)
;;   (custom-set-variables
;;    '(emms-mode-line-cycle-max-width 35)
;;    '(emms-mode-line-cycle-additional-space-num 4)
;;    '(emms-mode-line-cycle-use-icon-p t)
;;    '(emms-mode-line-format " [%s]")
;;    '(emms-mode-line-cycle-any-width-p t)
;;    '(emms-mode-line-cycle-velocity 2)
;;    '(emms-mode-line-cycle-current-title-function
;;      (lambda ()
;;        (let ((track (emms-playlist-current-selected-track)))
;;          (cl-case (emms-track-type track)
;;            ((streamlist)
;;             (let ((stream-name (emms-stream-name
;;                                 (emms-track-get track 'metadata))))
;;               (if stream-name stream-name (emms-track-description track))))
;;            ((url) (emms-track-description track))
;;            (t (file-name-nondirectory
;;                (emms-track-description track)))))))
;;    '(emms-mode-line-titlebar-function
;;      (lambda ()
;;        '(:eval
;;          (when emms-player-playing-p
;;            (format " %s %s"
;;                    (format emms-mode-line-format (emms-mode-line-cycle-get-title))
;;                    emms-playing-time-string)))))))

(defun mpd-start-music-daemon ()
  "Start MPD, connects to it and syncs the metadata cache."
  (interactive)
  (shell-command "mpd")
  (mpd-update-database)
  (emms-player-mpd-connect)
  (emms-cache-set-from-mpd-all)
  (emms-toggle-repeat-playlist)
  (message "MPD Started!"))

;; Killing the daemon from within emacs
(defun mpd-kill-music-daemon ()
  "Stops playback and kill the music daemon."
  (interactive)
  ;; (emms-stop)
  (call-process "mpd" nil nil nil "--kill")
  (message "MPD Killed!"))

;; Updating the database easily.
(defun mpd-update-database ()
  "Updates the MPD database synchronously."
  (interactive)
  (call-process "mpc" nil nil nil "update")
  (message "MPD Database Updated!"))

;; (use-package mpdel
;;   :diminish mpdel-mode
;;   :config (mpdel-mode)
;;   (setq mpdel-prefix-key (kbd "c-. z"))
;;   ;; :bind
;;   ;; ("C-x Z s" . libmpdel-playback-set-volume)
;;   )

;; (use-package libmpdel)

;; (use-package ivy-mpdel)

(use-package auto-dictionary
  :diminish auto-dictionary-mode
  :defer 4
  ;; :diminish auto-dictionary-mode
  :config
  (add-hook 'flyspell-mode-hook (lambda () (auto-dictionary-mode 1))))

(use-package writegood-mode
  :defer 4
  :diminish writegood-mode
  :bind ("C-c x g" . writegood-mode)
  :config
  (add-to-list 'writegood-weasel-words "actionable"))

(use-package typit
  :diminish
  :defer t)

;; (use-package speed-type
;; :defer t)

(use-package define-word
  :defer 4
  :diminish
  :bind
  ("C-c x x d w" . define-word)
  ("C-c x x d a" . define-word-at-point))

(use-package langtool
  :config
  (setq langtool-language-tool-jar "/home/lyr3/Temps/LanguageTool-4.1/languagetool-commandline.jar"
        langtool-default-language "en-US")
  (require 'langtool))

(use-package elfeed
  :diminish
  :defer 3
  :bind (
         ("C-c x x E" . elfeed)
         :map elfeed-show-mode-map
         ("m" . elfeed-play-with-mpv)
         )
  :config
  (setf url-queue-timeout 30)
  (setq-default elfeed-search-filter "@1-week-ago +unread")
  :config
  (setq elfeed-feeds
        '("https://www.fsf.org/static/fsforg/rss/blogs.xml"
          "https://www.fsf.org/static/fsforg/rss/news.xml"
          "https://www.gnu.org/software/guix/news/feed.xml"
          "planet.gnu.org/rss20.xml"
          "http://boilingsteam.com/?feed=rss2"
          "https://www.reddit.com/r/emacs/.rss"
          "https://www.reddit.com/r/gnu/.rss"
          "https://www.reddit.com/r/guile/.rss"
          "https://www.reddit.com/r/C_Programming/.rss"
          "http://feeds.feedburner.com/sachac"
          "https://wingolog.org/feed/atom"
          "http://planet.emacsen.org/atom.xml"
          "http://nullprogram.com/feed/"
          "http://feeds.feedburner.com/SanityInc"
          "http://oremacs.com/atom.xml"
          "http://feeds.feedburner.com/XahsEmacsBlog"
          "https://emacsair.me/feed.xml"
          "http://karl-voit.at/feeds/lazyblorg-all.atom_1.0.links-and-content.xml"
          "https://trivialfis.github.io/feed.xml"
          "http://emacsredux.com/atom.xml"
          "http://feeds.feedburner.com/d0od"
          "https://fuco1.github.io/rss.xml"
          "http://irreal.org/blog/?feed=rss2"
          "http://pragmaticemacs.com/feed/"
          "https://drewdevault.com/feed.xml"
          "http://www.masteringemacs.org/feed/"
          "http://atilanevesoncode.wordpress.com/feed/"
          "http://esr.ibiblio.org/?feed=rss2"
          "http://puri.sm/feed/"
          "https://drewdevault.com/feed.xml"
          "http://feeds.feedburner.com/Phoronix"
          "http://lunduke.com/?feed=rss2"
          "http://vista-se.com.br/feed/"
          "http://ultimosegundo.ig.com.br/rss.xml"
          ))

  (defun elfeed-play-with-mpv ()
    "Play entry link with mpv."
    (interactive)
    (let ((entry (if (eq major-mode 'elfeed-show-mode) elfeed-show-entry (elfeed-search-selected :single)))
          (quality-arg "")
          (quality-val (completing-read "Max height resolution (0 for unlimited): " '("0" "480" "720") nil nil)))
      (setq quality-val (string-to-number quality-val))
      (message "Opening %s with height≤%s with mpv..." (elfeed-entry-link entry) quality-val)
      (when (< 0 quality-val)
        (setq quality-arg (format "--ytdl-format=[height<=?%s]" quality-val)))
      (start-process "elfeed-mpv" nil "mpv" quality-arg (elfeed-entry-link entry))))

  ;; Entries older than 2 weeks are marked as read
  (add-hook 'elfeed-new-entry-hook
            (elfeed-make-tagger :before "2 weeks ago"
                                :remove 'unread)))

(use-package elfeed-goodies
  :defer 3
  :diminish
  :init
  (elfeed-goodies/setup))

;; (use-package elfeed-org
;;   :defer t
;;   :diminish
;;   ;; load elfeed-org
;;   :ensure elfeed-org
;;   :config
;;   ;; initialize elfeed-org
;;   ;; this hooks up elfeed-org to read the configuration when elfeed
;;   ;; is started with =m-x elfeed=
;;   (elfeed-org)
;;   ;; optionally specify a number of files containing elfeed
;;   ;; configuration. if not set then the location below is used.
;;   ;; note: the customize interface is also supported.
;;   (setq rmh-elfeed-org-files (list "~/.emacs.d/etc/elfeed.org")))

(use-package chess
  :defer t
  :diminish)

(use-package pacmacs
  :defer t
  :diminish)

;; (use-package 2048-game
;;   :defer t
;;   :diminish)

(use-package erc
  :ensure nil
  :defer t
  :config

  (add-hook 'window-configuration-change-hook
            '(lambda ()
               (setq erc-fill-column (- (window-width) 2))))
  (add-hook 'erc-mode-hook
            '(lambda ()
               (setq-local scroll-margin 1)))

  (setq erc-rename-buffers t
        erc-track-enable-keybindings nil
        ;; erc-interpret-mirc-color t
        ;; erc-lurker-hide-list '("JOIN" "PART" "QUIT")
        erc-autojoin-channels-alist '(("freenode.net" "#emacs" "#guile" "#guix")) ;; Join the #emacs channels whenever connecting to Freenode.
        erc-rename-buffers t ;; Rename server buffers to reflect the current network name instead of SERVER:PORT
        ))

(use-package erc-hl-nicks)

(use-package rcirc
  :config
  (setq rcirc-default-nick "lyr3")
  (rcirc-track-minor-mode t)
  (add-hook 'rcirc-mode-hook (lambda ()
			       (flyspell-mode 1)
			       (rcirc-omit-mode)
			       ))

  (setq rcirc-server-alist
        '(("irc.freenode.net" :channels ("#emacs"))))

  (setq rcirc-authinfo
        (quote
         (("irc.freenode.net" nickserv "USERNAME" "PASSWORD"))))
  (setq rcirc-buffer-maximum-lines 1000)
  (setq rcirc-default-nick "DEFAULTNICK")
  (setq rcirc-default-user-name "DEFAULTUSERNAME")
  (setq rcirc-log-flag t))


;; (use-package notmuch
;;   :defer t
;;   :diminish  )

;; (use-package w3m
;;   :diminish
;;   :defer 3)

(use-package sudo-edit
   :defer 2
   :diminish
   :bind
   ("C-c x t s" . sudo-edit))

(use-package system-packages)

;; (use-package vkill)

(use-package ripgrep
  :defer 2
  :diminish)

(use-package wgrep
  :ensure t
  :config
  (setq wgrep-auto-save-buffer t                 ;; To save buffer automatically when `wgrep-finish-edit'.
        ;; wgrep-enable-key "r"                  ;; You can change the default key binding to switch to wgrep.
        ;; wgrep-change-readonly-file t          ;; To apply all changes wheather or not buffer is read-only.
        ))

;; (use-package ag
;;   :defer 2
;;   :init
;;   (setq
;;    ag-highlight-search t
;;    ag-reuse-window 't)
;;   :config (add-to-list 'ag-arguments "--word-regexp"))

;; force windows to behave in x way

;; Search init file for bugs
(use-package bug-hunter)

;; always comnnpile packages, and use the newest version available.
(use-package auto-compile
  :diminish auto-compile-mode
  :config
  (auto-compile-on-load-mode)
  (setq load-prefer-newer t))


(use-package shackle
  :diminish shackle-mode
  :init (shackle-mode 1)
  :config
  (setq shackle-rules '(
                        ("*shell*"           :regexp t :align 'below :size 15)
                        ("*eshell*"          :regexp t :align 'below :size 15)
                        ("*Backtrace*"       :regexp t :align 'below :size 20)
                        ("*ripgreg-search*"  :regexp t :align 'below :size 30)
                        ("*Warnings*"        :regexp t :align 'below :size 15)
                        ("*Ibuffer*"         :regexp t :align 'below :size 25)
                        ("*Process List*"    :regexp t :align 'below :size 15)
                        ("*flycheck errors*" :regexp t :align 'below :size 10)
                        ("*python*"          :regexp t :same)
                        ("*undo-tree*"       :regexp t :popup :align 'right)
                        ("*compilation*"     :regexp t :align 'below :size 0.4)
                        )))


;; [MISC]

(use-package engine-mode
  :config
  (engine/set-keymap-prefix (kbd "C-c x t e"))
  (defengine duckduckgo
    "https://duckduckgo.com/?q=%s"
    :keybinding "D"))

(use-package anzu
  :diminish anzu-mode
  :init (global-anzu-mode +1)
  :config
  (set-face-attribute 'anzu-mode-line nil
                      :foreground "yellow" :weight 'bold)
  (custom-set-variables
   '(anzu-mode-lighter "")
   '(anzu-deactivate-region t)
   '(anzu-search-threshold 1000)
   '(anzu-replace-threshold 50)
   '(anzu-replace-to-string-separator " => "))
  (global-set-key [remap query-replace] 'anzu-query-replace)
  (global-set-key [remap query-replace-regexp] 'anzu-query-replace-regexp))

(use-package try
  :diminish
  :defer 2)

(use-package image-file                 ; Visit images as images
  :init (auto-image-file-mode))

(use-package launch                     ; Open files in external programs
  :defer t)

(use-package crux
  :defer 2
  :diminish
  ;; :bind (("C-c x o" . crux-open-with)
  ;;        ("M-o" . crux-smart-open-line)
  ;;        ("C-c x n" . crux-cleanup-buffer-or-region)
  ;;        ("C-c x f" . crux-recentf-ido-find-file)
  ;;        ("C-c x" . crux-indent-defun)
  ;;        ("C-c x u" . crux-view-url)
  ;;        ("C-c x e" . crux-eval-and-replace)
  ;;        ("C-c x w" . crux-swap-windows)
  ;;        ("C-c x D" . crux-delete-file-and-buffer)
  ;;        ("C-c x r" . crux-rename-buffer-and-file)
  ;;        ("C-c x t" . crux-visit-term-buffer)
  ;;        ("C-c x k" . crux-kill-other-buffers)
  ;;        ("C-c x TAB" . crux-indent-rigidly-and-copy-to-clipboard)
  ;;        ("C-c x I" . crux-find-user-init-file)
  ;;        ("C-c x S" . crux-find-shell-init-file)
  ;;        ("s-r" . crux-recentf-ido-find-file)
  ;;        ("s-j" . crux-top-join-line)
  ;;        ("C-^" . crux-top-join-line)
  ;;        ("s-k" . crux-kill-whole-line)
  ;;        ("C-<backspace>" . crux-kill-line-backwards)
  ;;        ("s-o" . crux-smart-open-line-above)
  ;;        ([remap move-beginning-of-line] . crux-move-beginning-of-line)
  ;;        ([(shift return)] . crux-smart-open-line)
  ;;        ([(control shift return)] . crux-smart-open-line-above)
  ;;        ([remap kill-whole-line] . crux-kill-whole-line)
  ;;        ("C-c x s" . crux-ispell-word-then-abbrev))
  )

;; (use-package async
;;   :diminish)

;; (use-package alert
;;   :defer 2
;;   :diminish)

;; (use-package simple
;;   :diminish
;;   :ensure nil
;;   :hook
;;   ((prog-mode . turn-on-auto-fill)
;;    (text-mode . turn-on-auto-fill)))




(use-package diminish
  :diminish (abbrev-mode hs-minor-mode auto-revert-mode eshell-mode smartparens-global-mode))

(use-package auto-package-update
  :defer 4
  :diminish auto-package-update-minor-mode
  ;; :init (auto-package-update-maybe)
  ;; :config (auto-package-update-at-time "09:00")
  )

(use-package restart-emacs
  :defer 2
  :diminish
  :bind
  ("C-c x x r" . restart-emacs)
  ("C-c x x R" . restart-emacs-restore-frames))

(use-package vlf
  :ensure t
  :config
  (require 'vlf-setup))

(use-package prodigy
  :defer 2
  :diminish)

;; always comnnpile packages, and use the newest version available.
(use-package auto-compile
  :diminish auto-compile-mode
  :config
  (auto-compile-on-load-mode)
  (setq load-prefer-newer t))

(use-package free-keys
  :diminish)

;;(use-package perspective
;;:defer 2
;; :diminish
;; :init (persp-mode +1)
;; :bind ("C-c x x p" . persp-switch-last)
;; :config
;; (setq persp-interactive-completion-function #'ido-completing-read)
;; (persp-turn-off-modestring))

;; (use-package persp-projectile
;; :defer 2
;; :diminish
;; :bind ("C-c x x P" . projectile-persp-switch-project))

;; (use-package aria2
;;   :diminish)

;; (use-package popup-kill-ring
;; :bind ("M-y" . popup-kill-ring))

;; (use-package fancy-narrow
;;   :defer 2
;;   :diminish fancy-narrow-mode)


;; (use-package fuzzy
;;   :defer 2)

(use-package org
  :pin org
  :defer 4
  :diminish org-mode-hook
  :bind ("C-c x c" . org-capture)
  ("C-c x l" . org-store-link)
  ("C-c x a" . org-agenda)
  ("C-c x b" . org-switchb)
  :config
  ;; (define-key global-map "\C-c xl" 'org-store-link)
  ;; (defbine-key global-map "\C-c xa" 'org-agenda)
  (setq org-log-done t)
  ;; make tab act as if it were issued in a buffer of the language’s major mode.
  (setq org-src-tab-acts-natively t)
  ;; enable spell-checking in org-mode.
  (add-hook 'org-mode-hook 'flyspell-mode))

;; bullets instead of a list of asterisks
(use-package org-bullets
  :defer 4
  :config
  ;; downward-pointing arrow instead of the usual ellipsis
  (setq org-ellipsis "⤵")
  (setq org-src-fontify-natively t)
  :init
  (add-hook 'org-mode-hook #'org-bullets-mode))

(use-package toc-org
  :config (add-hook 'org-mode-hook 'toc-org-enable))

(use-package htmlize
  :defer 4)

(use-package ox-twbs
  :defer 4)

(use-package org-pdfview
  :defer 4
  :init
  (eval-after-load 'org '(require 'org-pdfview))
  ;;  (add-to-list 'org-file-apps '("\\.pdf\\'" . (lambda (file link) (org-pdfview-open link))))
  )


;; --------------------------------------------------
;; Definitions
;; --------------------------------------------------

(setq org-src-fontify-natively t
      org-default-notes-file "~/dots/emacs/.emacs.d/organize.org"  ;; tell Org where to put captured notes.
      org-src-window-setup 'current-window
      org-src-strip-leading-and-trailing-blank-lines t
      org-src-preserve-indentation t
      org-src-tab-acts-natively t)


(add-hook 'org-mode-hook
          '(lambda ()
             (visual-line-mode 1)))
;; (let*
;;     ((variable-tuple (cond
;;                       ((x-list-fonts "Source Sans Pro") '(:font "Source Sans Pro"))
;;                       ((x-list-fonts "Lucida Grande")   '(:font "Lucida Grande"))
;;                       ((x-list-fonts "Verdana")         '(:font "Verdana"))
;;                       ((x-family-fonts "Sans Serif")    '(:family "Sans Serif"))
;;                       (nil (warn "Cannot find a Sans Serif Font.  Install Source Sans Pro."))))
;;      (base-font-color     (face-foreground 'default nil 'default))
;;      (headline           `(:inherit default :weight normal :foreground ,base-font-color)))

;;   (custom-theme-set-faces 'user
;;                           `(org-level-8 ((t (,@headline ,@variable-tuple))))
;;                           `(org-level-7 ((t (,@headline ,@variable-tuple))))
;;                           `(org-level-6 ((t (,@headline ,@variable-tuple))))
;;                           `(org-level-5 ((t (,@headline ,@variable-tuple))))
;;                           `(org-level-4 ((t (,@headline ,@variable-tuple))))
;;                           `(org-level-3 ((t (,@headline ,@variable-tuple :height 1.33))))
;;                           `(org-level-2 ((t (,@headline ,@variable-tuple :height 1.33))))
;;                           `(org-level-1 ((t (,@headline ,@variable-tuple :height 1.33))))
;;                           `(org-document-title ((t (,@headline ,@variable-tuple :height 1.33 :underline nil))))))

;; (setq org-startup-indented 'f)
;; (setq org-directory "~/org")
;; (setq org-special-ctrl-a/e 't)
;; (setq org-default-notes-file (concat org-directory "/notes.org"))
;; (define-key global-map "\C-c xc" 'org-capture)
;; (setq org-mobile-directory "~/Dropbox/Apps/MobileOrg")
;; (setq org-src-fontify-natively 't)
;; (setq org-src-tab-acts-natively t)
;; (setq org-src-window-setup 'current-window)

(use-package markdown-mode
  :ensure t
  :commands (markdown-mode gfm-mode)
  :mode (("README\\.md\\'" . gfm-mode)
         ("\\.md\\'" . markdown-mode)
         ("\\.markdown\\'" . markdown-mode))
  :init (setq markdown-command "multimarkdown"))


;; (use-package markdown-mode
;;   :ensure t
;;   :config
;;   (progn
;;     (push '("\\.text\\'" . markdown-mode) auto-mode-alist)
;;     (push '("\\.markdown\\'" . markdown-mode) auto-mode-alist)
;;     (push '("\\.md\\'" . markdown-mode) auto-mode-alist)))


(use-package gitignore-mode)

(defun my-cc-mode-hook ()
  "add to cc-mode"
  ;; C-IDE based on https://github.com/tuhdo/emacs-c-ide-demo
  ;; Available C style:
  ;; "gnu": The default style for GNU projects
  ;; "k&r": What Kernighan and Ritchie, the authors of C used in their book
  ;; "bsd": What BSD developers use, aka "Allman style" after Eric Allman.
  ;; "whitesmith": Popularized by the examples that came with Whitesmiths C, an early commercial C compiler.
  ;; "stroustrup": What Stroustrup, the author of C++ used in his book
  ;; "ellemtel": Popular C++ coding standards as defined by "Programming in C++, Rules and Recommendations," Erik Nyquist and Mats Henricson, Ellemtel
  ;; "linux": What the Linux developers use for kernel development
  ;; "python": What Python developers use for extension modules
  ;; "java": The default style for java-mode (see below)
  ;; "user": When you want to define your own style
  ;; (setq c-default-style "gnu")
  ;; (setq gdb-many-windows t ;; use gdb-many-windows by default
  ;; 		gdb-show-main t
  ;; 		c-basic-offset 4
  ;; 		tab-width 4
  ;; 		indent-tabs-mode t)
  (setq c-default-style "gnu"))

(add-hook 'c-mode-common-hook 'my-cc-mode-hook)

(with-eval-after-load 'company
  (add-hook 'c-mode-hook 'company-mode))

(defun flycheck-c-setup ()
  "Flycheck C settings."
  (interactive)
  ;; =(add-to-list 'flycheck-disabled-checkers 'c/c++-clang)
  (setq
   flycheck-gcc-language-standard "gnu99"))

(add-hook 'c-mode-hook #'flycheck-c-setup)

;; Folding
;; (add-hook 'c-mode-common-hook   'hs-minor-mode)

;; (add-hook 'c-mode-common-hook 'c-tools)

;; (defun c-irony ()
;;   "List all avaiable C tools "
;;   (interactive)
;;   (y-or-n-p "Load irony tools? ")
;;   (load "~/.emacs.d/layers/c/irony.el"))

(use-package irony
  :diminish irony-mode
  :config
  (progn
    ;; If irony server was never installed, install it.
    (add-hook 'c-mode-hook 'irony-mode)
    (add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options)
    ;; ;; Use compilation database first, clang_complete as fallback.
    (setq-default irony-cdb-compilation-databases '(irony-cdb-libclang
                                                    irony-cdb-clang-complete))))

(use-package flycheck-irony
  :diminish
  :config
  (progn
    (eval-after-load 'flnycheck
      '(add-hook 'flycheck-mode-hook #'flycheck-irony-setup))))

(use-package company-irony
  :diminish
  :config
  (progn
    (eval-after-load 'company '(add-to-list 'company-backends 'company-irony))))

(use-package company-irony-c-headers
  :diminish
  :config
  (progn
    (eval-after-load 'company
      '(add-to-list
        'company-backends '(company-irony-c-headers company-irony)))
    ))

(use-package irony-eldoc
  :diminish eldoc-mode
  :config
  (progn
    (add-hook 'irony-mode-hook #'irony-eldoc)))

(use-package geiser
  :config
  (setq geiser-active-implementations '(guile))
  (progn
    (eval-after-load 'scheme-mode
      '(add-hook 'run-geiser #'scheme-mode))))

(defun get-dotfiles-open-box ()
  "Download dotfiles from Gitlab, open box.com page"
  (interactive)
  (start-process-shell-command "rm -f ~/Downloads/dots.zip; \ wget -Nc https://gitlab.com/lyr3/dots/-/archive/master/dots-master.zip -O ~/Downloads/dots.zip" nil "rm -f ~/Downloads/dots.zip; wget -Nc https://gitlab.com/lyr3/dots/-/archive/master/dots-master.zip -O ~/Downloads/dots.zip")
  (start-process-shell-command "firefox https://account.box.com/login" nil "firefox https://account.box.com/login"))

(defun hrs/find-file-as-sudo ()
  (interactive)
  (let ((file-name (buffer-file-name)))
    (when file-name
      (find-alternate-file (concat "/sudo::" file-name)))))


(defun copy-line ()
  "abo-abo"
  (interactive)
  (save-excursion
    (back-to-indentation)
    (kill-ring-save
     (point)
     (line-end-position)))
     (message "1 line copied"))

(global-set-key (kbd "C-c x d c") 'copy-line)

(defun hrs/append-to-path (path)
  "Add a path both to the $PATH variable and to Emacs' exec-path."
  (setenv "PATH" (concat (getenv "PATH") ":" path))
  (add-to-list 'exec-path path))


;;------------p--------------------------------------
(defun def-word ()
  "Find definition of the word at point"
  (interactive)
  (browse-url (concat "https://www.merriam-webster.com/dictionary/" (thing-at-point 'word))))

(global-set-key (kbd "C-c x d w") 'def-word)

;; Zap to before char - Just like Vi Copy inside delimiters

;;--------------------------------------------------
(defun zap-to-before-char (arg char)
  "Kill up to and ARGth occurrence of CHAR.
              Case is ignored if `case-fold-search' is non-nil in the current buffer.
              Goes backward if ARG is negative; error if CHAR not found."
  (interactive "p\ncZap to BEFORE char: ")
  ;; Avoid "obsolete" warnings for translation-table-for-input.
  (with-no-warnings
    (if (char-table-p translation-table-for-input)
        (setq char (or (aref translation-table-for-input char) char))))
  (kill-region (point) (progn
                         (search-forward (char-to-string char) nil nil arg)
                         (goto-char (if (> arg 0) (1- (point)) (1+ (point))))
                         (point))))


;; If the *scratch* buffer is killed, recreate it automatically
;; FROM: Morten Welind
;;http://www.geocrawler.com/archives/3/338/1994/6/0/1877802/
;;--------------------------------------------------
(save-excursion
  (set-buffer (get-buffer-create "*scratch*"))
  (lisp-interaction-mode)
  (make-local-variable 'kill-buffer-query-functions)
  (add-hook 'kill-buffer-query-functions 'kill-scratch-buffer))

(defun kill-scratch-buffer ()
  ;; The next line is just in case someone calls this manually
  (set-buffer (get-buffer-create "*scratch*"))
  ;; Kill the current (*scratch*) buffer
  (remove-hook 'kill-buffer-query-functions 'kill-scratch-buffer)
  (kill-buffer (current-buffer))
  ;; Make a brand new *scratch* buffer
  (set-buffer (get-buffer-create "*scratch*"))
  (lisp-interaction-mode)
  (make-local-variable 'kill-buffer-query-functions)
  (add-hook 'kill-buffer-query-functions 'kill-scratch-buffer)
  ;; Since we killed it, don't let caller do that.
  nil)


;; Capitalize word despite where point is (/u/dakra)
;;--------------------------------------------------
(defmacro dakra-define-up/downcase-dwim (case)
  (let ((func (intern (concat "dakra-" case "-dwim")))
        (doc (format "Like `%s-dwim' but %s from beginning when no region is active." case case))
        (case-region (intern (concat case "-region")))
        (case-word (intern (concat case "-word"))))
    `(defun ,func (arg)
       ,doc
       (interactive "*p")
       (save-excursion
         (if (use-region-p)
             (,case-region (region-beginning) (region-end))
           (beginning-of-thing 'symbol)
           (,case-word arg))))))
(dakra-define-up/downcase-dwim "upcase")
(dakra-define-up/downcase-dwim "downcase")
(dakra-define-up/downcase-dwim "capitalize")

(defun mark-sexp-backward (N)
  "Mark word backword"
  (interactive "p")
  (if (and
       (not (eq last-command this-command))
       (not (eq last-command 'my-mark-word)))
      (set-mark (point)))
  (backward-word N))

(defun replace-next-underscore-with-camel (arg)
  (interactive "p")
  (if (> arg 0)
      (setq arg (1+ arg))) ; 1-based index to get eternal loop with 0
  (let ((case-fold-search nil))
    (while (not (= arg 1))
      (search-forward-regexp "\\b_[a-z]")
      (forward-char -2)
      (delete-char 1)
      (capitalize-word 1)
(setq arg (1- arg)))))

(defun dired-dotfiles-toggle ()
  "Dired: Show/hide dot-files"
  (interactive)
  (when (equal major-mode 'dired-mode)
    (if (or (not (boundp 'dired-dotfiles-show-p)) dired-dotfiles-show-p) ; if currently showing
        (progn
          (set (make-local-variable 'dired-dotfiles-show-p) nil)
          (message "h")
          (dired-mark-files-regexp "^\\\.")
          (dired-do-kill-lines))
      (progn (revert-buffer) ; otherwise just revert to re-show
             (set (make-local-variable 'dired-dotfiles-show-p) t)))))

(defun yank-to-x-clipboard ()
  "Terminal x to clipboard workaround"
  (interactive)
  (if (region-active-p)
      (progn
        (shell-command-on-region (region-beginning) (region-end) "xsel -i")
        (message "Yanked region to clipboard!")
        (deactivate-mark))
    (message "No region active; can't yank to clipboard!")))

;; Permit yanking text to X11 clipboard; beats the heck out of
;; manually copying with the cursor.
;; (global-set-key (kbd "C-c x y") 'yank-to-x-clipboard)

;; Improved version of org narrow block. It loads a temporary file in the given major mode
;;--------------------------------------------------

(defun narrow-or-widen-dwim (p)
  "If the buffer is narrowed, it widens. Otherwise, it narrows intelligently.
                Intelligently means: region, org-src-block, org-subtree, or defun,
                whichever applies first.
                Narrowing to org-src-block actually calls `org-edit-src-code'.

                With prefix P, don't widen, just narrow even if buffer is already
                narrowed."
  (interactive "P")
  (declare (interactive-only))
  (cond ((and (buffer-narrowed-p) (not p)) (widen))
        ((region-active-p)
         (narrow-to-region (region-beginning) (region-end)))
        ((derived-mode-p 'org-mode)
         ;; `org-edit-src-code' is not a real narrowing command.
         ;; Remove this first conditional if you don't want it.
         (cond ((org-in-src-block-p)
                (org-edit-src-code)
                (delete-other-windows))
               ((org-at-block-p)
                (org-narrow-to-block))
               (t (org-narrow-to-subtree))))
        (t (narrow-to-defun))))
(define-key ctl-x-map "n b" #'narrow-or-widen-dwim)
(eval-after-load 'org-src
  '(define-key org-src-mode-map
     "\C-x\C-s" #'org-edit-src-exit))

;;--------------------------------------------------
(defun xah-html-url-linkify ()
  "Make the URL at cursor point into a HTML link.
              Work on current non-whitespace char sequence or text selection.

              URL `http://ergoemacs.org/emacs/wrap-url.html'

              Version 2018-03-22"
  (interactive)
  (let ( $p1 $p2 $new-str )
    (if (region-active-p)
        (progn (setq $p1 (region-beginning) $p2 (region-end)))
      (save-excursion
        (skip-chars-backward "^ \n\t")
        (setq $p1 (point))
        (skip-chars-forward "^ \n\t" )
        (setq $p2 (point))))
    (setq $new-str (file-relative-name
                    (replace-regexp-in-string "^file:///" "/" (buffer-substring-no-properties $p1 $p2) t t)))
    (delete-region $p1 $p2)
    (insert (concat "<a href=\"" (url-encode-url $new-str) "\">" $new-str "</a>" ))))


;; --------------------------------------------------

(defun xah-dired-sort ()
  "Sort dired dir listing in different ways.
Prompt for a choice.
URL `http://ergoemacs.org/emacs/dired_sort.html'
Version 2015-07-30"
  (interactive)
  (let ($sort-by $arg)
    (setq $sort-by (ido-completing-read "Sort by:" '( "date" "size" "name" "dir")))
    (cond
     ((equal $sort-by "name") (setq $arg "-Al --si --time-style long-iso "))
     ((equal $sort-by "date") (setq $arg "-Al --si --time-style long-iso -t"))
     ((equal $sort-by "size") (setq $arg "-Al --si --time-style long-iso -S"))
     ((equal $sort-by "dir") (setq $arg "-Al --si --time-style long-iso --group-directories-first"))
     (t (error "logic error 09535" )))
    (dired-sort-other $arg )))

(define-key dired-mode-map (kbd "s") 'xah-dired-sort)

;;--------------------------------------------------
(defun xah-delete-current-file-make-backup (&optional @no-backup-p)
  "Delete current file, makes a backup~, closes the buffer.

              Backup filename is “‹name›~‹date time stamp›~”. Existing file of the same name is overwritten. If the file is not associated with buffer, the backup file name starts with “xx_”.

              When `universal-argument' is called first, don't create backup.

              URL `http://ergoemacs.org/emacs/elisp_delete-current-file.html'
              Version 2016-07-20"
  (interactive "P")
  (let* (
         ($fname (buffer-file-name))
         ($buffer-is-file-p $fname)
         ($backup-suffix (concat "~" (format-time-string "%Y%m%dT%H%M%S") "~")))
    (if $buffer-is-file-p
        (progn
          (save-buffer $fname)
          (when (not @no-backup-p)
            (copy-file
             $fname
             (concat $fname $backup-suffix)
             t))
          (delete-file $fname)
          (message "Deleted. Backup created at 「%s」." (concat $fname $backup-suffix)))
      (when (not @no-backup-p)
        (widen)
        (write-region (point-min) (point-max) (concat "xx" $backup-suffix))
        (message "Backup created at 「%s」." (concat "xx" $backup-suffix))))
    (kill-buffer (current-buffer))))

;; Copyright (C) 2015 ganmacs
;; Author: ganmacs <ganmacs_at_gmail.com>
;; Maintainer: ganmacs <ganmacs_at_gmail.com>
;; URL: https://github.com/ganmacs/emacs-surround
;; Version: 0.0.1

;; This file is NOT part of GNU Emacs.

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.


(defgroup emacs-surround nil
  "surround.vim for Emacs"
  :group 'surround)

(defcustom emacs-surround-alist
  '((""   . (""  . ""))
    ("'"  . ("'" . "'"))
    ("("  . ("(" . ")"))
    ("{"  . ("{" . "}"))
    ("["  . ("[" . "]"))
    ("/"  . ("/" . "/"))
    ("\"" . ("\"" . "\"")))
  "Surround key list."
  :group 'surround)

(defvar emacs-surround-separator "^\s()[]:;,=.\n{}")

(defun emacs-surround-mark-region-line ()
  "Return list which is begening point of line and  end point of line."
  (let ((start (progn (back-to-indentation) (point)))
        (end   (progn (goto-char (line-end-position)) (point))))
    (list start end)))

;; (push-mark (point))

(defun emacs-surround-mark-region-sep ()
  "Return list which is start of symbol and end of symbol."
  (let ((start (progn (skip-chars-backward emacs-surround-separator) (point)))
        (end   (progn (skip-chars-forward emacs-surround-separator) (point))))
    (list start end)))

(defun emacs-surround-same-count-p (str a b)
  "Check that A and B appearing number in STR are same or not."
  (cl-flet ((count-match-str (regex)
                             (with-temp-buffer
                               (insert str)
                               (goto-char (point-min))
                               (count-matches regex))))
    (not (= (count-match-str a)
            (count-match-str b)))))

(defun emacs-surround-quote-p (type)
  "Return quote string or not.
              TYPE is `forward` or `backward`."
  (let ((min (point-at-bol))
        (max (point-at-eol))
        (ppoint (if (eq type 'backward) (point) (- (point) 1))))
    (defun iter (i p)
      (if (and (<= min p) (<= p max))
          (if (= (char-before p) 92) ; backquote
              (iter (+ i 1) (- p 1))
            (= (mod i 2) 1))))
    (iter 0 ppoint)))

(defun emacs-surround-mark-between (prefix suffix)
  "Return list whch in PREFIX point and SUFFIX point."
  (cl-flet ((search-prefix () (search-backward prefix (point-min) nil 1))
            (search-suffix () (search-forward suffix (point-max) nil 1))
            (same-p (s e) (emacs-surround-same-count-p
                           (buffer-substring s e) prefix suffix)))
    (let* ((origin (point))
           (same-surrounds-p (string= prefix suffix)))
      (defun search-prefix-to-suffix ()
        (goto-char origin)
        (let* ((start (progn
                        (search-prefix)
                        (while (unless suffix (emacs-surround-quote-p 'backward)) (search-prefix))
                        (point)))
               (end (progn
                      (forward-char)
                      (search-suffix)
                      (while (if same-surrounds-p
                                 (emacs-surround-quote-p 'forward)
                               (same-p start (point)))
                        (search-suffix))
                      (point))))
          (list start end)))
      (defun search-suffix-to-prefix ()
        (goto-char origin)
        (let* ((end (progn
                      (search-suffix)
                      (while (unless suffix (emacs-surround-quote-p 'forward)) (search-suffix))
                      (point)))
               (start (progn
                        (backward-char)
                        (search-prefix)
                        (while (if same-surrounds-p
                                   (emacs-surround-quote-p 'forward)
                                 (same-p (point) end))
                          (search-prefix))
                        (point))))
          (list start end)))
      (let* ((l1 (search-suffix-to-prefix))
             (l2 (search-prefix-to-suffix))
             (start (min (car l1) (car l2)))
             (end (max (cadr l1) (cadr l2))))
        (list start end)))))

(defun emacs-surround-get-alist (key)
  "Get list by emacs-surround-alit with KEY."
  (cdr (or (assoc key emacs-surround-alist)
           (assoc "" emacs-surround-alist))))

(defun emacs-surround-wrap (str prefix &optional suffix)
  "Wrap STR with PREFIX and SUFFIX(if suffix exists)."
  (concat prefix str (or suffix prefix)))

(defun emacs-surround-replace (str from to)
  "Replace FROM to TO in STR.
              \\(FROM\\)STR\\(FROM\\) -> \\(TO\\)STR\\(TO\\)."
  (let* ((f-prefix (car from)) (f-suffix (cdr from))
         (t-prefix (car to)) (t-suffix (cdr to))
         (regx (format "^%s\\(\\(.\\|\n\\)*\\)%s$" f-prefix f-suffix)))
    (if (string-match regx str)
        (let ((match (match-string 1 str)))
          (emacs-surround-wrap match t-prefix t-suffix)))))

(defun emacs-surround-cut-region (region)
  "Cut region REGION car to REGION cdar."
  (apply 'buffer-substring region))

(defun emacs-surround-region-list (fn)
  "If 'mark-active then region list else call FN and return list."
  (if (use-region-p)
      (list (region-beginning) (region-end))
    (funcall fn)))

(defun emacs-surround-helper (mark-fn prefix suffix)
  "Helper function emacs-surround (inset|delte|line|change).
              MARK-FN is regioning function.
              PREFIX and SUFFIX are replace string."
  (let ((now (point)))
    (let* ((region (emacs-surround-region-list mark-fn))
           (target-str (emacs-surround-cut-region region))
           (replaced-str (emacs-surround-replace
                          target-str
                          (emacs-surround-get-alist prefix)
                          (emacs-surround-get-alist suffix))))
      (if replaced-str
          (progn
            (apply 'delete-region region)
            (insert replaced-str)
            (goto-char now))
        (message "not found prefix and suffix")))))

(defun emacs-surround-insert (str)
  "Insert surround string, STR."
  (emacs-surround-helper 'emacs-surround-mark-region-sep "" str))

(defun emacs-surround-delete (str)
  "Delete surround string, STR."
  (let ((s (emacs-surround-get-alist str)))
    (emacs-surround-helper (lambda () (emacs-surround-mark-between (car s) (cdr s)))
                           str "")))

(defun emacs-surround-line (str)
  "Wrap line with STR."
  (emacs-surround-helper 'emacs-surround-mark-region-line "" str))

(defun emacs-surround-change (to end)
  "Change surround string TO into END."
  (let ((s (emacs-surround-get-alist to)))
    (emacs-surround-helper (lambda () (emacs-surround-mark-between (car s) (cdr s)))
                           to end)))

              ;;;###autoload
(defun emacs-surround ()
  "Surround or Delete symbol etc.
              if cmd1 is i(insert), surround at-point-symbol.
              if cmd1 is d(delete), delete surround cmd2 char.
              if cmd1 is l(line), surround line which point is here.
              else change surround cmd1 to cmd2"
  (interactive)
  (let* ((cmd1 (char-to-string (read-char)))
         (_cmd2 (read-char))
         (cmd2 (char-to-string _cmd2)))
    (cond ((string= cmd1 "i") (emacs-surround-insert cmd2))
          ((string= cmd1 "d") (emacs-surround-delete cmd2))
          ((string= cmd1 "l") (emacs-surround-line cmd2))
          (t (if (= 13 _cmd2)              ;return
                 (emacs-surround-insert cmd1)
               (emacs-surround-change cmd1 cmd2))))))

(provide 'emacs-surround)
