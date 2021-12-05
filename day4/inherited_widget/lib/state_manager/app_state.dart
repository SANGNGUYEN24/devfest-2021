import 'package:flutter/cupertino.dart';
import 'package:inherited_widget/repository/data.dart';

class AppState {
  AppState({
    required this.productList,
    this.itemsInCart = const <String>{},
  });

  final List<String> productList;
  final Set<String> itemsInCart;

  AppState copyWith({
    List<String>? productList,
    Set<String>? itemsInCart,
  }) {
    print("AppState copyWith in AppState called");
    return AppState(
      productList: productList ?? this.productList,
      itemsInCart: itemsInCart ?? this.itemsInCart,
    );
  }
}

// Host the data it receives
class AppStateScope extends InheritedWidget {
  final AppState data;

  const AppStateScope(this.data, {Key? key, required Widget child})
      : super(key: key, child: child);

  static AppState of(BuildContext context) {
    print("AppState of in AppStateScope called");
    return context.dependOnInheritedWidgetOfExactType<AppStateScope>()!.data;
  }

  @override
  bool updateShouldNotify(AppStateScope oldWidget) {
    print("updateShouldNotify called");
    return data != oldWidget.data;
  }
}

// The goal of this StatefulWidget is to create the AppState,
// provide APIs to modify the data, and host the data using the AppStateScope.
class AppStateWidget extends StatefulWidget {
  AppStateWidget({required this.child});

  final Widget child;

  static AppStateWidgetState of(BuildContext context) {
    print("findAncestorStateOfType in AppStateWidget called");
    return context.findAncestorStateOfType<AppStateWidgetState>()!;
  }

  @override
  AppStateWidgetState createState() => AppStateWidgetState();
}

class AppStateWidgetState extends State<AppStateWidget> {
  AppState _data = AppState(
    productList: Server.getProductList(),
  );

  void setProductList(List<String> newProductList) {
    if (newProductList != _data.productList) {
      setState(() {
        _data = _data.copyWith(
          productList: newProductList,
        );
      });
      print("setProductList in AppStateWidgetState called");
    }
  }

  void addToCart(String id) {
    if (!_data.itemsInCart.contains(id)) {
      final Set<String> newItemsInCart = Set<String>.from(_data.itemsInCart);
      newItemsInCart.add(id);
      setState(() {
        _data = _data.copyWith(
          itemsInCart: newItemsInCart,
        );
      });
      print("addToCart in AppStateWidgetState called");
    }
  }

  void removeFromCart(String id) {
    if (_data.itemsInCart.contains(id)) {
      final Set<String> newItemsInCart = Set<String>.from(_data.itemsInCart);
      newItemsInCart.remove(id);
      setState(() {
        _data = _data.copyWith(
          itemsInCart: newItemsInCart,
        );
      });
      print("removeFromCart in AppStateWidgetState called");
    }
  }

  @override
  Widget build(BuildContext context) {
    print("build in AppStateWidgetState called");
    return AppStateScope(
      _data,
      child: widget.child,
    );
  }
}
