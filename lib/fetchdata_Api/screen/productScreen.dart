import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_example/fetchdata_Api/model/product_model.dart';
import 'package:riverpod_example/fetchdata_Api/model/productprovider_model.dart';

void main() {
  runApp(ProviderScope(child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ProductScreen(),
    );
  }
}

class ProductScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(productprovidermodel);
    return Scaffold(
      body: data.when(
        data: (data) {
          List<Productmodel> products = data.map((e) => e).toList();
          return ListView.builder(
              itemCount: products.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(products[index].title!),
                  subtitle: Text(products[index].price.toString()),
                  leading: Image.network(products[index].image!),
                );
              });
        },
        error: ((error, stackTrace) => Text(error.toString())),
        loading: () => Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
