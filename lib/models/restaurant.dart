import 'package:collection/collection.dart';
import 'package:flutter/cupertino.dart';
import 'package:food_cart/models/cart_item.dart';
import 'package:food_cart/models/food.dart';
import 'package:intl/intl.dart';

class Restaurant extends ChangeNotifier {

  //list of food menu
  final List<Food> _menu = [
    //burgers
    Food(
      name: "Margherita Classic",
      description: "A timeless delight with fresh basil, mozzarella, and tangy tomato sauce.",
      imagePath: "lib/images/burger/burger_1.jpeg",
      price: 7.49,
      category: FoodCategory.burgers,
      availableAddons: [
        Addon(name: "Extra Cheese", price: 0.99),
        Addon(name: "Stuffed Crust", price: 1.99),
        Addon(name: "Garlic Drizzle", price: 0.49),
      ],
    ),

    Food(
      name: "Veggie Supreme",
      description: "Loaded with crisp bell peppers, onions, olives, and mushrooms on a cheesy base.",
      imagePath: "lib/images/burger/burger_2.jpeg",
      price: 9.99,
      category: FoodCategory.burgers,
      availableAddons: [
        Addon(name: "Extra Cheese", price: 0.99),
        Addon(name: "Jalapeños", price: 0.59),
        Addon(name: "Vegan Cheese", price: 1.49),
      ],
    ),

    Food(
      name: "Chicken Overload",
      description: "Tender grilled chicken chunks with smoky BBQ sauce and melted mozzarella.",
      imagePath: "lib/images/burger/burger_3.jpeg",
      price: 12.49,
      category: FoodCategory.burgers,
      availableAddons: [
        Addon(name: "Extra Cheese", price: 0.99),
        Addon(name: "Double Chicken", price: 2.49),
        Addon(name: "Spicy Mayo Drizzle", price: 0.79),
      ],
    ),

    Food(
      name: "Avocado Delight",
      description: "Creamy avocado slices, cherry tomatoes, and herbs on a thin crust base.",
      imagePath: "lib/images/burger/burger_4.jpeg",
      price: 11.49,
      category: FoodCategory.burgers,
      availableAddons: [
        Addon(name: "Extra Avocado", price: 1.99),
        Addon(name: "Goat Cheese", price: 1.49),
        Addon(name: "Basil Pesto Drizzle", price: 0.69),
      ],
    ),

    Food(
      name: "Spicy Gobi Fusion",
      description: "Fusion-style pizza topped with crispy gobi manchurian, spring onions & spicy sauce.",
      imagePath: "lib/images/burger/burger_5.jpg",
      price: 10.99,
      category: FoodCategory.burgers,
      availableAddons: [
        Addon(name: "Extra Gobi", price: 1.29),
        Addon(name: "Chili Flakes", price: 0.29),
        Addon(name: "Mozzarella Burst", price: 1.49),
      ],
    ),


    //--------------------------------------------
    Food(
      name: "Citrus Splash",
      description: "A refreshing burst of fresh orange juice with a twist of lime and chilled ice.",
      imagePath: "lib/images/drinks/drinks_.jpg",
      price: 3.49,
      category: FoodCategory.drinks,
      availableAddons: [
        Addon(name: "Crushed Ice", price: 0.49),
        Addon(name: "Mint Leaves", price: 0.39),
        Addon(name: "Honey Sweetener", price: 0.59),
      ],
    ),

    Food(
      name: "Purple Bliss",
      description: "Sweet grape nectar blended to perfection—rich, juicy, and antioxidant-packed.",
      imagePath: "lib/images/drinks/drinks_1.jpg",
      price: 4.79,
      category: FoodCategory.drinks,
      availableAddons: [
        Addon(name: "Chia Seeds", price: 0.69),
        Addon(name: "Soda Mix", price: 0.59),
        Addon(name: "Lemon Zest", price: 0.29),
      ],
    ),

    Food(
      name: "Classic Cola Fizz",
      description: "Ice-cold carbonated cola to refresh your senses—perfect with every bite.",
      imagePath: "lib/images/drinks/drinks_2.jpg",
      price: 2.99,
      category: FoodCategory.drinks,
      availableAddons: [
        Addon(name: "Extra Ice", price: 0.39),
        Addon(name: "Lime Wedge", price: 0.29),
        Addon(name: "Caffeine Boost", price: 0.49),
      ],
    ),

    Food(
      name: "Midnight Malt",
      description: "A bold, smooth black malt beverage with a rich undertone of roasted grains.",
      imagePath: "lib/images/drinks/drinks_3.jpg",
      price: 5.99,
      category: FoodCategory.drinks,
      availableAddons: [
        Addon(name: "Vanilla Cream Float", price: 1.29),
        Addon(name: "Ice Cubes", price: 0.39),
        Addon(name: "Caramel Swirl", price: 0.79),
      ],
    ),

    Food(
      name: "Zesty Lemonade",
      description: "Chilled nimbu pani made with freshly squeezed lemons, black salt, and mint.",
      imagePath: "lib/images/drinks/drinks_4.jpg",
      price: 3.99,
      category: FoodCategory.drinks,
      availableAddons: [
        Addon(name: "Extra Lemon", price: 0.49),
        Addon(name: "Black Salt", price: 0.19),
        Addon(name: "Sweetener Syrup", price: 0.39),
      ],
    ),


    //--------------------------------------------
    Food(
      name: "Four Cheese Delight",
      description: "A rich blend of mozzarella, cheddar, parmesan, and gouda on a buttery crust.",
      imagePath: "lib/images/pizza/pizza_1.jpeg",
      price: 8.49,
      category: FoodCategory.pizza,
      availableAddons: [
        Addon(name: "Stuffed Crust", price: 1.99),
        Addon(name: "Garlic Dip", price: 0.59),
        Addon(name: "Extra Cheese", price: 0.99),
      ],
    ),

    Food(
      name: "Garden Harvest",
      description: "A colorful medley of fresh veggies: bell peppers, olives, onions & mushrooms.",
      imagePath: "lib/images/pizza/pizza_2.jpeg",
      price: 9.99,
      category: FoodCategory.pizza,
      availableAddons: [
        Addon(name: "Olives", price: 0.69),
        Addon(name: "Sweet Corn", price: 0.49),
        Addon(name: "Pesto Drizzle", price: 0.89),
      ],
    ),

    Food(
      name: "Meat Lovers",
      description: "A protein-packed feast of spicy pepperoni, chicken chunks, and sausage bites.",
      imagePath: "lib/images/pizza/pizza_3.jpeg",
      price: 13.49,
      category: FoodCategory.pizza,
      availableAddons: [
        Addon(name: "Double Meat", price: 2.49),
        Addon(name: "Cheese Burst", price: 1.49),
        Addon(name: "BBQ Sauce", price: 0.69),
      ],
    ),

    Food(
      name: "Avocado Dream",
      description: "Creamy avocado, sun-dried tomatoes & feta cheese on a whole-wheat crust.",
      imagePath: "lib/images/pizza/pizza_4.jpeg",
      price: 11.99,
      category: FoodCategory.pizza,
      availableAddons: [
        Addon(name: "Goat Cheese", price: 1.29),
        Addon(name: "Chili Flakes", price: 0.29),
        Addon(name: "Extra Avocado", price: 1.49),
      ],
    ),

    Food(
      name: "Spicy Gobi Masala",
      description: "A bold Indo-fusion pizza topped with crispy gobi manchurian and spicy chutney.",
      imagePath: "lib/images/pizza/pizza_5.jpeg",
      price: 10.99,
      category: FoodCategory.pizza,
      availableAddons: [
        Addon(name: "Green Chutney Drizzle", price: 0.59),
        Addon(name: "Paneer Cubes", price: 1.29),
        Addon(name: "Coriander Topping", price: 0.39),
      ],
    ),


    //--------------------------------------------
    Food(
      name: "Classic Cheese Fries",
      description: "Golden crispy fries drizzled with melted cheddar and a dash of spice.",
      imagePath: "lib/images/side/sides_1.jpg",
      price: 4.49,
      category: FoodCategory.sides,
      availableAddons: [
        Addon(name: "Extra Cheese", price: 0.99),
        Addon(name: "Chipotle Sauce", price: 0.59),
        Addon(name: "Jalapeños", price: 0.69),
      ],
    ),

    Food(
      name: "Garden Veggie Fries",
      description: "Crispy fries tossed with sautéed veggies, herbs, and light cheese topping.",
      imagePath: "lib/images/side/sides_2.jpg",
      price: 5.99,
      category: FoodCategory.sides,
      availableAddons: [
        Addon(name: "Garlic Aioli", price: 0.79),
        Addon(name: "Sweet Chili Dip", price: 0.69),
        Addon(name: "Zaatar Spice", price: 0.39),
      ],
    ),

    Food(
      name: "Loaded Chicken Fries",
      description: "Fries topped with spicy chicken, sauces, and a generous layer of cheese.",
      imagePath: "lib/images/side/sides_3.jpg",
      price: 8.99,
      category: FoodCategory.sides,
      availableAddons: [
        Addon(name: "Double Chicken", price: 2.49),
        Addon(name: "BBQ Drizzle", price: 0.69),
        Addon(name: "Ranch Dip", price: 0.59),
      ],
    ),

    Food(
      name: "Avocado Crinkle Fries",
      description: "Crispy crinkle-cut fries with smashed avocado and lemon pepper seasoning.",
      imagePath: "lib/images/side/sides_4.jpg",
      price: 6.99,
      category: FoodCategory.sides,
      availableAddons: [
        Addon(name: "Extra Avocado", price: 1.49),
        Addon(name: "Lime Zest", price: 0.39),
        Addon(name: "Chili Flakes", price: 0.29),
      ],
    ),

    Food(
      name: "Spicy Gobi Fries",
      description: "Fusion fries topped with crispy gobi manchurian and spicy garlic sauce.",
      imagePath: "lib/images/side/sides_5.jpeg",
      price: 7.99,
      category: FoodCategory.sides,
      availableAddons: [
        Addon(name: "Extra Gobi", price: 1.29),
        Addon(name: "Chili Garlic Dip", price: 0.59),
        Addon(name: "Mint Sauce", price: 0.49),
      ],
    ),

    //-------------------

    Food(
      name: "Spicy Gobi Salad",
      description: "A crunchy mix of greens and crispy gobi bites tossed in tangy dressing.",
      imagePath: "lib/images/side/salad5.jpeg",
      price: 7.49,
      category: FoodCategory.salads,
      availableAddons: [
        Addon(name: "Extra Gobi", price: 1.29),
        Addon(name: "Tandoori Dressing", price: 0.69),
        Addon(name: "Lemon Juice", price: 0.29),
      ],
    ),

    Food(
      name: "Green Garden Salad",
      description: "A fresh medley of lettuce, cucumber, olives, and tomato with vinaigrette.",
      imagePath: "lib/images/side/salad34.jpeg",
      price: 6.99,
      category: FoodCategory.salads,
      availableAddons: [
        Addon(name: "Feta Cheese", price: 1.49),
        Addon(name: "Balsamic Glaze", price: 0.59),
        Addon(name: "Chickpeas", price: 0.79),
      ],
    ),

    Food(
      name: "Crispy Chickpea Salad",
      description: "Roasted chickpeas tossed with fresh greens and herbed yogurt dressing.",
      imagePath: "lib/images/side/salad3.jpeg",
      price: 7.99,
      category: FoodCategory.salads,
      availableAddons: [
        Addon(name: "Extra Chickpeas", price: 0.89),
        Addon(name: "Toasted Seeds", price: 0.59),
        Addon(name: "Garlic Dressing", price: 0.49),
      ],
    ),

    Food(
      name: "Southwest Avocado Salad",
      description: "Avocado, corn, and black beans on greens with chipotle lime dressing.",
      imagePath: "lib/images/side/salad2.jpeg",
      price: 8.49,
      category: FoodCategory.salads,
      availableAddons: [
        Addon(name: "Tortilla Croutons", price: 0.59),
        Addon(name: "Spicy Ranch", price: 0.79),
        Addon(name: "Shredded Cheese", price: 0.99),
      ],
    ),

    Food(
      name: "Rainbow Quinoa Salad",
      description: "Colorful veggies, quinoa, and lemon vinaigrette for a protein-packed boost.",
      imagePath: "lib/images/side/salad1.jpeg",
      price: 9.49,
      category: FoodCategory.salads,
      availableAddons: [
        Addon(name: "Avocado Slices", price: 1.29),
        Addon(name: "Edamame", price: 0.99),
        Addon(name: "Toasted Almonds", price: 0.89),
      ],
    ),


  ];





  // G E T T E R S
  List<Food> get menu => _menu;
  List<CartItem> get cart => _cart;


  // O P E R A T I O N S

//user card
  final List<CartItem> _cart = [];

  //delivery address (which user can change/update)
  String _deliveryAddress = '99 Hollywood Blv';


  String get deliveryAddress => _deliveryAddress;


  //add to cart
  void addToCart(Food food, List<Addon> selectedAddons) {
    //see if there is a cart item already witht the same food and selected addons

    CartItem? cartItem = _cart.firstWhereOrNull((item) {
      //check if the food items are the same
      bool isSameFood = item.food == food;

      bool isSameAddons =
      ListEquality().equals(item.selectedAddons, selectedAddons);

      return isSameFood && isSameAddons;
    });

    if (cartItem != null) {
      cartItem.quantity++;
    }
    //otherwise, add a new cart item to the cart
    else {
      _cart.add(
          CartItem(
            food: food,
            selectedAddons: selectedAddons,
          )
      );
    }
    notifyListeners();
  }

    //remove from cart
      void removeFromCart(CartItem cartItem) {
        int cartIndex = _cart.indexOf(cartItem);
        if (cartItem != -1) {
          if (_cart[cartIndex].quantity > 1) {
            _cart[cartIndex].quantity--;
          }
          else {
            _cart.removeAt(cartIndex);
          }

        }

        notifyListeners();
      }

    //get total price of cart
      double getTotalPrice() {
        double total = 0.0;
        for (CartItem cartItem in _cart) {
          double itemTotal = cartItem.food.price;

          for(Addon addon in cartItem.selectedAddons){
            itemTotal += addon.price;
        }
          total += itemTotal * cartItem.quantity;

      }
      return total;
    }

    //get total number of items in card

    int getTotalItemCount(){
        int totalItemCount = 0;

        for(CartItem cartItem in _cart){
          totalItemCount += cartItem.quantity;
        }
        return totalItemCount;
    }


    //clear cart
    void clearCart(){
        _cart.clear();
        notifyListeners();
}

  void updateDeliveryAddress(String newAddress){
    _deliveryAddress = newAddress;
    notifyListeners();
  }


  // H E L P E R S
  //
  //   //generate a receipt
  String displayCartReceipt(){
    final receipt = StringBuffer();
    receipt.writeln('Heres your receipt.');
    receipt.writeln();

    //format the date to include up to seconds only
    String formattedDate = DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now());

    receipt.writeln(formattedDate);
    receipt.writeln();
    receipt.writeln('--------------');

    for(final cartItem in _cart){
      receipt.writeln(
        "${cartItem.quantity} x ${cartItem.food.name} - ${_formatPrice(cartItem.food.price)}");

      if(cartItem.selectedAddons.isNotEmpty){
        receipt.writeln('    Add-ons: ${_formatAddons(cartItem.selectedAddons)}');
      }

      receipt.writeln('-------------');
      receipt.writeln();
      receipt.writeln('Total Item: ${getTotalItemCount()}');
      receipt.writeln('Total Price: ${_formatPrice(getTotalPrice())}');
      receipt.writeln();
      //receipt.writeln('Delivering to: $deliveryAddress');

    }

    return receipt.toString();

  }

  String _formatAddons(List<Addon> addons){
    return addons.map(
            (addon) => '${addon.name} '
            '(${_formatPrice((addon.price))}')
        .join(". ");
  }


  //format double value into moeny
  String _formatPrice(double price){
    return '\$${price.toStringAsFixed(2)}';


  //format list of addons into a string summary

  }
}











