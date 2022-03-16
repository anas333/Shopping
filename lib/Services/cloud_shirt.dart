import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shopping/Model/shirt_model.dart';

class CloudFirestore {
  FirebaseFirestore? _instance;
  final List<Shirts> _shirts = [];
  List<Shirts> getCategories() {
    return _shirts;
  }

  Future<void> getShirts() async {
    _instance = FirebaseFirestore.instance;
    CollectionReference products = _instance!.collection('products');
    DocumentSnapshot snapshirt = await products.doc('shirt').get();
    if (snapshirt.exists) {
      Map<String, dynamic> data = snapshirt.data() as Map<String, dynamic>;

      var dataShirt = data['shirt'] as List<dynamic>;

      for (var shirtone in dataShirt) {
        Shirts shirtkind = Shirts.fromJson(shirtone);

        _shirts.add(shirtkind);
      }
    }
  }
}
