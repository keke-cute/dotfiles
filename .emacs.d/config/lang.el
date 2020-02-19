;; 预先下载基本的语言支持
(straight-use-package 'haskell-mode)
(straight-use-package 'typescript-mode)
;; C++ 和 TypeScript 的 LSP 配置
(straight-use-package 'lsp-mode)
(use-package lsp-mode
  :commands (lsp lsp-deferred)
  ;; 除了这一条，其他均为C++的LSP 配置，因为已在ccls 中 hook C++ mode,所以不需要在此处hook，此处只是hook 了ts,删除ts 支持删这条即可
  :hook (typescript-mode . lsp-deferred))

(straight-use-package 'lsp-ui)
(use-package lsp-ui
  :commands lsp-ui-mode)

(straight-use-package 'company-lsp)
(use-package company-lsp
  :commands company-lsp)

(straight-use-package 'ccls)
(use-package ccls
  :hook ((c-mode c++-mode objc-mode cuda-mode) .
         (lambda () (require 'ccls) (lsp))))
(setq ccls-executable "~/ccls/Release/ccls")

(provide 'lang)
