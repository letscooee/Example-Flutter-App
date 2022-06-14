import 'package:flutter/material.dart';
import 'package:cooee_plugin/cooee_plugin.dart';

void main() {
  runApp(const MyApp());

  //  Cooee Specific- Register for CooeeInAppNotificationAction.
  CooeePlugin cooeePlugin = CooeePlugin();
  cooeePlugin.setCooeeInAppNotificationAction(inAppTriggered);
}

/// Will listen for @invokeMethod which will triggered by Cooee Plugin.
void inAppTriggered(Map<String, dynamic> map) {
  // Cooee Specific- map["actionType"] varies according to app App domain/event.
  if (map["actionType"] == "PLAY_COURSE") {
    // Cooee Specific- Product id will be available via "map["courseID"]"
  } else if (map["actionType"] == "APPLY_COUPON") {
    // Your code to apply a given coupon.
    // Cooee Specific- Coupon code can be accessed via "map["couponCode"]"
  } else if (map["actionType"] == "GO_TO_SCREEN") {
    // Your code to take user to a particular screen
    // Cooee Specific- Screen name can be accessed via "map["screenName"]"
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            OutlinedButton(
                onPressed: () => {
                      sendEvent(),
                    },
                child: const Text('Cooee event')),
            OutlinedButton(
                onPressed: () => {
                      updateUserProfile(),
                    },
                child: const Text('Update User profile')),
            OutlinedButton(
                onPressed: () => {
                      CooeePlugin.setCurrentScreen("Home"),
                    },
                child: const Text('Tack current screen')),
          ],
        ),
      ),
    );
  }

  /// Send event to Cooee
  void sendEvent() {
    // Cooee Specific- event name and event propertied can be varied according to app domain
    var eventProperties = {
      "item": {
        "id": "1",
        "name": "test-item",
        "price": 10,
        "quantity": 1,
        "category": {"name": "test", "id": 1}
      }
    };

    CooeePlugin.sendEvent("View Item", eventProperties);
  }

  /// Update user profile
  void updateUserProfile() {
    // Cooee Specific- You can pass any data like user_referral_code, user_id, user_name, etc.
    var userProfile = {
      "name": "test-user",
      "email": "test@letscooee.com",
      "phone": "123456789",
      "foo": "bar"
    };

    CooeePlugin.updateUserProfile(userProfile);
  }
}
