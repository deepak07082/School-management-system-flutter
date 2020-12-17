import 'package:flutter/material.dart';

class DashboardCard extends StatelessWidget {
  final String name;

  final String imgpath;

  const DashboardCard({Key key, this.name, this.imgpath})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    return Container(
      padding: EdgeInsets.all(10),
      height: height * 0.17,
      width: width * 0.30,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black38,
            offset: Offset(0, 2),
            blurRadius: 7,
          ),
        ],
      ),
      child: Container(
          child: Column(
            children: [
              Image.asset(
                "assets/${imgpath}",
                width: 60,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(
                  "${name}",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
              ),
            ],
          ),
      ),
      
    );
  }
}
