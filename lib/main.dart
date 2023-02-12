import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:Krishna/Auth/EnterNumber.dart';
import 'package:Krishna/Backend/backend.dart';
import 'package:Krishna/Usefull/Functions.dart';
import 'package:Krishna/Usefull/colors.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    home: splash(),
    // home: enterMobile(),
  ));
}

class splash extends StatefulWidget {
  const splash({Key? key}) : super(key: key);

  @override
  State<splash> createState() => _splashState();
}

class _splashState extends State<splash> {
  User? user = FirebaseAuth.instance.currentUser;

  @override
  void initState() {
    check();
  }

  check() async {
    FirebaseAuth user = await FirebaseAuth.instance;
    if (user.currentUser != null) {
      checker(context);
    } else {
      navScreen(enterMobile(), context, true);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: bgColor,
        body: Stack(
          children: [
            circles(context),
            textr(context, "be one"),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Spacer(),
                    mainText("Krishna", mainColor, 20.0, FontWeight.normal, 1),
                    Spacer(),
                  ],
                ),
                // mainText("be one", secColor, 15.0, FontWeight.bold, 1),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
