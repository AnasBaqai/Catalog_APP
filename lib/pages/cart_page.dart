import 'package:flutter/material.dart';
import 'package:flutter_catalog/core/store.dart';
import 'package:flutter_catalog/models/cart.dart';
import 'package:flutter_catalog/utils/routes.dart';

import 'package:flutter_catalog/widgets/drawer.dart';
import 'package:velocity_x/velocity_x.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
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
    final CartModel _cart = (VxState.store as MyStore).cart;

    return SizedBox(
      height: 200,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          VxConsumer(
              builder: (context, dynamic, _) {
                return "\$${_cart.totalPrice}"
                    .text
                    .xl5
                    .color(context.accentColor)
                    .make();
              },
              mutations: {RemoveMutation},
              notifications: {}),
          30.widthBox,
          ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, MyRoutes.couponRoute);
              },
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(context.theme.buttonColor)),
              child: "COUPON CODE".text.white.make()),
          ElevatedButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: "buying not supported yet".text.make()));

                    showDialog(
                      context: context,
                      builder: (ctx) => AlertDialog(
                        title: Text("Alert Dialog Box"),
                        content: Text(
                            "are you sure you want to confirm your order?"),
                        actions: <Widget>[
                          // ignore: deprecated_member_use
                          FlatButton(
                            onPressed: () {
                              Navigator.of(ctx).pop();
                            },
                            child: Text("okay"),
                          ),
                        ],
                      ),
                    );
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
  @override
  Widget build(BuildContext context) {
    VxState.watch(context, on: [RemoveMutation]);
    final CartModel _cart = (VxState.store as MyStore).cart;

    return _cart.items.isEmpty
        ? "Add items first".text.xl3.makeCentered()
        : ListView.builder(
            itemCount: _cart.items.length,
            itemBuilder: (context, index) => ListTile(
              leading: Icon(Icons.done),
              trailing: IconButton(
                  onPressed: () => RemoveMutation(item: _cart.items[index]),
                  icon: Icon(Icons.remove_circle_outline)),
              title: _cart.items[index].name.text.make(),
            ),
          );
  }
}
