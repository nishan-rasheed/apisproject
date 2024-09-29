import 'package:apis/controller/bottomnavprovider.dart';
import 'package:apis/controller/productcontroller.dart';
import 'package:apis/view/home/homescreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => BottomNavProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => ProductController(),
        )
      ],
      child: MaterialApp(
        title: 'Nihal rasheed development',
        theme: ThemeData(
          scaffoldBackgroundColor: Color.fromARGB(255, 227, 243, 255),
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const Homescreen(),
      ),
    );
  }
}
