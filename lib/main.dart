import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

//myText
class MyTextController extends ChangeNotifier {
  TextEditingController myController = TextEditingController();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => MyTextController(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'My App',
        home: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final myController = Provider.of<MyTextController>(context).myController;
    return Scaffold(
      appBar: AppBar(title: const Text('My Home Page')),
      body: Center(
        child: TextField(
          controller: myController,
          decoration: const InputDecoration(hintText: 'Enter some text'),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const SecondPage()),
          );
        },
        child: const Icon(Icons.arrow_forward),
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    final myController = Provider.of<MyTextController>(context).myController;
    return Scaffold(
      appBar: AppBar(title: const Text('Second Page')),
      body: Center(
        child: Text(myController.text),
      ),
    );
  }
}
