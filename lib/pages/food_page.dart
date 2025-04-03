import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../components/custome_buttons.dart';
import '../models/food.dart';
import '../models/restaurant.dart';

class FoodPage extends StatefulWidget {

  final Map<Addon, bool> selectedAddons = {};
  final Food food;

  FoodPage({
    super.key,
    required this.food
  }) {

    //initialize the selected addons to be false
    for(Addon addon in food.availableAddons){
        selectedAddons[addon] = false;
    }
  }


  @override
  State<FoodPage> createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {


  //method to add to cart
  void addToCart(Food food, Map<Addon, bool> selectedAddons){

    //close the current food page to go back to menu
    Navigator.pop(context);

    List<Addon> currentlySelectedAddons = [];
    for(Addon addon in widget.food.availableAddons){
      if(widget.selectedAddons[addon] == true){
        currentlySelectedAddons.add(addon);
      }
    }
    context.read<Restaurant>().addToCart(food, currentlySelectedAddons);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [Scaffold(
        body: SingleChildScrollView(
          child: Column(
              children: [
          
                //food image
                Image.asset(widget.food.imagePath),
          
                Padding(
                  padding: const EdgeInsets.all(26.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
          
                    children: [
                      //food name
                      Text(
                          widget.food.name,
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.primary,
                            fontWeight: FontWeight.bold,
                          fontSize: 20
                        ),
                      ),
          
                      //food price
                      Text(
                        '\$'+ widget.food.price.toString(),
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.primary,
                            fontSize: 16
                        ),
                      ),
          
                      const SizedBox(height: 10,),
          
                      //food description
                      Text(widget.food.description,),
          
                      const SizedBox(height: 10,),
          
                      Divider(
                        indent: 25,
                        endIndent: 25,
                        color: Theme.of(context).colorScheme.secondary,
                      ),
          
                      const SizedBox(height: 10,),
                      
                      Text(
                        'Add-ons',
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.inversePrimary,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                        ),
                      ),
          
                      const SizedBox(height: 10,),
          
          
                      //addons
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                          borderRadius: BorderRadius.circular(8)
                        ),
                        child: ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          padding: EdgeInsets.zero,
                          itemCount: widget.food.availableAddons.length,
                          itemBuilder: (context, index){
                            Addon addon = widget.food.availableAddons[index];
          
                            return CheckboxListTile(
                              title: Text(addon.name, style: TextStyle(

                              ),),
                              subtitle: Text(
                                '\$${addon.price}',
                                style: TextStyle(
                                  color: Theme.of(context).colorScheme.inversePrimary,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              value: widget.selectedAddons[addon],
                              onChanged: (bool? value) {
                                setState(() {
                                  widget.selectedAddons[addon] = value!;
      
                                });
                              },
                            );
                          },
                        ),
                      )
                    ],
                  ),
                ),
                //button to add to cart
                MyButton(
                    onTap: () => addToCart(
                        widget.food,
                        widget.selectedAddons
                    ),
                    text: 'Add to cart'
                ),
      
                const SizedBox(height: 25,)
          
          
              ],
          ),
        ),
      ),

        //back Button
        SafeArea(

          child: Opacity(
            opacity: 0.7,
            child: Container(
              margin: const EdgeInsets.only(left: 25),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.secondary,
                shape: BoxShape.circle,
              ),
              child: IconButton(
                icon: Icon(Icons.arrow_back_ios_new_rounded),
                onPressed: ()=> Navigator.pop(context),
              ),
            ),
          ),
        )
    ]
    );
  }
}
