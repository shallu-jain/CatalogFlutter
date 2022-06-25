import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_catalog/models/catalog.dart';
import 'package:flutter_catalog/widgets/themes.dart';

class HomeDetailPage extends StatelessWidget {
  final Item catalog;

  const HomeDetailPage({Key? key, required this.catalog}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: MyTheme.creamColor,
      // backgroundColor: Colors.black,
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(30.0),
        child: ButtonBar(
          alignment: MainAxisAlignment.spaceBetween,
          buttonPadding: EdgeInsets.only(right: 7.0),
          // buttonPadding: EdgeInsets.zero,////////////
          children: [
            Text(
              "\$${catalog.price}".toString(),
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 50.0,
              ),
            ),
            SizedBox(
              height: 50.0,
              width: 100.0,
              child: ElevatedButton(
                onPressed: () {},
                child: Text(
                  "Add To Cart",
                  style: TextStyle(fontSize: 10.0),
                ),
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(MyTheme.darkBluishColor),
                  shape: MaterialStateProperty.all(
                    StadiumBorder(),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Hero(
              child: Image.network(
                catalog.image,
                width: 500,
                height: 250,
              ),
              tag: Key(catalog.id.toString()),
            ),
            Expanded(
              child: Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(100.0),
                    topLeft: Radius.circular(100.0),
                  ),
                  color: Colors.white,
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Column(
                    children: [
                      Text(
                        catalog.name,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: MyTheme.darkBluishColor,
                          fontSize: 35.0,
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
                      Container(
                        padding: EdgeInsets.all(16.0),
                        child: Text(
                          "Apple iPhones have revolutionized the mobile industry and are the best phones in the market because of their easy to use interface, "
                          "plethora of high quality applications ranging from games, educational, social applications and many more categories. Also, "
                          "iPhones are well known for their advanced 8 megapixel camera that captures 1080p high quality photos and videos; "
                          ,

                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
