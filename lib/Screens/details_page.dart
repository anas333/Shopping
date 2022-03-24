import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping/Model/shirt_model.dart';
import 'package:shopping/Services/navigator_page.dart';
import 'package:shopping/floor/dao/cart_dao.dart';
import 'package:shopping/floor/entity/cart_clothes.dart';
import 'package:badges/badges.dart';

Shirts? dr;
late bool notEmpty;
Clothes? result;

class DetailsPage extends StatefulWidget {
  final ClothesDao dao;

  const DetailsPage({Key? key, required this.dao}) : super(key: key);

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  void changestate() {
    setState(() {});
  }

  @override
  build(BuildContext context) {
    NavNewPageService navNewPageService =
        Provider.of<NavNewPageService>(context, listen: false);
    dr = navNewPageService.selectedShirt;
    Size size = MediaQuery.of(context).size;

    int number;

    return Scaffold(
        backgroundColor: Colors.white10,
        body: Builder(builder: ((context) {
          return SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    Container(
                        height: size.height * (0.57),
                        alignment: Alignment.center,
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.centerLeft,
                            end: Alignment
                                .center, // 10% of the width, so there are ten blinds.
                            colors: <Color>[
                              Color.fromARGB(255, 172, 217, 230),
                              Colors.white
                            ], // red to
                          ),
                        )),
                    Positioned(
                        top: size.height * (0.51),
                        left: 20,
                        child: Text(
                          dr!.shirtPrice.toString() + ' \$',
                          style: const TextStyle(
                              color: Color.fromARGB(255, 42, 104, 119),
                              fontSize: 25,
                              fontWeight: FontWeight.w400),
                        )),
                    Center(
                      child: Align(
                        alignment: Alignment.center,
                        child: Container(
                          alignment: Alignment.center,
                          margin: const EdgeInsets.only(
                            top: 40,
                          ),
                          child: Hero(
                            tag: dr!.id,
                            child: Image.network(
                              dr!.shirtImg,
                              fit: BoxFit.fill,
                              height: size.height * (0.45),
                              alignment: Alignment.center,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                        top: 70,
                        left: 20,
                        right: 20,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                                icon: const Icon(
                                  Icons.arrow_back,
                                  color: Color.fromARGB(255, 42, 104, 119),
                                  size: 30,
                                ),
                                onPressed: () {
                                  Navigator.pop(context);
                                }),
                            FutureBuilder<List<Clothes>>(
                                future: widget.dao.getAllClothes(),
                                builder: (BuildContext context,
                                    AsyncSnapshot snapshot) {
                                  if (snapshot.hasData) {
                                    List<Clothes> mine = snapshot.data;
                                    number = mine.length;
                                    return Badge(
                                      badgeContent: Text('$number'),
                                      badgeColor: const Color.fromARGB(
                                          255, 136, 181, 192),
                                      child: IconButton(
                                        icon: const Icon(
                                          Icons.shopping_cart,
                                          size: 30,
                                          color:
                                              Color.fromARGB(255, 42, 104, 119),
                                        ),
                                        onPressed: () {},
                                      ),
                                    );
                                  } else {
                                    return Container();
                                  }
                                }),
                          ],
                        )),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10, top: size.height * (0.02)),
                  child: const Text(
                    'Colors',
                    style: TextStyle(
                        fontSize: 20,
                        color: Color.fromARGB(255, 42, 104, 119),
                        fontWeight: FontWeight.w400),
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.only(left: 25, top: size.height * (0.015)),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        height: 20,
                        width: 20,
                        decoration: BoxDecoration(
                            color: Colors.red.shade50,
                            shape: BoxShape.circle,
                            border:
                                Border.all(color: Colors.blueGrey, width: 3)),
                      ),
                      Container(
                        height: 20,
                        width: 20,
                        margin: const EdgeInsets.only(left: 5),
                        decoration: BoxDecoration(
                            color: Colors.blue.shade300,
                            shape: BoxShape.circle,
                            border:
                                Border.all(color: Colors.blueGrey, width: 3)),
                      ),
                      Container(
                        height: 20,
                        width: 20,
                        margin: const EdgeInsets.only(left: 5),
                        decoration: BoxDecoration(
                            color: Colors.blue.shade100,
                            shape: BoxShape.circle,
                            border:
                                Border.all(color: Colors.blueGrey, width: 3)),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10, top: size.height * (0.02)),
                  child: const Text(
                    'Descrebtion',
                    style: TextStyle(
                        fontSize: 20,
                        color: Color.fromARGB(255, 42, 104, 119),
                        fontWeight: FontWeight.w400),
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.only(left: 20, top: size.height * (0.015)),
                  child: Text(
                    'this product is copy one and highly\nrecomanded for its solid platform and \nnotEmptyistace of water',
                    softWrap: true,
                    style: TextStyle(
                        wordSpacing: 3,
                        fontSize: 16,
                        color: Colors.blueGrey.shade300,
                        fontWeight: FontWeight.w400),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: size.height * (0.02),
                      bottom: size.height * (0.04),
                      left: 10),
                  child: const Text(
                    'Some Thing To Wear With',
                    style: TextStyle(
                        fontSize: 20,
                        color: Color.fromARGB(255, 42, 104, 119),
                        fontWeight: FontWeight.w400),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(bottom: 8.0, left: 15, right: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () async {
                          try {} catch (e) {
                            throw Exception(e);
                          }
                        },
                        child: Container(
                          height: size.height * (0.082),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: const DecorationImage(
                                  image: AssetImage('assets/imgs/fabric2.jpg'),
                                  colorFilter: ColorFilter.mode(
                                      Color.fromARGB(255, 42, 104, 119),
                                      BlendMode.multiply),
                                  fit: BoxFit.fill)),
                          child: Padding(
                            padding: const EdgeInsets.all(12),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Padding(
                                  padding: EdgeInsets.only(right: 10),
                                  child: Text(
                                    'Call The Vender',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ),
                                Icon(
                                  Icons.call,
                                  color: Colors.white,
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                          onTap: () async {
                            try {
                              result = await widget.dao.getNamedClothes(dr!.id);
                              if (result != null) {
                                await widget.dao.deleteClothes(result!);
                                changestate();
                              } else {
                                widget.dao.insertClothes(Clothes(
                                    dr!.id,
                                    dr!.shirtName,
                                    dr!.shirtPrice,
                                    dr!.shirtImg));

                                changestate();
                              }
                            } catch (e) {
                              throw Exception(e);
                            }
                          },
                          child: Container(
                            height: 60,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                image: const DecorationImage(
                                    image:
                                        AssetImage('assets/imgs/fabric2.jpg'),
                                    colorFilter: ColorFilter.mode(
                                        Color.fromARGB(255, 42, 104, 119),
                                        BlendMode.multiply),
                                    fit: BoxFit.fill)),
                            child: Padding(
                              padding: const EdgeInsets.all(12),
                              child: FutureBuilder(
                                  future: widget.dao.getNamedClothes(dr!.id),
                                  builder: (BuildContext context,
                                      AsyncSnapshot snapshot) {
                                    if (snapshot.hasData) {
                                      return Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: const [
                                          Padding(
                                              padding:
                                                  EdgeInsets.only(right: 10),
                                              child: Text(
                                                'added',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 20,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              )),
                                          Icon(
                                            Icons.check,
                                            color: Colors.white,
                                            size: 30,
                                          )
                                        ],
                                      );
                                    } else {
                                      return Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: const [
                                          Padding(
                                              padding:
                                                  EdgeInsets.only(right: 10),
                                              child: Text(
                                                'add',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 20,
                                                    fontWeight:
                                                        FontWeight.w400),
                                              )),
                                          Icon(
                                            Icons.shopping_cart,
                                            color: Colors.white,
                                          )
                                        ],
                                      );
                                    }
                                  }),
                            ),
                          ))
                    ],
                  ),
                ),
              ],
            ),
          );
        })));
  }
}
