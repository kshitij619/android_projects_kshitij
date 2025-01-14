import 'package:flutter/material.dart';
import 'package:shopping_application/models/product.dart';
import 'package:shopping_application/screens/home_screen.dart';
import 'package:shopping_application/widgets/product_list_tile.dart';

class CartPage extends StatefulWidget {
  const CartPage({
    super.key,
    required this.cart,
  });

  final Map<int, int> cart;

  @override
  State<StatefulWidget> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  Map<int, int> cart = {};

  @override
  void initState() {
    super.initState();

    cart = widget.cart;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Your cart',
          ),
          leading: BackButton(
            onPressed: () {
              setState(() {
                Navigator.of(context).pop(cart);
              });
            },
          ),
        ),
        body: ListView.separated(
          itemCount: cart.entries.length,
          itemBuilder: (context, index) {
            final cartEntry = cart.entries.elementAt(index);
            final product = getById(cartEntry.key);
            return ProductListTile(
              product: product,
              onTapAdd: () => addItemButtonClickEvent(product),
              onTapRemove: () => removeItemButtonClickEvent(product),
              quantity: getQuantity(product),
            );
          },
          separatorBuilder: (context, index) {
            return Divider(
              height: 2,
            );
          },
        ),
      ),
    );
  }

  void removeItemButtonClickEvent(Product product) {
    setState(() {
      if (cartQuantity.containsKey(product.id)) {
        if (cartQuantity[product.id] as int > 1) {
          final quantity = cartQuantity[product.id] as int;
          cartQuantity[product.id] = quantity - 1;
        } else {
          cartQuantity.remove(product.id);
        }
      }
    });
  }

  void addItemButtonClickEvent(Product product) {
    setState(() {
      if (cartQuantity.containsKey(product.id)) {
        final quantity = cartQuantity[product.id] as int;
        cartQuantity[product.id] = quantity + 1;
      } else {
        cartQuantity[product.id] = 1;
      }
    });
  }

  String getQuantity(product) {
    return cartQuantity.containsKey(product.id)
        ? cartQuantity[product.id].toString()
        : '0';
  }
}
