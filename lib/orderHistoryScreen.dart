import 'package:flutter/material.dart';
import 'package:meetingroom/OrderDetailScreen.dart';

class orderHistoryScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return orderHistoryScreenState();
  }
}

class orderHistoryScreenState extends State<orderHistoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //     backgroundColor: Colors.red,
      //     title: Text("Order History"),
      //     actions: [
      //       IconButton(onPressed: (() {}), icon: Icon(Icons.shopping_cart))
      //     ]),
      body: Container(
          alignment: Alignment.center,
          margin: EdgeInsets.all(5),
          child: ListView(
            children: <Widget>[
              Card(
                child: ListTile(
                  title: Text("Order Room 03 NAEC2691",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 95, 100, 111))),
                  subtitle: Text("Placed on Aug 21, 2021",
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 11,
                          fontWeight: FontWeight.bold)),

                  trailing: new Column(
                    children: <Widget>[
                      new GestureDetector(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: ((context) {
                            return OrderDetailScreen();
                          })));
                        },
                        child: new Text(
                          "View Details",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                              color: Colors.red),
                        ),
                      )
                    ],
                  ),
                  // Text("View Details",
                  // style: TextStyle(fontWeight: FontWeight.bold,fontSize:12,color:Colors.red),),
                ),
              ),
              Card(
                child: ListTile(
                  title: Text("Order Room 03 NAEC2691",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 95, 100, 111))),
                  subtitle: Text("Placed on Aug 20, 2021",
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 11,
                          fontWeight: FontWeight.bold)),
                  trailing: new Column(
                    children: <Widget>[
                      new GestureDetector(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: ((context) {
                            return OrderDetailScreen();
                          })));
                        },
                        child: new Text(
                          "View Details",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                              color: Colors.red),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          )),
    );
  }
}
