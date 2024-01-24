import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart';
import 'package:riverpod_example/fetchdata_Api/model/product_model.dart';

class Apiservice {
  String url = "https://fakestoreapi.com/products";
  Future<List<Productmodel>> getProducts() async {
    Response response = await get(Uri.parse(url));
    if (response.statusCode == 200) {
      var data = response.body;
      return productmodelFromJson(data);
    } else {
      throw Exception();
    }
  }
}

final productProvider = Provider<Apiservice>((ref) => Apiservice());
