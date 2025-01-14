import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shopping_application/models/product.dart';
import 'package:shopping_application/screens/cart_page.dart';
import 'package:shopping_application/widgets/cart_button.dart';
import 'package:shopping_application/widgets/product_list_tile.dart';

Product getById(int id) {
  return products.where((element) => element.id == id).first;
}

final List<Product> products = [
  Product(
    id: 1,
    name: 'Samsung S24',
    price: 120000,
    image: 'assets/images/samsung.jpg',
  ),
  Product(
    id: 2,
    name: 'Redmi Note 8 pro',
    price: 20000,
    image: 'assets/images/redmi.png',
  ),
  Product(
    id: 3,
    name: 'Vivo V50',
    price: 32000,
    image: 'assets/images/vivo.png',
  ),
  Product(
    id: 4,
    name: 'Oppo F15',
    price: 35000,
    image: 'assets/images/oppo.jpg',
  ),
  Product(
    id: 5,
    name: 'Nokia 3310',
    price: 3000,
    image: 'assets/images/nokia.jpg',
  ),
  Product(
    id: 6,
    name: 'Motorola Edge50',
    price: 33000,
    image: 'assets/images/motorola.png',
  ),
  Product(
    id: 7,
    name: 'Samsung s23fe',
    price: 39000,
    image: 'assets/images/s23fe.jpg',
  ),
];

Map<int, int> cartQuantity = {};

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Home Screen',
        ),
        leading: SvgPicture.asset(
          'assets/images/shopping.svg',
          height: 10,
          width: 10,
        ),
        backgroundColor: Colors.blueGrey[200],
      ),
      floatingActionButton: CartButton(
        onTap: () {
          Navigator.of(context).push<Map<int, int>>(
            MaterialPageRoute(
              builder: (context) {
                return CartPage(cart: cartQuantity);
              },
            ),
          ).then((value) {
            if (value != null) {
              setState(() {
                cartQuantity = value;
              });
            }
          });
        },
      ),
      body: ListView.separated(
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
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
      // body: Center(
      //   child: SvgPicture.asset(
      //     'assets/images/shopping.svg',
      //     height: 500,
      //     width: 500,
      //   ),
      // ),
    );
  }

  void removeItemButtonClickEvent(Product product) {
    setState(() {
      if (cartQuantity.containsKey(product.id) &&
          cartQuantity[product.id] as int >= 1) {
        final quantity = cartQuantity[product.id] as int;
        cartQuantity[product.id] = quantity - 1;
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
