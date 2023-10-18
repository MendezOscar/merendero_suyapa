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

//--- DESDE AQUI MIGRAR

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Merendero Suyapa'),
        ),
        body: const Clients(),
      ),
    ));
  }
}

class Clients extends StatelessWidget {
  const Clients({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: SingleChildScrollView(
            child: Column(children: [
              const SizedBox(
                height: 20,
              ),
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
                    return Card(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            foregroundColor: Colors.blue),
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const Invoices(
                                    client: 'Ivan Calderon',
                                  )));
                        },
                        child: const ListTile(
                          leading: CircleAvatar(
                            child: Text(
                              'IC',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          title: Text('Ivan Calderon'),
                        ),
                      ),
                    );
                  })
            ]),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text("Agregar cliente"),
                    content: SizedBox(
                        height: 110,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            const TextField(
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Nombre del cliente',
                              ),
                            ),
                            ElevatedButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: const Text('Guardar'))
                          ],
                        )),
                  );
                });
          },
          tooltip: 'Increment',
          child: const Icon(Icons.add),
        ));
  }
}

class Invoices extends StatelessWidget {
  final String client;
  const Invoices({super.key, required this.client});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Facturas de $client')),
        body: ListView.builder(
            shrinkWrap: true,
            padding: const EdgeInsets.all(8),
            itemCount: 5,
            itemBuilder: (BuildContext context, int index) {
              return Card(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.blue),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const ViewInvoice()));
                  },
                  child: const ListTile(
                      leading: CircleAvatar(
                        child: Icon(Icons.format_list_bulleted),
                      ),
                      title: Text('17-oct-2023'),
                      trailing: Text('L. 100')),
                ),
              );
            }),
        persistentFooterButtons: const [Text('Total L. 500')],
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const AddInvoice(
                      client: 'Ivan Calderon',
                    )));
          },
          child: const Icon(Icons.add),
        ));
  }
}

class AddInvoice extends StatefulWidget {
  final String client;
  const AddInvoice({super.key, required this.client});

  @override
  State<AddInvoice> createState() => _AddInvoiceState();
}

class _AddInvoiceState extends State<AddInvoice> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Nueva factura de ${widget.client}')),
    );
  }
}

class ViewInvoice extends StatelessWidget {
  const ViewInvoice({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Detalle de factura')),
    );
  }
}
