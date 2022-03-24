import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping/Services/auth.dart';
import 'package:shopping/Services/cloud_shirt.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      CloudFirestore cloudFirestore =
          Provider.of<CloudFirestore>(context, listen: false);
      cloudFirestore.getShirts().then((value) => FlutterNativeSplash.remove());
      final Authenticatoin auth = Authenticatoin();
      auth.signin();
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        body: GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, '/BottomBar');
          },
          child: Scaffold(
            body: Container(
              height: double.infinity,
              width: double.infinity,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/imgs/welcomeScreen2.jpg"),
                      fit: BoxFit.fill,
                      colorFilter: ColorFilter.mode(
                          Color.fromARGB(255, 17, 191, 235),
                          BlendMode.multiply))),
              child: Align(
                alignment: Alignment.topCenter,
                child: Container(
                    margin: const EdgeInsets.only(top: 10),
                    width: double.maxFinite,
                    height: size.height * (0.09001),
                    decoration: const BoxDecoration(color: Colors.transparent),
                    child: const Image(
                        image: AssetImage('assets/imgs/logo1.png'))),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
