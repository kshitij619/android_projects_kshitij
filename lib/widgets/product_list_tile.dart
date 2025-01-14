import 'package:flutter/material.dart';
import 'package:shopping_application/models/product.dart';

class ProductListTile extends StatelessWidget {
  const ProductListTile({
    super.key,
    required this.product,
    required this.onTapAdd,
    required this.onTapRemove,
    required this.quantity,
  });

  final Product product;
  final void Function() onTapAdd;
  final void Function() onTapRemove;
  final String quantity;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image(
            image: AssetImage(product.image),
            width: 100,
            height: 100,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.name,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                Text(
                  '${product.currency} ${product.price.toString()}',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        color: Colors.green,
                        fontWeight: FontWeight.w700,
                      ),
                ),
              ],
            ),
          ),
          Spacer(),
          Row(
            children: [
              IconButton(
                icon: Icon(Icons.remove_circle_outline_rounded),
                iconSize: 28,
                onPressed: onTapRemove,
              ),
              Text(
                quantity,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              IconButton(
                icon: Icon(Icons.add_circle_outline_rounded),
                iconSize: 28,
                onPressed: onTapAdd,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
