import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/models/product.dart';
import 'package:shop/models/product_list.dart';
import 'package:shop/widgets/product_item.dart';

class ProductGrid extends StatelessWidget {
  final bool? showFavoriteOnly;

  const ProductGrid({
    Key? key,
    this.showFavoriteOnly,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ProductList>(context); //obtendo o provider
    final List<Product> loadedProduct = showFavoriteOnly == true
        ? provider.favoriteItems
        : provider.items; //obtendo a lista de produtos

    return GridView.builder(
      padding: const EdgeInsets.all(10),
      itemCount: loadedProduct.length, //quantidade de produto no grid
      //o que vai ser mostrado
      itemBuilder: (context, index) => ChangeNotifierProvider.value(
        value: loadedProduct[index],
        child: const ProductItem(),
      ),
      //como vai ser mostrado
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
    );
  }
}
