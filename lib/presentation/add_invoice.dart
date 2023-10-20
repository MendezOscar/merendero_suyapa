import 'package:flutter/material.dart';

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
      body: const Details(),
    );
  }
}

class Details extends StatefulWidget {
  const Details({super.key});

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextFormField(
            decoration: const InputDecoration(
              hintText: 'Fecha',
            ),
          ),
          TextFormField(
            decoration: const InputDecoration(
              hintText: 'Total',
            ),
          ),
          TextFormField(
            decoration: const InputDecoration(
              hintText: 'Descripcion',
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: ElevatedButton(
              onPressed: () {},
              child: const Text('Agregar'),
            ),
          ),
        ],
      ),
    );
  }
}
