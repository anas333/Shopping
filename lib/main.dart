import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:shopping/Screens/cart.dart';
import 'package:shopping/Screens/details_page.dart';
import 'package:shopping/Screens/home_page.dart';
import 'package:shopping/Widgets/buttom_bar.dart';
import 'Screens/welcome_screen.dart';
import 'Services/cloud_shirt.dart';
import 'Services/navigator_page.dart';
import 'firebase_options.dart';
import 'package:provider/provider.dart';
import 'floor/database/database.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  final database =
      await $FloorAppDatabase.databaseBuilder('app_database.db').build();
  final dao = database.clothesDao;

  runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => NavNewPageService(),
        ),
        Provider(
          create: (_) => CloudFirestore(),
        ),
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: '/',
          routes: {
            '/': (context) => const WelcomeScreen(),
            '/BottomBar': ((context) => BottomBar(dao: dao)),
            '/HomePage': (context) => const HomePage(),
            '/DetailsPage': (context) => DetailsPage(dao: dao),
            '/Mycart': ((context) => MyCart(dao: dao))
          })));
}
