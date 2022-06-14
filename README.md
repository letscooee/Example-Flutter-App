# Example Flutter App

This project helps you get started with [Cooee's Flutter plugin](https://pub.dev/packages/cooee_plugin/) in
flutter.<br>  
All integration from Cooee flutter [documentation](https://docs.letscooee.com/developers/flutter/quickstart) are added commit by commit.


## Environment

This App was tested with below configuration.

- **Flutter** 2.10.3 • channel stable <br>
- **Tools** • Dart 2.16.1 • DevTools 2.9.2 <br>
- **Android Studio**: Android Studio Chipmunk | 2021.2.1
- **XCode**: version 13.4.1

## Commit Convention

To demonstrate the usage of the plugin better, we are following the following commit
convention to better understand the changes related to an app or the Cooee plugin.

1. For flutter app related changes, the commit is prefixed with `(App)`.
2. For Cooee plugin related changes, the commit is prefixed with `(Cooee vx.x.x)` (shows a specific version).

## Code Convention

To understand the code better, we left various comments in the code to bifurcate Cooee's plugin specific
changes separately-

1. `// Cooee specific` shows the code change required for Cooee plugin to work.
2. `// Cooee specific (optional)` show the above which is an optional change.

## Branch Convention

#### Branch `multiple_firebase_messaging_plugin`

1. To send engagement to app Cooee uses Firebase Messaging.
2. If User using any other plugin which supports Firebase Messaging it will
make conflict of `FirebaseMessagingService` and only one plugin will work.
3. To Handle this required changes are added on branch.

## Running the App

To run this project, You will need to do following changes in the repository-

### Android & iOS

1. Replace `YOUR_COOEE_APP_ID` with `AppId` provided in [App Details](https://dashboard.letscooee.com/app/details)
on Cooee Dashboard.

### Android only

Nothing more to do here.

### iOS Only

3. For iOS, double click `ios/Runner.xcworkspace` to open in XCode.
4. Set you development team in `Project Setting` -> `Signing & Capability` for `Runner` target.
5. Also make sure `group.com.letscooee.YOUR_COOEE_APP_ID` is checked and synced
with your developer account in **App Group** capability.
6. **Step 4** and **Step 5** should be repeated for `NotificationServiceExtension` target.

That's it. You can now run the app on your physical device. Simulator can't be used to test push notifications.

Lets start sending engagement from [Cooee Dashboard](https://dashboard.letscooee.com/engage/composer).

