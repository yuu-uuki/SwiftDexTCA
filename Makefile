# 環境定数
WORKSPACE = ./SwiftDexTCA/SwiftDexTCA.xcworkspace
SCHEME = SwiftDexTCA
PACKAGE_PATH = ./SwiftDexTCA/Packages/DataStore
BUILD_CONFIG = release

# 初期ビルド
.PHONY: bootstrap
bootstrap:
	@echo "Running 'make bootstrap' before committing to ensure dependencies are resolved and built."
	# 初期ビルド（オプション）
	xcodebuild clean -workspace $(WORKSPACE) -scheme $(SCHEME)
	# 依存関係が正常に解決されたかの確認（オプション）
	swift build -c $(BUILD_CONFIG) --package-path $(PACKAGE_PATH)

# ワークスペースを開く
.PHONY: open
open: ## Open xcworkspace
	open $(WORKSPACE)
