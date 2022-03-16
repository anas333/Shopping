import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../Widgets/my_tap_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 245, 248, 248),
      appBar: AppBar(
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.light,
          statusBarBrightness: Brightness.light,
        ),
        leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.pop(context);
            }),
        backgroundColor: Colors.transparent,
        elevation: 0,
        flexibleSpace: Container(
            decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/imgs/fabric2.jpg'),
              colorFilter: ColorFilter.mode(
                  Color.fromARGB(255, 42, 104, 119), BlendMode.multiply),
              fit: BoxFit.fill),
        )),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 20),
            child: Image(
              image: AssetImage('assets/imgs/logo1.png'),
              height: 60,
              width: 125,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 20),
            child: Icon(Icons.notification_add_rounded),
          ),
        ],
      ),

      // ignore: sized_box_for_whitespace
      body: SingleChildScrollView(
        child: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.center, // 10% of the width, so there are ten blinds.
            colors: <Color>[
              Color.fromARGB(255, 203, 236, 245),
              Colors.white
            ], // red to
          )),
          width: double.infinity,
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const SizedBox(
              height: 10,
            ),

            //text line selection
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 25, vertical: 1),
              child: Text(
                'New Collection',
                style: TextStyle(
                  color: Color.fromARGB(255, 42, 104, 119),
                  fontFamily: ' Raleway-Medium',
                  fontSize: 20,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ),
            const MyTapBar(),

            Container(
              padding: const EdgeInsets.only(left: 25),
              child: const Text(
                'Our Products',
                style: TextStyle(
                    color: Color.fromARGB(255, 42, 104, 119),
                    fontSize: 20,
                    fontFamily: 'Raleway-Medium',
                    fontWeight: FontWeight.w300),
              ),
            ),
            Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      mycont('assets/imgs/hoddiIcon.png'),
                      mycont('assets/imgs/shirtIcon.png'),
                      mycont('assets/imgs/jeans2Icon.png'),
                      mycont('assets/imgs/hoddiIcon.png')
                    ])),
            Container(
              padding: const EdgeInsets.only(top: 20),
              child: const Center(
                child: Text(
                  'Pick One',
                  style: TextStyle(
                      color: Color.fromARGB(255, 42, 104, 119),
                      fontSize: 20,
                      fontFamily: 'Raleway-Medium',
                      fontWeight: FontWeight.w300),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  myoffer('30% OFF'),
                  myoffer('50% OFF'),
                  myoffer('60% OFF')
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}

Widget mycont(String img) {
  return Container(
    padding: const EdgeInsets.all(15),
    decoration: BoxDecoration(
      color: const Color.fromARGB(255, 195, 236, 196),
      borderRadius: BorderRadius.circular(15),
    ),
    child: Column(
      children: [
        Image(
          image: AssetImage(img),
          width: 50,
          height: 50,
        ),
      ],
    ),
  );
}

Widget myoffer(String offer) {
  return Container(
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        border: Border.all(
          color: const Color.fromARGB(255, 42, 104, 119),
        ),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Text(
        offer,
        style: const TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 55, 122, 177)),
      ));
}
