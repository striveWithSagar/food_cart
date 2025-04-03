import 'package:flutter/material.dart';
import 'package:food_cart/components/my_receipt.dart';
import 'package:food_cart/models/restaurant.dart';
import 'package:food_cart/services/database/firestore.dart';
import 'package:provider/provider.dart';

class DeliveryProgressPage extends StatefulWidget {
  const DeliveryProgressPage({super.key});

  @override
  State<DeliveryProgressPage> createState() => _DeliveryProgressPageState();
}

class _DeliveryProgressPageState extends State<DeliveryProgressPage> {

  //get access to database
  FirestoreService db = FirestoreService();


  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    //if we get to this page, submit order to firestore db
    String receipt = context.read<Restaurant>().displayCartReceipt();
    db.saveOrderToDatabase(receipt);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Delivery in progess'),
      ),
      bottomNavigationBar: _buildBottomNavBar(context),

      body: Column(
        children: [
          MyReceipt(),
        ],
      ),
    );
  }

  //Customer bottom nav bar - message / call delivery driver
Widget _buildBottomNavBar(BuildContext context){
    return Container(
      height: 100,
        decoration:
        BoxDecoration(
            color: Theme.of(context).colorScheme.secondary,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(40),
              topRight: Radius.circular(40),
            ),
        ),

      padding: EdgeInsets.all(25),
      child: Row(

        children: [

          //profile pic of driver
          Container(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.background,
              shape: BoxShape.circle,
            ),

            child: IconButton(
              onPressed: () {},
              icon: Icon(Icons.person),
            ),
          ),

          const SizedBox(width: 10,),

          //driver details
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Mitch Koko', style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: Theme.of(context).colorScheme.inversePrimary,
              ),),

              Text('Driver', style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
              ),
              ),
            ],
          ),

          const Spacer(),

          Row(
            children: [
              //message button
              Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.background,
                  shape: BoxShape.circle,
                ),

                child: IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.message),
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),

              const SizedBox(width: 10,),

              //call button
              Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.background,
                  shape: BoxShape.circle,
                ),

                child: IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.call),
                  color: Colors.green,
                ),
              ),

            ],
          )




        ],
      ),
    );



}
}
