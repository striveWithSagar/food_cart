import 'package:flutter/material.dart';
import 'package:food_cart/components/my_drawer_tile.dart';

import '../pages/setting_page.dart';
import '../services/auth/auth_service.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  void logOut(){
    final _authService = AuthService();
    _authService.signOut();


  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.background,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 100.0),
            child: Icon(
              Icons.lock_open_rounded,
              size: 80,
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(25.0),
            child: Divider(
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
          ),

          //home list title
          MyDrawerTile(
              text: 'H O M E',
              icon: Icons.home ,
              onTap: () => Navigator.pop(context),
          ),

          //settings list title
          MyDrawerTile(
            text: 'S E T T I N G S',
            icon: Icons.settings ,
            onTap: () {
              Navigator.pop(context);
              Navigator.push(context,
              MaterialPageRoute(
                builder: (context) => SettingPage(),
              ));
            },
          ),

          const Spacer(),


          //log out list title
          MyDrawerTile(
            text: 'L O G  O U T',
            icon: Icons.logout ,
            onTap: () {
              logOut();
              Navigator.pop(context);
            },
          ),

          const SizedBox(height: 25,)

        ],
      ),
    );
  }
}
