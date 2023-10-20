import 'package:flutter/material.dart';
import 'package:merendero_suyapa/presentation/add_invoice.dart';
import 'package:merendero_suyapa/presentation/view_invoice.dart';

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
