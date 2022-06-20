import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_catalog/models/catalog.dart';
import 'package:flutter_catalog/widgets/drawer.dart';

import '../widgets/item_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  final int days = 30;
  final String name = "Shallu";

  @override
  Widget build(BuildContext context) {
    final dummyList= List.generate(10, (index) => CatalogModel.items[0]);

    return Scaffold(
      appBar: AppBar(
        title: Text('Catalog log'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView.builder(
            itemCount: dummyList.length,
            itemBuilder: (context, index) {
              return ItemWidget(
                item: dummyList[index],
              );
            }),
      ),
      drawer: MyDrawer(), // drawer matlab jo side mein 3 dot aate hai woh
    );
  }
}
