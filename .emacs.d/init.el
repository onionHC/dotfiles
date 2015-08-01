
;----------------------------------------------------------------------
; フォントの設定
;----------------------------------------------------------------------



;(set-face-attribute 'default nil :family "Migu 1M" :height 105);height 105
;(set-face-attribute 'fixed-pitch    nil :family "Migu 1M" :height 105)
;(set-face-attribute 'variable-pitch nil :family "Migu 1M" :height 105)

;-------------------------------------------------------------------
;ロードパスを追加する
;-------------------------------------------------------------------
(defun add-to-load-path (&rest paths)
  (let (path)
    (dolist (path paths paths)
      (let ((default-directory
	      (expand-file-name (concat user-emacs-directory path))))
	(add-to-list 'load-path default-directory)
	(if (fboundp 'normal-top-level-add-subdirs-to-load-path)
	    (normal-top-level-add-subdirs-to-load-path))))))

(add-to-load-path "elisp" "conf" "public_repos" "auto-save-list" 
		  "elpa" "etc" "hown" "info" "auto-install")
;-------------------------------------------------------------------
;日本語コードの設定
;-------------------------------------------------------------------
(set-language-environment               'Japanese)
(set-keyboard-coding-system             'utf-8)
(set-terminal-coding-system             'utf-8)
(set-buffer-file-coding-system          'utf-8)

;-------------------------------------------------------------------
; GNU Global
;-------------------------------------------------------------------
;(quelpa 'gtags)
(autoload 'gtags-mode "gtags" "" t)
(setq gtags-mode-hook
      '(lambda ()
         (local-set-key "\M-t" 'gtags-find-tag)
         (local-set-key "\M-r" 'gtags-find-rtag)
         (local-set-key "\M-s" 'gtags-find-symbol)
         (local-set-key "\M-p" 'gtags-pop-stack)
         ))
(add-hook 'c-mode-common-hook
          '(lambda()
             (gtags-mode 1)
             (gtags-make-complete-list)
             ))

;-------------------------------------------------------------------
; YaTex
;-------------------------------------------------------------------
(setq auto-mode-alist
      (cons (cons "\\.tex$" 'yatex-mode) auto-mode-alist))
(autoload 'yatex-mode "yatex" "Yet Another LaTeX mode" t)
(setq YaTeX-kanji-code 4)
(setq tex-command "platex")
(setq dvi2-command "pxdvi -geo 1268x940+0+0 -s 5")
(setq dviprint-command-format "dvipdfmx %s")

;-------------------------------------------------------------------
;howmの設定
;-------------------------------------------------------------------
;; howmメモ保存の場所
(setq howm-directory (concat user-emacs-directory "hown"))
;; howm-menuの言語を日本語に
(setq howm-menu-lang 'ja)
;; howmメモを1日1ファイルにする
(setq howm-file-name-format "%Y/%m/%Y-%m-%d.howm")
;; howm-modeで読み込む
(when (require 'howm-mode nil t)
  ;; C-c,,でhowm-menuを起動
  (define-key global-map (kbd "C-c ,,") 'howm-menu))

;-------------------------------------------------------------------
;org-mode
;-------------------------------------------------------------------
(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(global-font-lock-mode t)                    

;; org-plantuml-jar-path は plantuml.jar へのパス
(setq org-plantuml-jar-path "d:/cygwin/home/potato/.emacs.d/plantuml.jar")
(defun org-mode-init ()
  (org-babel-do-load-languages
   'org-babel-load-languages
   (add-to-list 'org-babel-load-languages '(plantuml . t))))
(add-hook 'org-mode-hook 'org-mode-init)
;-------------------------------------------------------------------
;auto-complete
;-------------------------------------------------------------------
(require 'auto-complete)
(global-auto-complete-mode t)

;-------------------------------------------------------------------
;install-elisp
;-------------------------------------------------------------------
;; install-elisp のコマンドを使える様に。
(require 'install-elisp)
;; Elisp ファイルをインストールする場所を指定。
(setq install-elisp-repository-directory "d:/cygwin/home/potato/.emacs.d/elisp/")

;-------------------------------------------------------------------
;auto-install
;-------------------------------------------------------------------
(require 'auto-install)
(setq auto-install-directory "d:/cygwin/home/potato/.emacs.d/auto-install/")
(auto-install-update-emacswiki-package-name t)
(auto-install-compatibility-setup)

;-------------------------------------------------------------------
;anything
;-------------------------------------------------------------------
(require 'anything)
(require 'anything-config)
(add-to-list 'anything-sources 'anything-c-source-emacs-commands)
(define-key global-map (kbd "C-;") 'anything)

;;describe-bindings
(require 'descbinds-anything)
(descbinds-anything-install)
;-------------------------------------------------------------------
;フレームの設定
;-------------------------------------------------------------------
(setq default-frame-alist 
      (append (list '(cursor-color . "darkred")
		    '(width . 159)  ;; ウィンドウ幅 
		    '(height . 60) ;; ウィンドウの高さ
		    '(top . 0)     ;; 表示位置
		    '(left . 600)  ;; 表示位置
		    '(background-color . "black")
		    '(foreground-color . "white")
		    '(cursor-color . "lightsteelblue"))
		    default-frame-alist))

;-------------------------------------------------------------------
;パッケージを有効にする
;-------------------------------------------------------------------
(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/package/") t)
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/package/"))
(package-initialize)
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
;(if (require 'quelpa nil t)
;    (quelpa-self-upgrade)
;  (with-temp-buffer
;    (url-insert-file-contents "https://raw.github.com/quelpa/quelpa/master/bootstrap.el")
;    (eval-buffer)))
(require 'package) ;; You might already have this line
;(add-to-list 'package-archives
;             '("melpa" . "http://melpa.org/packages/") t)
;(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/package/") t)
(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))
(package-initialize) ;; You might already have this line
(add-to-list 'package-archives
             '("melpa-stable" . "http://stable.melpa.org/packages/") t)
;-------------------------------------------------------------------
;popup-select-window 動作しないのでoff
;-------------------------------------------------------------------
;(global-set-key "\C-xo" 'popup-select-window)
;(setq popup-select-window-popup-window 2)
;(setq popup-select-window-window-highlight-face '(:foreground "white" :background "orange"))

;-------------------------------------------------------------------
;csharp-mode
;-------------------------------------------------------------------
(require 'csharp-mode)
(add-hook 'csharp-mode-hook
          '(lambda ()
             (setq indent-tabs-mode nil)
             (setq c-basic-offset 4)
             (c-set-offset 'substatement-open 0)
             (flycheck-mode 1)
             (omnisharp-mode)))
;(quelpa 'csharp-mode)
;(quelpa 'omnisharp)
(require 'omnisharp)
(setq omnisharp-server-executable-path (expand-file-name "/path/to/OmniSharp/bin/Debug/OmniSharp.exe"))
(add-hook 'csharp-mode-hook 'omnisharp-mode)

(require 'flycheck)
(setq flycheck-check-syntax-automatically '(mode-enabled save idle-change))
(setq flycheck-idle-change-delay 2)

;-------------------------------------------------------------------
;multiple-cursors, expand-region, smartrep
;-------------------------------------------------------------------
;(require 'expand-region)
;(quelpa 'multiple-cursors)
;(require 'smartrep)
;
;(global-set-key (kbd "C-,") 'er/expand-region)
;(global-set-key (kbd "C-M-,") 'er/contract-region)
;
;(declare-function smartrep-define-key "smartrep")
;(global-set-key (kbd "C-M-c") 'mc/edit-lines)
;(global-unset-key "\C-t")
;(smartrep-define-key global-map "C-t"
;  '(("C-t"      . 'mc/mark-next-like-this)
;    ("n"        . 'mc/mark-next-like-this)
;    ("p"        . 'mc/mark-previous-like-this)
;    ("m"        . 'mc/mark-more-like-this-extended)
;    ("u"        . 'mc/unmark-next-like-this)
;    ("U"        . 'mc/unmark-previous-like-this)
;    ("s"        . 'mc/skip-to-next-like-this)
;    ("S"        . 'mc/skip-to-previous-like-this)
;    ("*"        . 'mc/mark-all-like-this)
;    ("d"        . 'mc/mark-all-like-this-dwim)
;    ("i"        . 'mc/insert-numbers)
;    ("o"        . 'mc/sort-regions)
;    ("O"        . 'mc/reverse-regions)))

(require 'multiple-cursors)
(require 'smartrep)
 
(declare-function smartrep-define-key "smartrep")

;; 入力した文字列にマッチするリージョン内の部分をマークする
(global-set-key (kbd "C-M-c") 'mc/mark-all-in-region)

;; 入力した正規表現にマッチするリージョン内の部分をマークする
(global-set-key (kbd "C-M-r") 'mc/mark-all-in-region-regexp)

(global-unset-key (kbd "C-t"))

(smartrep-define-key global-map "C-t"
  '(("C-t" . 'mc/mark-next-like-this)
    ("C-n" . 'mc/mark-next-like-this)
    ("C-p" . 'mc/unmark-next-like-this)
    ("C-u" . 'mc/unmark-next-like-this)
    ("C-s" . 'mc/skip-to-next-like-this)
    ("C-*" . 'mc/mark-all-like-this)
    ("C-d" . 'mc/mark-all-like-this-dwim)
    ("C-i" . 'mc/insert-numbers)
    ;; 以降の設定の Metaキー は、ESC 以外のキーを利用すること
    ("M-n" . 'mc/next-logical-line)
    ("M-p" . 'mc/previous-logical-line)
    ("M-f" . 'forward-char)
    ("M-b" . 'backward-char)
    ("C-v" . 'scroll-up-command)
    ("M-v" . 'scroll-down-command)
    ("C-l" . 'recenter-top-bottom)
    ;; IM の切替えコマンドを指定する
    ("C-o" . 'toggle-input-method)))

;; IM の切替えコマンドを追加する
(add-to-list 'mc--default-cmds-to-run-once 'toggle-input-method)

(defun mc/last-command-check ()
  (memq last-command '(mc/next-logical-line
                       mc/previous-logical-line
                       mc/mark-next-like-this
                       mc/unmark-next-like-this
                       mc/skip-to-next-like-this)))

(defun mc/next-logical-line (&optional arg try-vscroll)
  (interactive "^p\np")
  (if (mc/last-command-check)
      (let ((last-command 'next-line))
        (next-logical-line arg try-vscroll))
    (next-logical-line arg try-vscroll)))

(defun mc/previous-logical-line (&optional arg try-vscroll)
  (interactive "^p\np")
  (if (mc/last-command-check)
      (let ((last-command 'previous-line))
        (previous-logical-line arg try-vscroll))
    (previous-logical-line arg try-vscroll)))

(defadvice mc/mark-next-like-this (around ad-first-mc/mark-next-like-this first activate)
  (if (mc/last-command-check)
      (let ((last-command 'next-line))
        ad-do-it)
    ad-do-it))

(defadvice mc/mark-next-like-this (around ad-last-mc/mark-next-like-this last activate)
  (if (region-active-p)
      ad-do-it
    (if (< arg 0)
        (let ((cursor (car (mc/all-fake-cursors))))
          (if cursor
              (progn
                (goto-char (overlay-get cursor 'point))
                (mc/remove-fake-cursor cursor))
            (error "No cursors to be unmarked"))
          (mc/maybe-multiple-cursors-mode))
      ad-do-it)))

(defadvice mc/skip-to-next-like-this (around ad-mc/skip-to-next-like-this activate)
  (if (region-active-p)
      ad-do-it
    (mc/next-logical-line)))

;; smartrepによるコマンド実行中はキー入力をエコーしない
;; http://shakenbu.org/yanagi/d/?date=20140105
(defadvice smartrep-map-internal (around ad-smartrep-map-internal activate)
  (let ((echo-keystrokes 0))
    ad-do-it))
;-------------------------------------------------------------------
;各種設定
;-------------------------------------------------------------------
;; 起動時の画面はいらない
(setq inhibit-startup-message t)

;;バックスペース
(global-set-key "\C-h" 'delete-backward-char)

;;カーソル前の1語を削除する
(global-set-key (kbd "M-h") 'backward-kill-word)

;;常にバッファ左に行番号を表示
(global-linum-mode t)
;;行番号の表示領域として、4ケタ分をあらかじめ確保する
(setq linum-format "%4d")

;;最近使ったファイルを記録する
(require 'recentf)
(setq recentf-save-file "~/.recentf")
(setq recentf-exclude '("~/.recentf"))
(setq recentf-max-saved-items 5000)
(setq recentf-auto-cleanup '10)
(run-with-idle-timer 600 t 'recentf-save-list)
(recentf-mode t)

;; Ctrl+Retでコピーリージョンのセット
(global-set-key [C-return] 'set-mark-command)

;; ライン数の表示
(line-number-mode   t)

;; Ctrl+x Ctrl+gでジャンプ
(global-set-key "\C-x\C-g" 'goto-line)

;;Ctrl-上下キーで分割したウィンドウの大きさを変える
(global-set-key [(ctrl up)] '(lambda (arg)(interactive "p")(enlarge-window arg)))
(global-set-key [(ctrl down)] '(lambda (arg)(interactive "p")(shrink-window arg)))
(global-set-key [(ctrl right)] '(lambda (arg)(interactive "p")(enlarge-window-horizontally arg)))
(global-set-key [(ctrl left)] '(lambda (arg)(interactive "p")(shrink-window-horizontally arg)))

;;対応する括弧を強調表示する
(show-paren-mode t)

;;重複する履歴は保存しない
(setq history-delete-duplicates t)
(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(scroll-bar-mode (quote right))
 '(tool-bar-mode nil)
 '(tooltip-mode nil))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 )

; server start for emacs-client
(require 'server)
(unless (server-running-p)
  (server-start))

;(require 'smooth-scroll)
;(smooth-scroll-mode t)												      ..
