# Ondskabens Skov

Et komplet, native Android survival-horrorspil om **Line**, **Jean** og huset, der lever midt i skoven.

## Gameplay

- Fri udforskning gennem fem sammenhængende zoner
- Touch-joystick og separate knapper til lys, interaktion, løb og lysimpuls
- Health-, sanity-, stamina- og batterisystem
- Dynamisk lommelygte, mørke, tåge, hallucinationer og blink-mekanik
- Ravne-bærerne angriber, når Line vender ryggen til
- Skovens Børn lokkes og skades af lys
- De Tavse flytter sig, når Line blinker
- Husets Åndedrag fungerer som afsluttende boss
- Batterier, tændstikker, dagbøger, Jeans jakke, nøgle og tre symboler
- Automatisk lokal lagring og mulighed for at fortsætte
- Flere slutninger afhængigt af sanity og indsamlede spor
- Procedural 2D-grafik, partikler, skærmrystelser og syntetisk lydlandskab
- Kører offline og kræver ingen unødvendige Android-tilladelser

## APK

GitHub Actions bygger en signeret **debug-APK**, som kan installeres direkte på Android-enheder. Download build-artefakten `Ondskabens-Skov-APK` fra den seneste succesfulde workflow-kørsel.

Debug-signaturen gør APK'en installerbar uden Android Studio. Den er ikke en Play Store-produktionssignatur.

## Projektstruktur

Selve Android-projektet er komprimeret og fordelt i `source/chunk-00.b64` til `source/chunk-04.b64`, så repository-integrationen kan overføre hele projektet uden binær filupload. Build-workflowet samler automatisk delene, udpakker projektet og kompilerer APK'en.

Manuel rekonstruktion på Linux/macOS:

```bash
cat source/chunk-*.b64 > project.tar.gz.b64
base64 --decode project.tar.gz.b64 > project.tar.gz
tar -xzf project.tar.gz
gradle clean assembleDebug
```

APK-output:

```text
app/build/outputs/apk/debug/app-debug.apk
```

## Teknologi

- Java 17
- Android SDK 35
- Native `SurfaceView`/Canvas-rendering
- Ingen WebView
- Ingen eksterne runtime-biblioteker
