import 'package:flutter/material.dart';

import '../models/catalog.dart';

class ItemWidget extends StatelessWidget {
  const ItemWidget({Key? key, required this.item})
      : assert(item != null),
        super(key: key);
  final Item item;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white38,
      shape: StadiumBorder(),
      child: ListTile(
        onTap: () {
          print("${item.name} pressed");
        },
        leading: Image.network(item.image),
        title: Text(item.name),
        subtitle: Text(item.desc),
        trailing: Text(
          "\$${item.price}",
          textScaleFactor: 1.2,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.purple,
          ),
        ),
      ),
    );
  }
}
