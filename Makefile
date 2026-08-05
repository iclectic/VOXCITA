.PHONY: help setup run build-runner watch format analyze test test-all clean android ios release

help: ## Show this help
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'

setup: ## Install dependencies and generate code
	flutter pub get
	dart run build_runner build --delete-conflicting-outputs

run: ## Run the app in debug mode
	flutter run

build-runner: ## Run code generation
	dart run build_runner build --delete-conflicting-outputs

watch: ## Watch mode for code generation
	dart run build_runner watch --delete-conflicting-outputs

format: ## Format all Dart files
	dart format .

analyze: ## Run static analysis
	flutter analyze --fatal-infos

test: ## Run all tests
	flutter test

test-all: ## Run format, analyze and tests
	dart format --set-exit-if-changed .
	flutter analyze --fatal-infos
	flutter test

clean: ## Clean build artifacts
	flutter clean
	rm -rf build/

android: ## Build release APK
	flutter build apk --release --split-per-abi

ios: ## Build release iOS
	flutter build ios --release --no-codesign

release: ## Prepare a release (run checks then build)
	@echo "Running pre-release checks..."
	dart format --set-exit-if-changed .
	flutter analyze --fatal-infos
	flutter test
	@echo "Building Android APK..."
	flutter build apk --release --split-per-abi
	@echo "Build complete. APK files in build/app/outputs/flutter-apk/"
	@echo "To create a release, tag and push: git tag v0.x.x && git push origin v0.x.x"
