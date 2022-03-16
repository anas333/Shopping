import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping/Model/shirt_model.dart';
import 'package:shopping/Services/cloud_shirt.dart';
import 'package:shopping/Services/navigator_page.dart';

class MyshirtItem extends StatefulWidget {
  const MyshirtItem({Key? key}) : super(key: key);

  @override
  _MyshirtItemState createState() => _MyshirtItemState();
}

class _MyshirtItemState extends State<MyshirtItem> {
  @override
  Widget build(BuildContext context) {
    NavNewPageService navNewPageService =
        Provider.of<NavNewPageService>(context, listen: false);

    CloudFirestore cloudFirestore =
        Provider.of<CloudFirestore>(context, listen: false);

    List<Shirts> shirt = cloudFirestore.getCategories();

    final Size size = MediaQuery.of(context).size;
    return ListView.builder(
        itemCount: shirt.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(
              left: 20,
            ),
            child: GestureDetector(
              onTap: () {
                navNewPageService.selectedShirt = shirt[index];
                Navigator.pushNamed(
                  context,
                  '/DetailsPage',
                );
              },
              child: SizedBox(
                width: size.width / 2.7,
                height: size.height * (0.3),
                child: Stack(
                  children: [
                    Positioned(
                      top: 0,
                      left: 0,
                      child: Container(
                        height: size.height * (0.2),
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 46, 94, 73),
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 30),
                      child: Hero(
                        tag: shirt[index].id,
                        child: Image.network(
                          shirt[index].shirtImg,
                          height: size.height * (0.19),
                          fit: BoxFit.cover,
                          loadingBuilder: (BuildContext context, Widget child,
                              ImageChunkEvent? loadingProgress) {
                            if (loadingProgress == null) return child;
                            return Center(
                              child: CircularProgressIndicator(
                                value: loadingProgress.expectedTotalBytes !=
                                        null
                                    ? loadingProgress.cumulativeBytesLoaded /
                                        loadingProgress.expectedTotalBytes!
                                    : null,
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    Positioned(
                        top: size.height * (0.24),
                        left: 20,
                        child: Text(
                          shirt[index].shirtPrice.toString() + ' \$',
                          style: const TextStyle(
                              color: Color.fromARGB(255, 42, 104, 119),
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        )),
                    Positioned(
                        top: 12,
                        right: 5,
                        child: IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.favorite,
                              color: Color.fromARGB(255, 138, 194, 201),
                              size: 22,
                            )))
                  ],
                ),
              ),
            ),
          );
        });
  }
}
