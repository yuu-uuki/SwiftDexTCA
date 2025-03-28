#!/bin/bash

echo "SwiftLint"
# 定義されているパスを変数に
SPM_CLI_COMMON_PATH="Tools/Common/.build/release"
LINT_RULES_PATH=".swiftlint.yml"

# SwiftLintを実行する
xcrun --sdk macosx ${SPM_CLI_COMMON_PATH}/mint run swiftlint --config ${LINT_RULES_PATH}
