<h1 align="center">Welcome to ethereum-refund-dApp 👋</h1>
<p>
</p>

> This project includes a mobile app, web app and a smart contract. The  mobile app sends details such as GPS location, device ID and timestamp to a smart contract. If the user is within an acceptable location then the smart contract is upheld. Otherwise, the smart contract is deemed void. There are only two roles: the creator/admin and the device. Both roles have a specific set of functions. The smart contract can be interacted with through a mobile app and a web app. The smart contract goes through 3 stages: creation -> deployment -> testing. The smart contract also has functions that determine whether the locations received are within the terms of the contract. The admin can deploy the smart contract while specifying parameter ranges such as time limit and GPS range.

## PROJECT STRUCTURE
```
ethereum-refund-dApp
├─ .gitignore
├─ LICENSE
├─ README.md
├─ casino-ethereum
│  ├─ .gitattributes
│  ├─ .gitignore
│  ├─ build
│  │  ├─ contracts
│  │  ├─ deployments
│  │  └─ interfaces
│  ├─ contracts
│  │  ├─ Casino.sol
│  │  └─ artifacts
│  │     ├─ Casino.json
│  │     ├─ Casino_metadata.json
│  │     └─ build-info
│  │        └─ b94ea42e40c37d95bc4dd34140f224b7.json
│  ├─ interfaces
│  ├─ reports
│  ├─ scripts
│  │  └─ connect_alchemy.py
│  └─ tests
├─ casino-scenario.json
├─ flutterdapp
│  ├─ AppIcons
│  │  ├─ Assets.xcassets
│  │  │  └─ AppIcon.appiconset
│  │  │     ├─ 1024.png
│  │  │     ├─ 114.png
│  │  │     ├─ 120.png
│  │  │     ├─ 180.png
│  │  │     ├─ 29.png
│  │  │     ├─ 40.png
│  │  │     ├─ 57.png
│  │  │     ├─ 58.png
│  │  │     ├─ 60.png
│  │  │     ├─ 80.png
│  │  │     ├─ 87.png
│  │  │     └─ Contents.json
│  │  ├─ android
│  │  │  ├─ mipmap-hdpi
│  │  │  │  └─ ic_launcher.png
│  │  │  ├─ mipmap-mdpi
│  │  │  │  └─ ic_launcher.png
│  │  │  ├─ mipmap-xhdpi
│  │  │  │  └─ ic_launcher.png
│  │  │  ├─ mipmap-xxhdpi
│  │  │  │  └─ ic_launcher.png
│  │  │  └─ mipmap-xxxhdpi
│  │  │     └─ ic_launcher.png
│  │  ├─ appstore.png
│  │  └─ playstore.png
│  ├─ AppIcons.zip
│  ├─ README.md
│  ├─ accounts.txt
│  ├─ analysis_options.yaml
│  ├─ android
│  │  ├─ app
│  │  │  ├─ build.gradle
│  │  │  └─ src
│  │  │     ├─ debug
│  │  │     │  └─ AndroidManifest.xml
│  │  │     ├─ main
│  │  │     │  ├─ AndroidManifest.xml
│  │  │     │  ├─ java
│  │  │     │  │  └─ io
│  │  │     │  │     └─ flutter
│  │  │     │  │        └─ plugins
│  │  │     │  │           └─ GeneratedPluginRegistrant.java
│  │  │     │  ├─ kotlin
│  │  │     │  │  └─ com
│  │  │     │  │     └─ example
│  │  │     │  │        └─ flutterdapp
│  │  │     │  │           └─ MainActivity.kt
│  │  │     │  └─ res
│  │  │     │     ├─ drawable
│  │  │     │     │  ├─ background.png
│  │  │     │     │  └─ launch_background.xml
│  │  │     │     ├─ drawable-hdpi
│  │  │     │     │  └─ splash.png
│  │  │     │     ├─ drawable-mdpi
│  │  │     │     │  └─ splash.png
│  │  │     │     ├─ drawable-v21
│  │  │     │     │  ├─ background.png
│  │  │     │     │  └─ launch_background.xml
│  │  │     │     ├─ drawable-xhdpi
│  │  │     │     │  └─ splash.png
│  │  │     │     ├─ drawable-xxhdpi
│  │  │     │     │  └─ splash.png
│  │  │     │     ├─ drawable-xxxhdpi
│  │  │     │     │  └─ splash.png
│  │  │     │     ├─ mipmap-hdpi
│  │  │     │     │  └─ ic_launcher.png
│  │  │     │     ├─ mipmap-mdpi
│  │  │     │     │  └─ ic_launcher.png
│  │  │     │     ├─ mipmap-xhdpi
│  │  │     │     │  └─ ic_launcher.png
│  │  │     │     ├─ mipmap-xxhdpi
│  │  │     │     │  └─ ic_launcher.png
│  │  │     │     ├─ mipmap-xxxhdpi
│  │  │     │     │  └─ ic_launcher.png
│  │  │     │     ├─ values
│  │  │     │     │  └─ styles.xml
│  │  │     │     ├─ values-night
│  │  │     │     │  └─ styles.xml
│  │  │     │     └─ values-v31
│  │  │     │        └─ styles.xml
│  │  │     └─ profile
│  │  │        └─ AndroidManifest.xml
│  │  ├─ build.gradle
│  │  ├─ gradle
│  │  │  └─ wrapper
│  │  │     ├─ gradle-wrapper.jar
│  │  │     └─ gradle-wrapper.properties
│  │  ├─ gradle.properties
│  │  ├─ gradlew
│  │  ├─ gradlew.bat
│  │  ├─ local.properties
│  │  └─ settings.gradle
│  ├─ assets
│  ├─ build
│  ├─ images
│  │  └─ splash.png
│  ├─ ios
│  ├─ lib
│  │  ├─ ChildPage.dart
│  │  ├─ Encrypt-Decrypt.dart
│  │  ├─ ParentPage.dart
│  │  ├─ childModel.dart
│  │  ├─ main.dart
│  │  └─ parentModel.dart
│  ├─ linux
│  ├─ macos
│  ├─ web
│  │  ├─ favicon.png
│  │  ├─ icons
│  │  │  ├─ Icon-192.png
│  │  │  ├─ Icon-512.png
│  │  │  ├─ Icon-maskable-192.png
│  │  │  └─ Icon-maskable-512.png
│  │  ├─ index.html
│  │  ├─ manifest.json
│  │  └─ splash
│  │     ├─ img
│  │     │  ├─ dark-1x.png
│  │     │  ├─ dark-2x.png
│  │     │  ├─ dark-3x.png
│  │     │  ├─ dark-4x.png
│  │     │  ├─ light-1x.png
│  │     │  ├─ light-2x.png
│  │     │  ├─ light-3x.png
│  │     │  └─ light-4x.png
│  │     ├─ splash.js
│  │     └─ style.css
│  └─ windows
├─ refund-by-location
│  ├─ .gitattributes
│  ├─ .gitignore
│  ├─ build
│  │  ├─ contracts
│  │  ├─ deployments
│  │  └─ interfaces
│  ├─ contracts
│  │  └─ Refund.sol
│  ├─ interfaces
│  ├─ reports
│  ├─ scripts
│  ├─ test
│  │  ├─ .dart_tool
│  │  │  ├─ dartpad
│  │  │  │  └─ web_plugin_registrant.dart
│  │  │  ├─ package_config.json
│  │  │  ├─ package_config_subset
│  │  │  └─ version
│  │  ├─ .gitignore
│  │  ├─ .idea
│  │  │  ├─ libraries
│  │  │  │  ├─ Dart_SDK.xml
│  │  │  │  └─ KotlinJavaRuntime.xml
│  │  │  ├─ modules.xml
│  │  │  ├─ runConfigurations
│  │  │  │  └─ main_dart.xml
│  │  │  └─ workspace.xml
│  │  ├─ .metadata
│  │  ├─ README.md
│  │  ├─ analysis_options.yaml
│  │  ├─ android
│  │  │  ├─ .gitignore
│  │  │  ├─ app
│  │  │  │  ├─ build.gradle
│  │  │  │  └─ src
│  │  │  │     ├─ debug
│  │  │  │     │  └─ AndroidManifest.xml
│  │  │  │     ├─ main
│  │  │  │     │  ├─ AndroidManifest.xml
│  │  │  │     │  ├─ java
│  │  │  │     │  │  └─ io
│  │  │  │     │  │     └─ flutter
│  │  │  │     │  │        └─ plugins
│  │  │  │     │  │           └─ GeneratedPluginRegistrant.java
│  │  │  │     │  ├─ kotlin
│  │  │  │     │  │  └─ com
│  │  │  │     │  │     └─ example
│  │  │  │     │  │        └─ test
│  │  │  │     │  │           └─ MainActivity.kt
│  │  │  │     │  └─ res
│  │  │  │     │     ├─ drawable
│  │  │  │     │     │  └─ launch_background.xml
│  │  │  │     │     ├─ drawable-v21
│  │  │  │     │     │  └─ launch_background.xml
│  │  │  │     │     ├─ mipmap-hdpi
│  │  │  │     │     │  └─ ic_launcher.png
│  │  │  │     │     ├─ mipmap-mdpi
│  │  │  │     │     │  └─ ic_launcher.png
│  │  │  │     │     ├─ mipmap-xhdpi
│  │  │  │     │     │  └─ ic_launcher.png
│  │  │  │     │     ├─ mipmap-xxhdpi
│  │  │  │     │     │  └─ ic_launcher.png
│  │  │  │     │     ├─ mipmap-xxxhdpi
│  │  │  │     │     │  └─ ic_launcher.png
│  │  │  │     │     ├─ values
│  │  │  │     │     │  └─ styles.xml
│  │  │  │     │     └─ values-night
│  │  │  │     │        └─ styles.xml
│  │  │  │     └─ profile
│  │  │  │        └─ AndroidManifest.xml
│  │  │  ├─ build.gradle
│  │  │  ├─ gradle
│  │  │  │  └─ wrapper
│  │  │  │     ├─ gradle-wrapper.jar
│  │  │  │     └─ gradle-wrapper.properties
│  │  │  ├─ gradle.properties
│  │  │  ├─ gradlew
│  │  │  ├─ gradlew.bat
│  │  │  ├─ local.properties
│  │  │  ├─ settings.gradle
│  │  │  └─ test_android.iml
│  │  ├─ ios
│  │  │  ├─ .gitignore
│  │  │  ├─ Flutter
│  │  │  │  ├─ AppFrameworkInfo.plist
│  │  │  │  ├─ Debug.xcconfig
│  │  │  │  ├─ Generated.xcconfig
│  │  │  │  ├─ Release.xcconfig
│  │  │  │  └─ flutter_export_environment.sh
│  │  │  ├─ Runner
│  │  │  │  ├─ AppDelegate.swift
│  │  │  │  ├─ Assets.xcassets
│  │  │  │  │  ├─ AppIcon.appiconset
│  │  │  │  │  │  ├─ Contents.json
│  │  │  │  │  │  ├─ Icon-App-1024x1024@1x.png
│  │  │  │  │  │  ├─ Icon-App-20x20@1x.png
│  │  │  │  │  │  ├─ Icon-App-20x20@2x.png
│  │  │  │  │  │  ├─ Icon-App-20x20@3x.png
│  │  │  │  │  │  ├─ Icon-App-29x29@1x.png
│  │  │  │  │  │  ├─ Icon-App-29x29@2x.png
│  │  │  │  │  │  ├─ Icon-App-29x29@3x.png
│  │  │  │  │  │  ├─ Icon-App-40x40@1x.png
│  │  │  │  │  │  ├─ Icon-App-40x40@2x.png
│  │  │  │  │  │  ├─ Icon-App-40x40@3x.png
│  │  │  │  │  │  ├─ Icon-App-60x60@2x.png
│  │  │  │  │  │  ├─ Icon-App-60x60@3x.png
│  │  │  │  │  │  ├─ Icon-App-76x76@1x.png
│  │  │  │  │  │  ├─ Icon-App-76x76@2x.png
│  │  │  │  │  │  └─ Icon-App-83.5x83.5@2x.png
│  │  │  │  │  └─ LaunchImage.imageset
│  │  │  │  │     ├─ Contents.json
│  │  │  │  │     ├─ LaunchImage.png
│  │  │  │  │     ├─ LaunchImage@2x.png
│  │  │  │  │     ├─ LaunchImage@3x.png
│  │  │  │  │     └─ README.md
│  │  │  │  ├─ Base.lproj
│  │  │  │  │  ├─ LaunchScreen.storyboard
│  │  │  │  │  └─ Main.storyboard
│  │  │  │  ├─ GeneratedPluginRegistrant.h
│  │  │  │  ├─ GeneratedPluginRegistrant.m
│  │  │  │  ├─ Info.plist
│  │  │  │  └─ Runner-Bridging-Header.h
│  │  │  ├─ Runner.xcodeproj
│  │  │  │  ├─ project.pbxproj
│  │  │  │  ├─ project.xcworkspace
│  │  │  │  │  ├─ contents.xcworkspacedata
│  │  │  │  │  └─ xcshareddata
│  │  │  │  │     ├─ IDEWorkspaceChecks.plist
│  │  │  │  │     └─ WorkspaceSettings.xcsettings
│  │  │  │  └─ xcshareddata
│  │  │  │     └─ xcschemes
│  │  │  │        └─ Runner.xcscheme
│  │  │  └─ Runner.xcworkspace
│  │  │     ├─ contents.xcworkspacedata
│  │  │     └─ xcshareddata
│  │  │        ├─ IDEWorkspaceChecks.plist
│  │  │        └─ WorkspaceSettings.xcsettings
│  │  ├─ lib
│  │  │  └─ main.dart
│  │  ├─ linux
│  │  │  ├─ .gitignore
│  │  │  ├─ CMakeLists.txt
│  │  │  ├─ flutter
│  │  │  │  ├─ CMakeLists.txt
│  │  │  │  ├─ generated_plugin_registrant.cc
│  │  │  │  ├─ generated_plugin_registrant.h
│  │  │  │  └─ generated_plugins.cmake
│  │  │  ├─ main.cc
│  │  │  ├─ my_application.cc
│  │  │  └─ my_application.h
│  │  ├─ macos
│  │  │  ├─ .gitignore
│  │  │  ├─ Flutter
│  │  │  │  ├─ Flutter-Debug.xcconfig
│  │  │  │  ├─ Flutter-Release.xcconfig
│  │  │  │  ├─ GeneratedPluginRegistrant.swift
│  │  │  │  └─ ephemeral
│  │  │  │     ├─ Flutter-Generated.xcconfig
│  │  │  │     └─ flutter_export_environment.sh
│  │  │  ├─ Runner
│  │  │  ├─ Runner.xcodeproj
│  │  │  └─ Runner.xcworkspace
│  │  ├─ pubspec.lock
│  │  ├─ pubspec.yaml
│  │  ├─ test
│  │  │  └─ widget_test.dart
│  │  ├─ test.iml
│  │  ├─ web
│  │  │  ├─ favicon.png
│  │  │  ├─ icons
│  │  │  │  ├─ Icon-192.png
│  │  │  │  ├─ Icon-512.png
│  │  │  │  ├─ Icon-maskable-192.png
│  │  │  │  └─ Icon-maskable-512.png
│  │  │  ├─ index.html
│  │  │  └─ manifest.json
│  │  └─ windows
│  │     ├─ .gitignore
│  │     ├─ CMakeLists.txt
│  │     ├─ flutter
│  │     └─ runner
│  └─ tests
└─ requirements.txt
```

## AUTHOR

👤 **Janerose Njogu**


## Show your support

Give a ⭐️ if this project helped you!

***
_This README was generated with ❤️ by [readme-md-generator](https://github.com/kefranabg/readme-md-generator)_