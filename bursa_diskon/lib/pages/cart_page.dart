import 'package:bursa_diskon/model/cart_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
        title: Text('My Cart'),
        actions: [
          IconButton(
            icon: Icon(Icons.history),
            tooltip: 'Lihat Riwayat',
            onPressed: () {
              Navigator.pushNamed(context, '/history');
            },
          ),
        ],
      ),
      body: Consumer<CartModel>(
        builder: (context, value, child) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Text(
                  "My Cart",
                  style: GoogleFonts.notoSerif(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              // list of cart items
              Expanded(
                child: ListView.builder(
                  itemCount: value.cartItems.length,
                  padding: EdgeInsets.all(12),
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: ListTile(
                          leading: Image.asset(
                            value.cartItems[index] ['imagePath'], 
                            height: 36,
                          ),
                          title: Text(value.cartItems[index] ['name']),
                          subtitle: Text('\$' + value.cartItems[index] ['price']),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              // Button -
                              IconButton(
                                icon: Icon(Icons.remove),
                                onPressed: () {
                                  Provider.of<CartModel>(context, listen: false)
                                      .decreaseQuantity(index);
                                },
                              ),
                              
                              // Quantity
                              Text(
                                value.cartItems[index]['quantity'].toString(),
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              
                              // Button +
                              IconButton(
                                icon: Icon(Icons.add),
                                 onPressed: () {
                                    Provider.of<CartModel>(context, listen: false)
                                        .increaseQuantity(index);
                                  },
                              ),
                              
                              // Cancel/Delete item
                              IconButton(
                                icon: Icon(Icons.cancel), 
                                onPressed: () =>  
                                  Provider.of<CartModel>(context, listen: false)
                                      .removeItemFromCart(index),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),

              // total + pay now
              Padding(
                padding: const EdgeInsets.all(36.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(8),
                  ), 
                  padding: EdgeInsets.all(24),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // price
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Total Price",
                            style: TextStyle(color: Colors.green[100]),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            '\$' + value.calculateTotal(),
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      // pay now button
                      GestureDetector(
                        onTap: () {
                          value.saveCheckoutHistory();
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: Text("Checkout Successful"),
                                content: Text("Your order has been placed!"),
                                actions: <Widget>[
                                  TextButton(
                                    child: Text("OK"),
                                    onPressed: () {
                                      value.clearCart();
                                      Navigator.of(context).pop(); // nutup alert
                                      Navigator.pushNamed(context, '/history'); // pindah ke history page
                                    },                                  
                                  ),
                                ],
                              );
                            },
                          );
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.green.shade100),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          padding: EdgeInsets.all(12),
                          child: Row(
                            children: const [
                              Text(
                                "Checkout",
                                style: TextStyle(color: Colors.white),
                              ),
                              Icon(
                                Icons.arrow_forward_ios,
                                size: 16,
                                color: Colors.white,
                              ),
                            ],
                          ),
                        ),
                      ),                    
                    ],
                  ),
                ),
              )
            ],
          );
        },
      ),
    );
  }
}