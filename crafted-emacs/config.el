;;; example-config.el -- Example Crafted Emacs user customization file -*- lexical-binding: t; -*-

;;; Commentary:
;;
;; Crafted Emacs supports user customization through a `config.el' file
;; similar to this one.  You can copy this file as `config.el' to your
;; Crafted Emacs configuration directory as an example.
;;
;; In your configuration you can set any Emacs configuration variable, face
;; attributes, themes, etc as you normally would.
;;
;; See the README.org file in this repository for additional information.

;;; Code:
;; At the moment, Crafted Emacs offers the following modules.
;; Comment out everything you don't want to use.
;; At the very least, you should decide whether or not you want to use
;; evil-mode, as it will greatly change how you interact with Emacs.
;; So, if you prefer Vim-style keybindings over vanilla Emacs keybindings
;; remove the comment in the line about `crafted-evil' below.
(require 'crafted-defaults)    ; Sensible default settings for Emacs
(require 'crafted-updates)     ; Tools to upgrade Crafted Emacs
(require 'crafted-completion)  ; selection framework based on `vertico`
;; (require 'crafted-ui)          ; Better UI experience (modeline etc.)
(require 'crafted-windows)     ; Window management configuration
(require 'crafted-editing)     ; Whitspace trimming, auto parens etc.
                                        ;(require 'crafted-evil)        ; An `evil-mode` configuration
                                        ;(require 'crafted-org)         ; org-appear, clickable hyperlinks etc.
                                        ;(require 'crafted-project)     ; built-in alternative to projectile
(require 'crafted-speedbar)    ; built-in file-tree
                                        ;(require 'crafted-screencast)  ; show current command and binding in modeline
(require 'crafted-compile)     ; automatically compile some emacs lisp files

;; Set the default face. The default face is the basis for most other
;; faces used in Emacs. A "face" is a configuration including font,
;; font size, foreground and background colors and other attributes.
;; The fixed-pitch and fixed-pitch-serif faces are monospace faces
;; generally used as the default face for code. The variable-pitch
;; face is used when `variable-pitch-mode' is turned on, generally
;; whenever a non-monospace face is preferred.
(add-hook 'emacs-startup-hook
          (lambda ()
            (custom-set-faces
             `(default ((t (:font "MonoLisa Nasy-16" "CodeNewRoam Nerd Font Mono-16"))))
             `(fixed-pitch ((t (:inherit (default)))))
             `(fixed-pitch-serif ((t font-spec :family "CMU Typewriter Text" :size 22 )))
             `(variable-pitch ((t font-spec :family "CMU Typewriter Text" :size 22 )))
             )))


;; Themes are color customization packages which coordinate the
;; various colors, and in some cases, font-sizes for various aspects
;; of text editing within Emacs, toolbars, tabbars and
;; modeline. Several themes are built-in to Emacs, by default,
;; Crafted Emacs uses the `deeper-blue' theme. Here is an example of
;; loading a different theme from the venerable Doom Emacs project.
(crafted-package-install-package 'doom-themes)
(progn
  (disable-theme 'deeper-blue)          ; first turn off the deeper-blue theme
  (load-theme 'doom-solarized-light t))       ; load the doom-palenight theme

(customize-set-variable 'crafted-startup-inhibit-splash t)

(setq use-package-always-ensure t
      use-package-expand-minimally t)

;; To not load `custom.el' after `config.el', uncomment this line.
;; (setq crafted-load-custom-file nil)

(add-to-list 'load-path "~/crafted-emacs/crafted-emacs/lisp/")

(quelpa
 '(quelpa-use-package
   :fetcher git
   :url "https://github.com/quelpa/quelpa-use-package.git"))
(require 'quelpa-use-package)


(defcustom my-org-directory (expand-file-name "~/Org/")
  "Org file"
  :type '(string))

(require 'init-base)
;; lang
(require 'init-web)
(require 'init-org)
(require 'init-python)
(require 'init-clojure)
(require 'init-zig)
(require 'init-markdown)

;; editor
(require 'init-meow)
(require 'init-rime)
(require 'init-format)
(require 'init-tools)

;; IDE
(require 'init-completion)
(require 'init-lsp)
(require 'init-flycheck)
(require 'init-copilot)

;; project
(require 'init-dirvish)
(require 'init-git)
(require 'init-project)

;; ui
(require 'init-ui)
(require 'init-highlight)
(require 'init-window)

;;;
