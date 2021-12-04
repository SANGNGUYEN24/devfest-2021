
import 'package:flutter/material.dart';
import 'package:inherited_widget/repository/data.dart';
import 'production_tile.dart';
import 'shoping_cart_icon.dart';

final GlobalKey<ShoppingCartIconState> shoppingCart =
    GlobalKey<ShoppingCartIconState>();
final GlobalKey<ProductListWidgetState> productList =
    GlobalKey<ProductListWidgetState>();

class ProductListWidget extends StatefulWidget {
  const ProductListWidget({Key? key}) : super(key: key);
  @override
  ProductListWidgetState createState() => ProductListWidgetState();
}

class ProductListWidgetState extends State<ProductListWidget> {
  List<String> get productList => _productList;
  List<String> _productList = Server.getProductList();
  set productList(List<String> value) {
    setState(() {
      _productList = value;
    });
  }

  Set<String> get itemsInCart => _itemsInCart;
  Set<String> _itemsInCart = <String>{};
  set itemsInCart(Set<String> value) {
    setState(() {
      _itemsInCart = value;
    });
  }

  void _handleAddToCart(String id) {
    itemsInCart = _itemsInCart..add(id);
    shoppingCart.currentState!.itemsInCart = itemsInCart;
  }

  void _handleRemoveFromCart(String id) {
    itemsInCart = _itemsInCart..remove(id);
    shoppingCart.currentState!.itemsInCart = itemsInCart;
  }

  Widget _buildProductTile(String id) {
    return ProductTile(
      product: Server.getProductById(id),
      purchased: itemsInCart.contains(id),
      onAddToCart: () => _handleAddToCart(id),
      onRemoveFromCart: () => _handleRemoveFromCart(id),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: productList.map(_buildProductTile).toList(),
    );
  }
}
