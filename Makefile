
.PHONY: bootstrap
bootstrap:
	@echo "Running 'make bootstrap' before committing to ensure dependencies are resolved and built."
	# 初期ビルド（オプション）
	xcodebuild clean -workspace ./SwiftDexTCA/SwiftDexTCA.xcworkspace -scheme SwiftDexTCA
	# 依存関係が正常に解決されたかの確認（オプション）
	swift build -c release --package-path ./SwiftDexTCA/Packages/DataStore
