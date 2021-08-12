import 'package:flutter/material.dart';
import 'package:flutter_catalog/models/cart.dart';
// ignore: unused_import
import 'package:flutter_catalog/widgets/theme.dart';
import 'package:velocity_x/velocity_x.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.canvasColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: "Cart".text.make(),
      ),
      body: Column(
        children: [
          _CartList().p32().expand(),
          Divider(),
          _CartTool(),
        ],
      ),
    );
  }
}

class _CartTool extends StatelessWidget {
  const _CartTool({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _cart = CartModel();
    return SizedBox(
      height: 200,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          "\$${_cart.totalPrice}".text.xl5.color(context.accentColor).make(),
          30.widthBox,
          ElevatedButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: "buying not supported yet".text.make()));
                  },
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(context.theme.buttonColor),
                  ),
                  child: "buy".text.white.make())
              .w16(context)
        ],
      ),
    );
  }
}

class _CartList extends StatelessWidget {
  final _cart = CartModel();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _cart.items.length,
      itemBuilder: (context, index) => ListTile(
        leading: Icon(Icons.done),
        trailing: IconButton(
            onPressed: () {}, icon: Icon(Icons.remove_circle_outline)),
        title: _cart.items[index].name.text.make(),
      ),
    );
  }
}
