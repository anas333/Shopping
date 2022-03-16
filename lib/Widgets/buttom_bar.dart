import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping/Screens/home_page.dart';
import 'package:shopping/Services/navigator_page.dart';
import 'package:shopping/floor/dao/cart_dao.dart';
import 'package:shopping/floor/entity/cart_clothes.dart';

class BottomBar extends StatefulWidget {
  final ClothesDao dao;

  const BottomBar({Key? key, required this.dao}) : super(key: key);

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const HomePage(),
  ];

  @override
  Widget build(BuildContext context) {
    List<Clothes> mydatabase;
    NavNewPageService navNewPageService =
        Provider.of<NavNewPageService>(context, listen: false);

    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 237, 239, 243),
        body: Builder(builder: (BuildContext context) {
          return _pages[_selectedIndex];
        }),
        bottomNavigationBar: Container(
            margin: const EdgeInsets.only(top: 10),
            height: 60,
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25)),
                image: DecorationImage(
                  image: AssetImage('assets/imgs/fabric2.jpg'),
                  colorFilter: ColorFilter.mode(
                      Color.fromARGB(255, 42, 104, 119), BlendMode.multiply),
                  fit: BoxFit.fill,
                )),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  icon: const Icon(
                    Icons.home_outlined,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    setState(() {
                      _selectedIndex = 0;
                    });
                  },
                ),
                GestureDetector(
                  child: const Icon(
                    Icons.shopping_cart_outlined,
                    color: Colors.white,
                  ),
                  onTap: () async {
                    mydatabase = await widget.dao.getAllClothes();

                    navNewPageService.selectedCart = mydatabase;
                    Navigator.pushNamed(context, '/Mycart');
                    setState(() {});
                  },
                ),
                IconButton(
                  icon: const Icon(
                    Icons.shopping_bag_outlined,
                    color: Colors.white,
                  ),
                  onPressed: () {},
                ),
                IconButton(
                  icon: const Icon(
                    Icons.settings_outlined,
                    color: Colors.white,
                  ),
                  onPressed: () {},
                ),
              ],
            )));
  }
}
