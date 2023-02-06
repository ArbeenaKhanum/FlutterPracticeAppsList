import 'package:flutter/cupertino.dart';

import 'package:provider/provider.dart';
import 'package:shop_app/widgets/product_item.dart';
import '../providers/products.dart';

class ProductsGridView extends StatelessWidget {
  final bool showFavs;

  ProductsGridView(this.showFavs);

  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<Products>(context);
    final products = showFavs ? productsData.favoriteItems : productsData.items;

    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemBuilder: (ctx, index) => ChangeNotifierProvider.value(
        value: products[index],
        child: ProductItem(
            /*products[index].id, products[index].title,
            products[index].imageUrl*/
            ),
      ),
      itemCount: products.length,
      padding: const EdgeInsets.all(10),
    );
  }
}
