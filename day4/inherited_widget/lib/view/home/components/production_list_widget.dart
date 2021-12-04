
import 'package:flutter/material.dart';
import 'package:inherited_widget/repository/data.dart';
import 'package:inherited_widget/state_manager/app_state.dart';
import 'production_tile.dart';


class ProductListWidget extends StatelessWidget {
  ProductListWidget({Key? key}) : super(key: key);

  void _handleAddToCart(String id, BuildContext context) {
    AppStateWidget.of(context).addToCart(id);
  }

  void _handleRemoveFromCart(String id, BuildContext context) {
    AppStateWidget.of(context).removeFromCart(id);
  }

  Widget _buildProductTile(String id, BuildContext context) {
    return ProductTile(
      product: Server.getProductById(id),
      purchased: AppStateScope.of(context).itemsInCart.contains(id),
      onAddToCart: () => _handleAddToCart(id, context),
      onRemoveFromCart: () => _handleRemoveFromCart(id, context),
    );
  }

  @override
  Widget build(BuildContext context) {
    final List<String> productList = AppStateScope.of(context).productList;
    return Column(
      children: productList
          .map((String id) => _buildProductTile(id, context))
          .toList(),
    );
  }
}


// class ProductListWidget extends StatefulWidget {
//   const ProductListWidget({Key? key}) : super(key: key);
//   @override
//   ProductListWidgetState createState() => ProductListWidgetState();
// }

// class ProductListWidgetState extends State<ProductListWidget> {
//   List<String> get productList => _productList;
//   List<String> _productList = Server.getProductList();
//   set productList(List<String> value) {
//     setState(() {
//       _productList = value;
//     });
//   }

//   Set<String> get itemsInCart => _itemsInCart;
//   Set<String> _itemsInCart = <String>{};
//   set itemsInCart(Set<String> value) {
//     setState(() {
//       _itemsInCart = value;
//     });
//   }

//   void _handleAddToCart(String id) {
//     itemsInCart = _itemsInCart..add(id);
//     shoppingCart.currentState!.itemsInCart = itemsInCart;
//   }

//   void _handleRemoveFromCart(String id) {
//     itemsInCart = _itemsInCart..remove(id);
//     shoppingCart.currentState!.itemsInCart = itemsInCart;
//   }

//   Widget _buildProductTile(String id) {
//     return ProductTile(
//       product: Server.getProductById(id),
//       purchased: itemsInCart.contains(id),
//       onAddToCart: () => _handleAddToCart(id),
//       onRemoveFromCart: () => _handleRemoveFromCart(id),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: productList.map(_buildProductTile).toList(),
//     );
//   }
// }
