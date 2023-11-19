import 'package:flutter/material.dart';
import 'package:firstapp/class/productInfo.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
    required this.productInfo
  });

  final ProductInfo productInfo;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.orange,
      ),
      child: Column(
        children: <Widget>[
          const SizedBox(height: 30,),
          Image.network(productInfo.image),
          Container(
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.symmetric(horizontal: 5),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              children:<Widget> [
                Text(
                  productInfo.name,
                  style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold
                  ),
                ),
                Text(
                  '\$${productInfo.price}',
                  style: const TextStyle(
                      fontSize: 10
                  ),
                )
              ],
            ),
          )
        ],
      )
    );
  }
}
