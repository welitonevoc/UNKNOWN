## Tools

### Build Runner
Rodar o build runner para gerar os arquivos
```bash
fvm flutter pub run build_runner  watch --delete-conflicting-outputs
```
### Run Mobile
```bash
fvm flutter run
```

### Build Android
Build para dispositivos android
```bash 
flutter build apk
```

### Build and Install on Android Device
Build para dispositivos android e instalacao automatica
```bash 
fvm flutter build apk && adb install -r build/app/outputs/flutter-apk/app-release.apk
```