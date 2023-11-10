import 'package:flutter/material.dart';

class CardInformationProduct extends StatelessWidget {
  final String productName;
  final int quantity;
  final double price;
  final double total;

  const CardInformationProduct({
    super.key,
    required this.productName,
    required this.quantity,
    required this.price, required this.total,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: const Border(
          top: BorderSide(
            color: Colors.black,
          ),
          bottom: BorderSide(color: Colors.black),
          left: BorderSide(color: Colors.black),
          right: BorderSide(color: Colors.black)),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Producto: $productName'),
            Text('Cantidad: $quantity'),
            Text('Precio: L.$price'),
            const Divider(
              height: 20,
              color: Colors.black,
            ),
             Text(
              'Total: $total',
              style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  backgroundColor: Colors.yellow),
            )
          ],
        ),
      ),
    );
  }
}
