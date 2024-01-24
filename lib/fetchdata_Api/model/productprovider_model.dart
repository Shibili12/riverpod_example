import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_example/fetchdata_Api/model/product_model.dart';
import 'package:riverpod_example/fetchdata_Api/service/api_service.dart';

final productprovidermodel = FutureProvider<List<Productmodel>>((ref) async {
  return ref.watch(productProvider).getProducts();
});
