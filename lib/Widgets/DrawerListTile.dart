import 'package:flutter/material.dart';

class DrawerListTile extends StatelessWidget {
  final String name;
  final String imgpath;
  final Function ontap;

  const DrawerListTile({Key key, this.name, this.imgpath, this.ontap}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap:ontap,
      leading: Image.asset(
        "assets/${imgpath}",
        height: 30,
      ),
      contentPadding: EdgeInsets.only(
        left: 70,
        top: 5,
        bottom: 5,
      ),
      title: Text(
        "${name}",
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
