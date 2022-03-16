import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping/floor/dao/cart_dao.dart';
import 'package:shopping/floor/entity/cart_clothes.dart';

import '../Services/navigator_page.dart';

class MyCart extends StatefulWidget {
  final ClothesDao dao;
  const MyCart({Key? key, required this.dao}) : super(key: key);

  @override
  _MyCartState createState() => _MyCartState();
}

class _MyCartState extends State<MyCart> {
  late List<Clothes>? _clothes;

  @override
  Widget build(BuildContext context) {
    NavNewPageService navNewPageService =
        Provider.of<NavNewPageService>(context, listen: false);
    _clothes = navNewPageService.selectedCart;
    int price = 0;
    for (int i = 0; i < _clothes!.length; ++i) {
      price = _clothes![i].price + price;
    }

    return Scaffold(
      appBar: AppBar(
          flexibleSpace: Container(
              decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/imgs/fabric2.jpg'),
                colorFilter: ColorFilter.mode(
                    Color.fromARGB(255, 42, 104, 119), BlendMode.multiply),
                fit: BoxFit.fill),
          )),
          leading: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(Icons.arrow_back)),
          actions: [
            const Image(
              image: AssetImage('assets/imgs/logo1.png'),
              fit: BoxFit.fill,
            ),
            IconButton(onPressed: () {}, icon: const Icon(Icons.menu)),
          ]),
      body: Builder(builder: (context) {
        return Column(
          children: [
            Expanded(
              child: ListView.builder(
                  itemCount: _clothes!.length,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.all(12),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Image.network(
                            _clothes![index].imgUrl,
                            height: 100,
                            width: 100,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                _clothes![index].name,
                                style: const TextStyle(
                                    fontSize: 18, color: Colors.grey),
                              ),
                              Text(
                                _clothes![index].price.toString() + ' \$',
                                style: const TextStyle(
                                    fontSize: 22, color: Colors.blueGrey),
                              ),
                            ],
                          ),
                          GestureDetector(
                            child: Container(
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                    image:
                                        AssetImage('assets/imgs/fabric2.jpg'),
                                    colorFilter: ColorFilter.mode(
                                        Color.fromARGB(255, 42, 104, 119),
                                        BlendMode.multiply),
                                    fit: BoxFit.fill),
                              ),
                              child: const Padding(
                                  padding: EdgeInsets.all(15),
                                  child: Text(
                                    'remove',
                                    style: TextStyle(
                                        fontSize: 17, color: Colors.white),
                                  )),
                            ),
                            onTap: () {
                              widget.dao.deleteClothes(_clothes![index]);

                              setState(() {
                                _clothes!.removeAt(index);
                              });
                            },
                          )
                        ],
                      ),
                    );
                  }),
            ),
            const Divider(
              height: 2,
              color: Colors.blueGrey,
            ),
            Container(
              padding: const EdgeInsets.all(20),
              height: 100,
              child: Text(
                'TOTAL PRICE: $price \$',
                style: const TextStyle(fontSize: 20, color: Colors.blueGrey),
              ),
            )
          ],
        );
      }),
    );
  }
}
