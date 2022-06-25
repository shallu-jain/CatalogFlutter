import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_catalog/models/catalog.dart';
import 'package:flutter_catalog/screens/home_detail_page.dart';
import 'package:flutter_catalog/widgets/themes.dart';
import 'dart:convert';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final int days = 30;

  final String name = "Shallu";

  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(Duration(seconds: 2));
    final catalogJson =
        await rootBundle.loadString("assets/files/catalog.json");
    // print(catalogJson);
    // data aa raha hai matlab encoded form hai , to decode karo usko
    final decodedData = jsonDecode(catalogJson);
    var productsData = decodedData["products"];
    CatalogModel.items = List.from(productsData)
        .map<Item>((item) => Item.fromMap(item))
        .toList();
    setState(() {});
    // print(productsData);
  }

  @override
  Widget build(BuildContext context) {
    // final dummyList = List.generate(10, (index) => CatalogModel.items[0]);

    // return Scaffold(
    //   appBar: AppBar(
    //     title: Text('Catalog log'),
    //   ),
    //   body: Padding(
    //     padding: const EdgeInsets.all(20.0),
    //     child: (CatalogModel.items.isNotEmpty)
    //         ?
    //         // ListView.builder(
    //         //     itemCount: CatalogModel.items.length,
    //         //     itemBuilder: (context, index) {
    //         //       return ItemWidget(
    //         //         item: CatalogModel.items[index],
    //         //       );
    //         //     },
    //         //   )
    //         //  grid view making below
    //         GridView.builder(
    //             gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
    //               crossAxisCount: 1,
    //               mainAxisSpacing: 15,
    //               crossAxisSpacing: 15,
    //             ),
    //             itemBuilder: (BuildContext context, int index) {
    //               final item = CatalogModel.items[index];
    //               return
    //                 Container(
    //                 height: 150,
    //                 child: Card(
    //                   clipBehavior: Clip.antiAlias,
    //                   shape: RoundedRectangleBorder(
    //                       borderRadius: BorderRadius.circular(10)),
    //                   child: GridTile(
    //                     header: Container(
    //                       child: Text(
    //                         item.name,
    //                         textAlign: TextAlign.center,
    //                         style: TextStyle(color: Colors.white),
    //                       ),
    //                       padding: EdgeInsets.all(12),
    //                       decoration:
    //                           BoxDecoration(color: Colors.deepPurpleAccent),
    //                     ),
    //                     child: Image.network(
    //                       item.image,
    //                       scale: 5.0,
    //                       height: 150,
    //                       width: 150,
    //                     ),
    //                     footer: Row(
    //                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    //                       children: [
    //                         Text(
    //                           "\$${item.price}".toString(),
    //                           style: TextStyle(fontWeight: FontWeight.bold),
    //                         ),
    //                         ElevatedButton(
    //                             onPressed: () {
    //                               print("Button pressed");
    //                             },
    //                             child: Text("Buy"))
    //                       ],
    //                     ),
    //                   ),
    //                   elevation: 10,
    //                   margin: EdgeInsets.all(10.0),
    //                 ),
    //               );
    //             },
    //             itemCount: CatalogModel.items.length,
    //           )
    //         : Center(
    //             child: CircularProgressIndicator(),
    //           ),
    //   ),
    //   drawer: MyDrawer(), // drawer matlab jo side mein 3 dot aate hai woh
    // );

    return Scaffold(
      backgroundColor: MyTheme.creamColor,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, "/cart");
        },
        child: Icon(CupertinoIcons.cart),
        backgroundColor: MyTheme.darkBluishColor,
      ),
      body: SafeArea(
        child: Container(
          // padding: EdgeInsets.all(32),          ////////////////////////////
          // padding: EdgeInsets.only(right: 32.0, left: 32.0),
          margin: EdgeInsets.only(left: 32, right: 32),
          //////////////////////////////
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CatalogHeader(),
              if (CatalogModel.items.isNotEmpty)
                Expanded(child: CatalogList())
              else
                Expanded(
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                )
            ],
          ),
        ),
      ),
    );
  }
}

class CatalogList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: CatalogModel.items.length,
      itemBuilder: (context, index) {
        final catalog = CatalogModel.items[index];
        return InkWell(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => HomeDetailPage(
                catalog: catalog,
              ),
            ),
          ),
          child: CatalogItem(catalog: catalog),
        );
      },
    );
  }
}

class CatalogItem extends StatelessWidget {
  final Item catalog;

  const CatalogItem({Key? key, required this.catalog}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      // color: Colors.red,
      height: 150.0,
      width: 150.0,
      margin: EdgeInsets.only(top: 15.0, bottom: 15.0),

      child: Row(
        children: [
          Hero(
              tag: Key(catalog.id.toString()),
              child: CatalogImage(image: catalog.image)),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                catalog.name,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: MyTheme.darkBluishColor,
                ),
              ),
              Text(
                catalog.desc,
                style: TextStyle(
                    /////
                    ),
              ),
              SizedBox(
                height: 10.0,
              ),
              ButtonBar(
                alignment: MainAxisAlignment.spaceBetween,
                buttonPadding: EdgeInsets.only(right: 7.0),
                // buttonPadding: EdgeInsets.zero,////////////
                children: [
                  Text(
                    "\$${catalog.price}".toString(),
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15.0,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text("Buy"),
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(MyTheme.darkBluishColor),
                        shape: MaterialStateProperty.all(StadiumBorder())),
                  ),
                ],
              ),
            ],
          ))
        ],
      ),
    );
  }
}

class CatalogImage extends StatelessWidget {
  final String image;

  const CatalogImage({Key? key, required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        // color: Colors.green,
        color: MyTheme.creamColor,
      ),

      padding: EdgeInsets.all(16.0),
      margin: EdgeInsets.only(left: 10.0),
      // padding: EdgeInsets.only(left: 20),
      child: Image.network(image, width: 50, height: 50),
    );
  }
}

class CatalogHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Catalog Header",
          style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 40.0,
              color: MyTheme.darkBluishColor),
        ),
        Text(
          "Trending Products",
          style: TextStyle(
              fontWeight: FontWeight.w300,
              fontSize: 25.0,
              color: MyTheme.darkBluishColor),
        ),
      ],
    );
  }
}
