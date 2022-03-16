import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping/Services/auth.dart';
import 'package:shopping/Services/cloud_shirt.dart';
import '../Widgets/mybox.dart';
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
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/imgs/fabric2.jpg"),
                      fit: BoxFit.fill,
                      colorFilter: ColorFilter.mode(
                          Color.fromARGB(255, 42, 104, 119),
                          BlendMode.multiply))),
              child: Stack(children: [
                Container(
                  margin: const EdgeInsets.only(top: 10),
                  width: double.maxFinite,
                  height: size.height * (0.09001),
                  decoration: const BoxDecoration(color: Colors.transparent),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: MyBox(
                          high: 50,
                          width: 50,
                          mycontainercolor: Colors.transparent,
                          myBorderColor: Color.fromARGB(220, 255, 255, 255),
                          child: Icon(
                            Icons.menu,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Expanded(
                          child: Image(
                              image: AssetImage('assets/imgs/logo1.png'))),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: MyBox(
                          high: 50,
                          width: 50,
                          mycontainercolor: Colors.transparent,
                          myBorderColor: Color.fromARGB(220, 255, 255, 255),
                          child: Icon(
                            Icons.settings,
                            color: Color.fromARGB(220, 255, 255, 255),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    height: size.height * (0.09),
                    width: 300,
                    alignment: Alignment.bottomCenter,
                    margin: EdgeInsets.only(bottom: size.height * (0.065)),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(color: Colors.white, width: 0.7)),
                    child: const Center(
                      child: Text(
                        'Welcome To Our Shop >>',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w300),
                      ),
                    ),
                  ),
                )
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
