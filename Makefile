# 環境定数
WORKSPACE = ./SwiftDexTCA/SwiftDexTCA.xcworkspace
SPM_CLI_COMMON_PATH := Tools/Common/.build/release

.PHONY: bootstrap
bootstrap:
	@echo "🔧 Running 'make bootstrap' to set up the project..."
	${SPM_CLI_COMMON_PATH}/mint bootstrap

.PHONY: build spm cli tools
build-spm-cli-tools: ## build Swift Package Manager cli tools
	xcrun --sdk macosx swift build -c release --package-path ./Tools/Common --product mint

# ワークスペースを開く
.PHONY: open
open: ## Open xcworkspace
	open $(WORKSPACE)
