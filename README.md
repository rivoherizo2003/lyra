# lyra

Lyrics A.Fa.Fi

This mobile app will be used to list all songs of the Malagasy Choir A.Fa.Fi

# install sdk tools
```
sudo apt update && sudo apt install android-sdk
```

# Connect device for usb debugging
- Activate usb debugging for in the device settings<br>
- Run the following command in the container to check if the device is connected
    ```
    flutter doctor
    ```
- Run the following command to install dependencies
    ```
    flutter pub get
    ```
- Run the following command to install dependencies needed for usb debugging and to launch the emulator on real android device
    ```
    flutter run
    ```

# Release apk
```bash
flutter clean && flutter pub get && flutter pub run flutter_launcher_icons && flutter build apk --release --split-per-abi
```

# install dependencies flutter fire
- docker exec -it containerid bash<br>
- launch fire.sh(Don't use remove container vsCode: permission problem)<br>
- dart pub global activate flutterfire_cli<br>
- firebase login
- flutterfire configure<br>







