.PHONY: help setup android-setup chrome-setup flutter-setup install clean doctor licenses

help:
	@echo "Flutter Lyra Project Makefile"
	@echo "============================="
	@echo "Available targets:"
	@echo "  setup           - Complete setup (install all dependencies)"
	@echo "  android-setup   - Setup Android SDK and tools"
	@echo "  chrome-setup    - Install Chromium browser"
	@echo "  flutter-setup   - Setup Flutter environment"
	@echo "  install         - Get Flutter dependencies (flutter pub get)"
	@echo "  doctor          - Run flutter doctor"
	@echo "  licenses        - Accept Android SDK licenses"
	@echo "  clean           - Clean build artifacts"
	@echo "  help            - Show this help message"

# Complete setup
setup: chrome-setup android-setup flutter-setup licenses install firebase-setup doctor
	@echo "✓ Setup complete!"

# Install Chromium browser
chrome-setup:
	@echo "Installing Chromium browser..."
	@sudo apt-get update > /dev/null 2>&1
	@sudo apt-get install -y chromium > /dev/null 2>&1
	@echo "export CHROME_EXECUTABLE=/usr/bin/chromium" >> ~/.bashrc
	@echo "✓ Chromium installed and CHROME_EXECUTABLE set"

# Setup Android SDK
android-setup:
	@echo "Setting up Android SDK..."
	@mkdir -p ~/Android/cmdline-tools
	@if [ ! -f ~/Android/cmdline-tools/tools/bin/sdkmanager ]; then \
		echo "Downloading Android command-line tools..."; \
		cd ~/Android/cmdline-tools && \
		wget -q https://dl.google.com/android/repository/commandlinetools-linux-10406996_latest.zip -O cmdlinetools.zip && \
		unzip -q cmdlinetools.zip && \
		rm cmdlinetools.zip && \
		mv cmdline-tools tools; \
	fi
	@mkdir -p ~/Android/cmdline-tools/latest && cp -r ~/Android/cmdline-tools/tools/* ~/Android/cmdline-tools/latest/ 2>/dev/null || true
	@echo "export ANDROID_HOME=$$HOME/Android" >> ~/.bashrc
	@echo "export PATH=$$PATH:$$ANDROID_HOME/cmdline-tools/tools/bin:$$ANDROID_HOME/platform-tools" >> ~/.bashrc
	@flutter config --android-sdk $$HOME/Android 2>/dev/null || true
	@bash -i -c "yes | sdkmanager 'platforms;android-36' 'build-tools;28.0.3' 'platform-tools'" > /dev/null 2>&1
	@echo "✓ Android SDK configured"

# Setup Flutter environment
flutter-setup:
	@echo "Setting up Flutter environment..."
	@source ~/.bashrc
	@echo "✓ Flutter environment ready"

# Accept Android licenses
licenses:
	@echo "Accepting Android SDK licenses..."
	@bash -i -c "yes | ~/Android/cmdline-tools/tools/bin/sdkmanager --licenses" > /dev/null 2>&1
	@echo "✓ Android licenses accepted"

# Get Flutter dependencies
install:
	@echo "Installing Flutter dependencies..."
	flutter pub get
	@echo "✓ Dependencies installed"

firebase-setup:
	@echo "Setting up Firebase CLI..."
	@chmod +x ./fire.sh && ./fire.sh
	@dart pub global activate flutterfire_cli
	@firebase login && flutterfire configure
	@echo "export PATH=$$PATH:$$HOME/.pub-cache/bin" >> ~/.bashrc
	@source ~/.bashrc
	@echo "✓ Firebase CLI installed"

# Run flutter doctor
doctor:
	@echo "Running flutter doctor..."
	@bash -i -c "flutter doctor"

# Clean build artifacts
clean:
	@echo "Cleaning build artifacts..."
	flutter clean
	rm -rf build/ .dart_tool/
	@echo "✓ Clean complete"

# Additional useful targets
upgrade-deps:
	@echo "Upgrading dependencies..."
	flutter pub upgrade

outdated:
	@echo "Checking outdated packages..."
	flutter pub outdated

format:
	@echo "Formatting Dart code..."
	dart format lib/ test/

analyze:
	@echo "Analyzing Dart code..."
	dart analyze

build-apk:
	@echo "Building APK..."
	flutter build apk --release

build-web:
	@echo "Building Web..."
	flutter build web

run:
	@echo "Running app..."
	flutter run

run-web:
	@echo "Running app on web..."
	flutter run -d chrome

# Android Emulator targets
emulators:
	@echo "Available emulators:"
	@flutter emulators

create-emulator:
	@echo "Creating Android emulator with API 36 (Google APIs)..."
	@export ANDROID_HOME=$$HOME/Android && \
	yes | $$ANDROID_HOME/cmdline-tools/latest/bin/avdmanager create avd -n flutter_test_api36 -k "system-images;android-36;google_apis;x86_64" --force
	@echo "✓ Emulator 'flutter_test_api36' created"

start-emulator:
	@echo "Starting Android emulator 'flutter_test_api36'..."
	@flutter emulators --launch flutter_test_api36 &
	@echo "⏳ Waiting for emulator to boot (this takes a minute)..."
	@sleep 10
	@echo "✓ Emulator should be starting up..."

run-emulator: start-emulator run
	@echo "✓ App running on emulator"

install-system-image:
	@echo "Installing Android system image..."
	@export ANDROID_HOME=$$HOME/Android && \
	yes | $$ANDROID_HOME/cmdline-tools/latest/bin/sdkmanager "system-images;android-36;google_apis;x86_64"
	@echo "✓ System image installed"
