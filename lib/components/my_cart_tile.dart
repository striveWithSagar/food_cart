import 'package:flutter/material.dart';
import 'package:food_cart/components/my_quantity_selector.dart';
import 'package:food_cart/models/restaurant.dart';
import 'package:provider/provider.dart';

import '../models/cart_item.dart';

class MyCartTile extends StatelessWidget {

  final CartItem cartItem;

  const MyCartTile({
    super.key,
    required this.cartItem,

  });

  @override
  Widget build(BuildContext context) {
    return Consumer<Restaurant>(
      builder: (context, restaurant, child) => Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary,
          borderRadius: BorderRadius.circular(8),
        ),
        margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //food Image
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      cartItem.food.imagePath,
                      height: 50,
                      width: 50,
                    ),
                  ),

                  const SizedBox(width: 10,),

                  //name and price
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //food name
                      Text(cartItem.food.name),

                      //price
                      Text('\$'+ cartItem.food.price.toString(),
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.primary
                        ),
                      ),

                      const SizedBox(height: 10,),

                      QuantitySelector(
                          quantity: cartItem.quantity,
                          food: cartItem.food,
                          onDecrement: () {
                            restaurant.removeFromCart(cartItem);
                          },
                          onIncrement: () {
                            restaurant.addToCart(
                                cartItem.food,
                                cartItem.selectedAddons
                            );
                          }
                      )

                    ],
                  ),

                  //increment and decrement quantity

                ],
              ),
            ),

            //addons
            SizedBox(
              height: cartItem.selectedAddons.isEmpty ? 0 : 60,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.only(left: 10, bottom: 10, right: 10),
                children: cartItem.selectedAddons
                    .map(
                      (addon) =>
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: FilterChip(
                      label: Row(
                        children: [
                          //addon name
                          Text(addon.name),

                          //addon price
                          Text('  \$${addon.price}', style: TextStyle(
                            color: Theme.of(context).colorScheme.primary,
                          ),),
                        ],
                      ),
                    shape: StadiumBorder(
                      side: BorderSide(
                        color: Theme.of(context).colorScheme.primary,
                      )
                    ),
                    onSelected: (value) {},
                    backgroundColor: Theme.of(context).colorScheme.secondary,
                    labelStyle: TextStyle(
                      color: Theme.of(context).colorScheme.inversePrimary,
                      fontSize: 12,
                    ),
                  ),
                ),
                ).toList(),
              ),
            )
          ],
        ),
      )
    );
  }
}
