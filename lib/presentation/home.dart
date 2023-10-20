import 'package:flutter/material.dart';
import 'package:merendero_suyapa/presentation/clients.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
          icon: const Icon(
            Icons.home, color: Colors.white,
          ),
          onPressed: () {},
            ),
          centerTitle: true,
          title: const Text('Merendero Suyapa'),
          
      
        ),
        body: const Clients(),
      ),
    ));
  }
}