import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Merendero Suyapa',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const Home(),
    );
  }
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          bottom: const TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.list),
                text: 'Facturas',
              ),
              Tab(
                icon: Icon(Icons.edit),
                text: 'Productos / Clientes',
              ),
            ],
          ),
          title: const Text('Merendero Suyapa'),
        ),
        body: const TabBarView(
          children: [
            Invoices(),
            ProductsClients(),
          ],
        ),
      ),
    ));
  }
}

class Invoices extends StatelessWidget {
  const Invoices({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: SingleChildScrollView(
            child: Column(children: [
              const TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(),
                  labelText: 'Buscar cliente por su nombre',
                ),
              ),
              ListView.builder(
                  shrinkWrap: true,
                  padding: const EdgeInsets.all(8),
                  itemCount: 5,
                  itemBuilder: (BuildContext context, int index) {
                    return const Card(
                      child: ListTile(
                        leading: Text('Ivan Calderon'),
                        title: Text('2 - Baleadas - 10/Oct/2023'),
                        subtitle: Text('L 50'),
                      ),
                    );
                  })
            ]),
          ),
        ),
        persistentFooterButtons: const [Text('Total ' 'L 300')],
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          tooltip: 'Increment',
          child: const Icon(Icons.add),
        ));
  }
}

class ProductsClients extends StatelessWidget {
  const ProductsClients({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(children: []),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          tooltip: 'Increment',
          child: const Icon(Icons.add),
        ));
  }
}
