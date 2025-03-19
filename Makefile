# 環境定数
WORKSPACE = ./SwiftDexTCA/SwiftDexTCA.xcworkspace
SCHEME = SwiftDexTCA

# 初期セットアップ
.PHONY: bootstrap
bootstrap:
	@echo "🔧 Running 'make bootstrap' to set up the project..."
	# Xcode の依存関係を解決
	xcodebuild -resolvePackageDependencies -workspace $(WORKSPACE) -scheme $(SCHEME)
	@echo "✅ Bootstrap complete!"
# ワークスペースを開く
.PHONY: open
open: ## Open xcworkspace
	open $(WORKSPACE)
