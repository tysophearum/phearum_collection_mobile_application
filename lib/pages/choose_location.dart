
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:firstapp/widgets/ProductCard.dart';
import 'package:firstapp/class/productInfo.dart';
import 'package:firstapp/widgets/CategoryCard.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({super.key});

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  List<ProductInfo> productInfos = [];
  List categories =[];
  String selectedCategory = 'Nike';

  void getProduct(int id) async {
    var url = Uri.https('api.tysophearum.tech', 'api/product/category/$id');
    Response response = await get(url);
    Map productResponse = jsonDecode(response.body);
    List products = productResponse['products'];
    setState(() {
      productInfos = [];
      for (var product in products) {
        productInfos.add(ProductInfo(name: product['name'], image: 'https://api.tysophearum.tech${product['images'][0]['image_path']}', price: product['price']));
      }
    });
  }

  void getCategory() async {
    var url = Uri.https('api.tysophearum.tech', 'api/category');
    Response response = await get(url);
    categories = jsonDecode(response.body);
  }

  @override
  void initState() {
    super.initState();
    getProduct(1);
    getCategory();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(selectedCategory),
        backgroundColor: Colors.orange,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            GridView.count(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              primary: false,
              padding: const EdgeInsets.all(20),
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              crossAxisCount: 2,
              children: productInfos.map((productInfo) => ProductCard(productInfo: productInfo)).toList(),
            ),
          ],
        ),
      ),
      bottomNavigationBar: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: categories.map((category) => CategoryCard(
            onPress: (){
              setState(() {
                selectedCategory = category['name'];
                getProduct(category['id']);
              });
            },
            name: category['name']
          )).toList(),
        ),
      ),
    );
  }
}


