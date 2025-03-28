# 環境定数
WORKSPACE = ./SwiftDexTCA/SwiftDexTCA.xcworkspace
SCHEME = SwiftDexTCA
SPM_CLI_COMMON_PATH := Tools/Common/.build/release

# 初期セットアップ
.PHONY: bootstrap
bootstrap:
	@echo "🔧 Running 'make bootstrap' to set up the project..."
	make copy-lint-rule
	${SPM_CLI_COMMON_PATH}/mint bootstrap

.PHONY: build spm cli tools
build-spm-cli-tools: ## build Swift Package Manager cli tools
	xcrun --sdk macosx swift build -c release --package-path ./Tools/Common --product mint

.PHONY: lint all
lint-all: ## Run SwiftLint on the project
	@echo "🚀 Running SwiftLint..."
	sh scripts/swift-lint/all.sh
	@echo "✅ SwiftLint complete!"

# ワークスペースを開く
.PHONY: open
open: ## Open xcworkspace
	open $(WORKSPACE)
