import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/restaurant.dart';

class MyCurrentLocation extends StatelessWidget {
  const MyCurrentLocation({super.key});




  void openLocationSearchBox(BuildContext context){
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text("Your Location"),
          content: TextField(
            decoration: InputDecoration(
              hintText: "Enter Address...",
            ),
          ),
          actions: [
            //cancel button
            MaterialButton(
                onPressed: ()=> Navigator.pop(context),
                child: const Text('Cancel'),
            ),

            //save button
            MaterialButton(
              onPressed: (){
              //update delivery address


                  Navigator.pop(context);},
              child: const Text('Save'),

            ),
          ],
        ));

  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Deliver now",
            style: TextStyle(
              color: Theme.of(context).colorScheme.primary,
            ),),
          GestureDetector(
            onTap: () => openLocationSearchBox(context),
            child: Row(
              children: [

                
                Consumer<Restaurant>(builder: (context, restaurant, child) =>
                    Text(
                  restaurant.deliveryAddress,
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.inversePrimary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                ),

                Icon(Icons.keyboard_arrow_down_rounded),
              ],
            ),
          )
        ],
      ),
    );
  }
}
