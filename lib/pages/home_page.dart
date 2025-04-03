import 'package:flutter/material.dart';
import 'package:food_cart/components/my_current_location.dart';
import 'package:food_cart/components/my_description_box.dart';
import 'package:food_cart/models/food.dart';
import 'package:provider/provider.dart';

import '../components/my_drawer.dart';
import '../components/my_food_tile.dart';
import '../components/my_sliver_app.dart';
import '../components/my_tap_bar.dart';
import '../models/restaurant.dart';
import 'food_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {

  //tab bar controller
  late TabController _tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: FoodCategory.values.length, vsync: this);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _tabController.dispose();
    super.dispose();
  }

  //sort andd return a list of food items that belong to a specific category
  List<Food> _filterMenuByCategory(FoodCategory category, List<Food> fullMenu){
    return fullMenu.where((food) => food.category == category).toList();
  }

  //return list of food in given category
  List<Widget> getFoodInThisCategory(List<Food> fullMenu){
    return FoodCategory.values.map((category) {

      //get category menu
      List<Food> categoryMenu = _filterMenuByCategory(category, fullMenu);

    return ListView.builder(
      itemCount: categoryMenu.length,
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.zero,
      itemBuilder: (context, index){

        //get individual food
        final food = categoryMenu[index];

        //return food tile
        return FoodTile(
            food: food,
            onTap: () =>
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => FoodPage(food: food),
                    )
                )
        
        );
        // return ListTile(
        //   title: Text(categoryMenu[index].name),
        // );
      },
    );

    }).toList();
  }




  @override
  Widget build(BuildContext context) {

    // check if _tabController is not null and mounted
    if (!mounted || _tabController.length == 0) {
      return const SizedBox(); // or a loading indicator
    }

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.secondary,
      drawer: MyDrawer(),
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          MySliverApp(
                    title: MyTabBar(tabController: _tabController),
                    child:
                      Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [

                          Divider(
                            indent: 25,
                            endIndent: 25,
                            color: Theme.of(context).colorScheme.secondary,
                          ),


                          //my location
                          const MyCurrentLocation(),

                          //description box
                          const MyDescriptionBox(),

                        ],
                      )
              )
              ],

        body: Consumer<Restaurant>(
          builder: (context, restaurant, child) =>
            TabBarView(
            controller: _tabController,
              children: getFoodInThisCategory(restaurant.menu),
          ),
        ),
      ),
    );
  }
}
