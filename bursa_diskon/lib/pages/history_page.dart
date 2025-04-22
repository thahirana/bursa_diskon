import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:bursa_diskon/model/cart_model.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    final history = Provider.of<CartModel>(context).checkoutHistory;

    return Scaffold(
      appBar: AppBar(
        title: Text('Checkout History'),
      ),
      body: history.isEmpty
          ? Center(child: Text('Belum ada pembelian.'))
          : ListView.builder(
              itemCount: history.length,
              itemBuilder: (context, index) {
                final item = history[index];

                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    elevation: 5,
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Menampilkan tanggal checkout
                          Text(
                            'Tanggal: ${item['date']}',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 8),

                          // Menampilkan daftar produk yang dibeli
                          Text(
                            'Produk: ',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                          Column(
                            children: List.generate(item['items'].length, (i) {
                              final cartItem = item['items'][i];
                              return ListTile(
                                leading: Image.asset(
                                  cartItem['imagePath'],
                                  height: 36,
                                ),
                                title: Text(cartItem['name']),
                                subtitle: Text(
                                  "Rp ${cartItem['price']} x ${cartItem['quantity']}",
                                ),
                              );
                            }),
                          ),

                          // Menampilkan total harga
                          SizedBox(height: 8),
                          Text(
                            'Total: Rp ${item['total']}',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
