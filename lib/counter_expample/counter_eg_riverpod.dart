import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(ProviderScope(child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Myhomepage(),
    );
  }
}

final conterstateprovider = StateProvider<int>((ref) {
  return 0;
});

class Myhomepage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var value = ref.watch(conterstateprovider);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Text("Value : " + value.toString()),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          FloatingActionButton(
            onPressed: () {
              ref.read(conterstateprovider.notifier).state++;
            },
            child: Icon(Icons.add),
          ),
          FloatingActionButton(
            onPressed: () {
              ref.read(conterstateprovider.notifier).state--;
            },
            child: Icon(Icons.minimize),
          ),
        ],
      ),
    );
  }
}
