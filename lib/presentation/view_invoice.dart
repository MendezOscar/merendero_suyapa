import 'package:flutter/material.dart';
import 'package:merendero_suyapa/presentation/widgets/card_information_product.dart';

class ViewInvoice extends StatelessWidget {
  const ViewInvoice({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Detalle de factura')),
      body: const Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            SizedBox(height: 20),
            Text('Fecha: 9/15/23',
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic)),
            SizedBox(height: 20),
            CardInformationProduct(
                  productName: 'Baleadas con huevo', 
                  quantity: 2, 
                  price: 25, 
                  total: 50,),
            Divider(
              height: 50,
              color: Colors.black,
            ),
            Text('Total final: L.50',style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold) ,)
          ],
        ),
      ),
    );
  }
}
