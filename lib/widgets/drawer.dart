import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final imageUrl =
        "https://media-exp1.licdn.com/dms/image/C4D03AQGlmD_mv4cBlA/profile-displayphoto-shrink_200_200/0/1629255878007?e=1657756800&v=beta&t=7ugeMGgQB0M2j7radrjWV9p5fwEjUvSYGs48IpelUM8";
    return Drawer(
      child: Container(
        color: Colors.red,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
                padding: EdgeInsets.zero,
                child: UserAccountsDrawerHeader(
                  accountEmail: Text("jshallu@gmail.com"),
                  accountName: Text("Shallu Jain"),
                  currentAccountPicture: CircleAvatar(
                    backgroundImage: NetworkImage(imageUrl),
                  ),
                ),
            ),
            ListTile(
              leading: Icon(CupertinoIcons.home,color: Colors.black,),
              title: Text("Home",textScaleFactor: 1.2),
            ),
            ListTile(
              leading: Icon(CupertinoIcons.profile_circled,color: Colors.black,),
              title: Text("Profile",textScaleFactor: 1.2),
            ),
            ListTile(
              leading: Icon(CupertinoIcons.mail_solid,color: Colors.black,),
              title: Text("Email",textScaleFactor: 1.2),
            ),
          ],
        ),
      ),
    );

  }
}
