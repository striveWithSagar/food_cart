import 'package:flutter/material.dart';

import '../pages/cart_page.dart';


class MySliverApp extends StatelessWidget {
  final Widget child;
  final Widget title;

  const MySliverApp({
    super.key,
    required this.child,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 340,
      collapsedHeight: 120,
      floating: false,
      pinned: true,

      actions: [
        //cart button
        IconButton(
          onPressed: () =>
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CartPage(),
                  )
              ),
          icon: const Icon(Icons.shopping_cart_outlined),
        )
      ],



      backgroundColor: Theme.of(context).colorScheme.background,
      foregroundColor: Theme.of(context).colorScheme.inversePrimary,
      title: Text("Sunset Dinner"),
      flexibleSpace: FlexibleSpaceBar(
        background: Padding(
          padding: const EdgeInsets.only(bottom: 50.0),
          child: child,
        ),
        title: title,
        centerTitle: true,
        titlePadding: const EdgeInsets.only(left: 0, right: 0, top: 0),
        expandedTitleScale: 1 ,

      ),
    );
  }
}
