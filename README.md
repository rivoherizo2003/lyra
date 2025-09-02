# lyra

Lyrics A.Fa.Fi

This mobile app will be used to list all songs of the Malagasy Choir A.Fa.Fi
# install sdk tools
```
sudo apt update && sudo apt install android-sdk
```

## Connect device for usb debugging
# Activate usb debugging for in the device settings<br>
# Run the following command in the container to check if the device is connected
    ```bash
    flutter doctor
    ```
# Run the following command to install dependencies
    ```bash
    flutter pub get
    ```
# Run the following command to install dependencies needed for usb debugging and to launch the emulator on real android device
    ```bash
    flutter run
    ```

# Release apk
```bash
 flutter clean && flutter pub get && flutter pub run flutter_launcher_icons && flutter build apk --release --split-per-abi
 ```

# Create a key to sign apk
```bash
keytool -genkey -v -keystore upload-keystore.jks -keyalg RSA -keysize 2048 -validity 10000 -alias upload
```

# Output key store
```bash
 base64 -w 0 upload-keystore.jks > keystore_base64.txt
```

# install dependencies flutter fire
- launch fire.sh(Don't use remove container vsCode: permission problem)<br>
- dart pub global activate flutterfire_cli<br>
- firebase login
- flutterfire configure<br>

# push new tag
```bash
git tag v.x.x
git push origin vx.x.x 
```
