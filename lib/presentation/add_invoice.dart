import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:merendero_suyapa/presentation/widgets/card_information_product.dart';

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

  TextEditingController dateController = TextEditingController();

  @override
  void initState() {
    dateController.text = ""; //set the initial value of text field
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              TextField(
                onTap: () async {
                  DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(), //get today's date
                      firstDate: DateTime(
                          2000), //DateTime.now() - not to allow to choose before today.
                      lastDate: DateTime(2101));

                  if (pickedDate != null) {
                    String formattedDate = DateFormat('yyyy-MM-dd').format(
                        pickedDate); // format date in required form here we use yyyy-MM-dd that means time is removed

                    setState(() {
                      dateController.text =
                          formattedDate; //set foratted date to TextField value.
                    });
                  } else {}
                },
                controller:
                    dateController, //editing controller of this TextField
                decoration: const InputDecoration(
                    icon: Icon(Icons.calendar_today), //icon of text field
                    labelText: "Ingresar Fecha" //label text of field
                    ),
              ),
              const SizedBox(
                height: 15,
              ),
              const Divider(
                height: 20,
                color: Colors.black,
              ),
              const SizedBox(
                height: 15,
              ),
              Column(
                children: [
                  const Text(
                    'Informacion de producto',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic),
                  ),
                  const TextField(
                    decoration: InputDecoration(
                        icon: Icon(Icons
                            .store_mall_directory_outlined), //icon of text field
                        labelText: "Ingresar producto" //label text of field
                        ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const TextField(
                    decoration: InputDecoration(
                        icon: Icon(Icons.numbers), //icon of text field
                        labelText: "Cantidad" //label text of field
                        ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const TextField(
                    decoration: InputDecoration(
                        icon: Icon(Icons.monetization_on), //icon of text field
                        labelText: "Precio" //label text of field
                        ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ElevatedButton(
                          onPressed: () {},
                          child: const Text("Agregar producto")),
                    ],
                  )
                ],
              ),
              const Divider(
                height: 20,
                color: Colors.black,
              ),
              const SizedBox(
                height: 15,
              ),
              const Column(
                children: [
                  Text(
                    'Informacion de factura',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  CardInformationProduct(
                  productName: 'Baleadas con huevo', 
                  quantity: 2, 
                  price: 25, 
                  total: 50,),
                  CardInformationProduct(
                  productName: 'Baleadas con pollo', 
                  quantity: 1, 
                  price: 30, 
                  total: 30,),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'Total L. 75',
                        style: TextStyle(
                            fontSize: 20,
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                      onPressed: () {},
                      child: const Text(
                        "Guardar factura",
                      )),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }
}


