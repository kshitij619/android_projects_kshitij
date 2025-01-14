import 'package:flutter/material.dart';

class CartButton extends StatelessWidget {
  const CartButton({
    super.key,
    required this.onTap,
  });

  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap();
      },
      borderRadius: BorderRadius.all(Radius.circular(10)),
      splashColor: Colors.redAccent,
      child: Ink(
        width: 60,
        height: 60,
        decoration: BoxDecoration(
          color: Colors.blueAccent,
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: const Icon(
          Icons.shopping_bag_outlined,
          color: Colors.white,
          size: 25,
        ),
      ),
    );
  }
}
