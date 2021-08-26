import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:lottie/lottie.dart';

class OrderPlacedScreen extends StatefulWidget {
  @override
  _OrderPlacePageState createState() => _OrderPlacePageState();
}

class _OrderPlacePageState extends State<OrderPlacedScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          centerTitle: true,
          title: Text('My Cart',
              style: TextStyle(color: Colors.black, fontSize: 30)),
        ),
        body: Container(
          child: Column(
            children: <Widget>[
              Container(
                child: Lottie.asset('assets/checkmark.json', repeat: false),
                height: 250,
                width: 250,
              ),
              Container(
                  width: 250,
                  //alignment: Alignment.center,
                  //margin: const EdgeInsets.only(left: 20.0, right: 20.0),
                  child: Row(children: <Widget>[
                    Container(
                      width: 50.0,
                      height: 50.0,
                      // margin: const EdgeInsets.all(50.0),
                      decoration: BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage("assets/user.png"),
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(32))),
                    ),
                    Container(
                        margin: const EdgeInsets.only(left: 10.0, right: 0),
                        child: Column(
                          children: [
                            Text('Nahala', style: TextStyle(fontSize: 20)),
                            Text(
                              'Project Manager',
                            ),
                          ],
                        ))
                  ])),
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(left: 8, right: 8),
                  child: Column(
                    children: <Widget>[
                      RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(children: [
                            TextSpan(
                                text: "\nYour Order has been \naccepted",
                                style: TextStyle(
                                    color: Colors.black, fontSize: 25))
                          ])),
                      RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(children: [
                            TextSpan(
                                text:
                                    "\nYour items has been placed and is on it's way to being processed .",
                                style: TextStyle(color: Colors.grey))
                          ])),
                      SizedBox(
                        height: 24,
                      ),
                      MaterialButton(
                        onPressed: () {},
                        minWidth: MediaQuery.of(context).size.width,
                        height: 60.0,
                        child: Text("Track Order",
                            style: TextStyle(color: Colors.white)),
                        color: Colors.red,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(24)),
                        ),
                      ),
                      RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(children: [
                            TextSpan(
                                text: "\nBack to home",
                                style: TextStyle(color: Colors.black))
                          ])),
                    ],
                  ),
                ),
                flex: 5,
              )
            ],
          ),
        ),
      ),
    );
  }
}
