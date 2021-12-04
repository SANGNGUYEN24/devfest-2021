import 'package:flutter/material.dart';
import 'package:inherited_widget/state_manager/app_state.dart';

class ShoppingCartIcon extends StatelessWidget {
  const ShoppingCartIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Set<String> itemsInCart = AppStateScope.of(context).itemsInCart;
    final bool hasPurchase = itemsInCart.isNotEmpty;
    return Stack(
      alignment: Alignment.center,
      children: [
        Padding(
          padding: EdgeInsets.only(right: hasPurchase ? 17.0 : 10.0),
          child: const Icon(
            Icons.shopping_cart,
            color: Colors.black,
          ),
        ),
        if (hasPurchase)
          Padding(
            padding: const EdgeInsets.only(left: 17.0),
            child: CircleAvatar(
              radius: 8.0,
              backgroundColor: Colors.lightBlue,
              foregroundColor: Colors.white,
              child: Text(
                itemsInCart.length.toString(),
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 12.0,
                ),
              ),
            ),
          ),
      ],
    );
  }
}

// class ShoppingCartIcon extends StatefulWidget {
//   ShoppingCartIcon({Key? key}) : super(key: key);
//   @override
//   ShoppingCartIconState createState() => ShoppingCartIconState();
// }

// class ShoppingCartIconState extends State<ShoppingCartIcon> {
//   Set<String> get itemsInCart => _itemsInCart;
//   Set<String> _itemsInCart = <String>{};
//   set itemsInCart(Set<String> value) {
//     setState(() {
//       _itemsInCart = value;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     final bool hasPurchase = itemsInCart.isNotEmpty;
//     return Stack(
//       alignment: Alignment.center,
//       children: [
//         Padding(
//           padding: EdgeInsets.only(right: hasPurchase ? 17.0 : 10.0),
//           child: const Icon(
//             Icons.shopping_cart,
//             color: Colors.black,
//           ),
//         ),
//         if (hasPurchase)
//           Padding(
//             padding: const EdgeInsets.only(left: 17.0),
//             child: CircleAvatar(
//               radius: 8.0,
//               backgroundColor: Colors.lightBlue,
//               foregroundColor: Colors.white,
//               child: Text(
//                 itemsInCart.length.toString(),
//                 style: const TextStyle(
//                   fontWeight: FontWeight.bold,
//                   fontSize: 12.0,
//                 ),
//               ),
//             ),
//           ),
//       ],
//     );
//   }
// }
