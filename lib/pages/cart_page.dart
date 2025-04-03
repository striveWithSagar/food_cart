import 'package:flutter/material.dart';
import 'package:food_cart/components/custome_buttons.dart';
import 'package:food_cart/components/my_cart_tile.dart';
import 'package:food_cart/pages/payment_page.dart';
import 'package:provider/provider.dart';

import '../models/restaurant.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<Restaurant>(builder: (context, restaurant, child){
      //cart
      final userCart = restaurant.cart;

      //scaffold
      return Scaffold(
        appBar: AppBar(
          title: Text('Cart'),
          backgroundColor: Colors.transparent,
          foregroundColor: Theme.of(context).colorScheme.inversePrimary,
          actions: [
            //clear all cart
            IconButton(
                onPressed: () {
                  showDialog(
                      context: context ,
                      builder: (context) => AlertDialog(
                        title: Text("Are you sure you want to clear the cart?"),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: const Text("Cancel"),
                          ),

                          //yes button
                          TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                                restaurant.clearCart();
                              },
                              child: const Text('Yes'),
                          )
                        ],
                      ),
                  );
                },
                icon: const Icon(Icons.delete),
            )

          ],
        ),
        body: Column(
          children: [


            //list of cart
            Expanded(
              child: Column(
              children: [
                userCart.isEmpty ?
                const Expanded(
                    child: Center(
                        child: Text("Cart is empty....")))
                    : Expanded(
                          child: ListView.builder(
                              itemCount: userCart.length,
                              itemBuilder: (context, index) {
              
                                //get individual cart item
                                final cartItem = userCart[index];
                                //return cart title UI
              
                                return ListTile(
              
                                  title:MyCartTile(cartItem: cartItem),
                                );
                              }
                          )
                      )
              ],
                        ),
            ),
            
            
            MyButton(
              text: "Go to checkout",
                onTap: () =>
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => PaymentPage(),
                        )
                    )
            ),

            const SizedBox(height: 25,)
          ]
        ),


      );
    });
  }
}
