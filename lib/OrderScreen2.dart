import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:meetingroom/OrderPlacedScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'ProfileScreen.dart';
import 'home.dart';

class OrderScreen extends StatefulWidget {
  @override
  _OrderScreenPageState createState() => _OrderScreenPageState();
}

class _OrderScreenPageState extends State<OrderScreen> {
  _OrderScreenPageState() {
    read();
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.white,
            leading: IconButton(
                icon: Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                ),
                onPressed: () {
                  Navigator.pop(context);
                }),
            centerTitle: true,
            title: Text('$str',
                style: TextStyle(color: Colors.black, fontSize: 25)),
          ),
          body: Container(
              margin: EdgeInsets.only(
                  left: widthPercent(4), right: widthPercent(4)),
              child: ListView(children: [
                Row(children: [
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('REVIEW YOUR ORDER',
                            style: TextStyle(fontSize: getHieghtPercentage(2))),
                        SizedBox(height: getHieghtPercentage(1)),
                      ])
                ]),
                ListTile(
                    onTap: () {},
                    title: Text('$select_Chair',
                        style: TextStyle(
                            fontSize: getHieghtPercentage(3),
                            fontWeight: FontWeight.bold)),
                    trailing: Icon(Icons.arrow_drop_down,
                        size: getHieghtPercentage(5))),
                Expanded(
                  flex: 1,
                  child: Container(
                    child: Row(
                      children: <Widget>[
                        Image.asset('assets/tea_square.png',
                            height: 70.0, width: 70.0, fit: BoxFit.contain),
                        Expanded(
                            flex: 1,
                            child: Container(
                                child: Column(
                              children: <Widget>[
                                Container(
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Text('Hot,Double shots,No',
                                          style: TextStyle(color: Colors.grey)),
                                      Icon(Icons.close,
                                          size: getHieghtPercentage(3))
                                    ],
                                  ),
                                ),
                                Container(
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Text('\nAmericano',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold)),
                                      Container(
                                          child: Row(
                                        children: <Widget>[
                                          // Icon(
                                          //   Icons.remove,
                                          //   size: 25,
                                          //   color: Colors.grey.shade700,
                                          // ),
                                          Container(
                                              color: Colors.grey.shade200,
                                              alignment: Alignment.center,
                                              padding: const EdgeInsets.only(
                                                  bottom: 2,
                                                  right: 10,
                                                  left: 4),
                                              child: Text('hi')
                                              //    Text("1",
                                              //       style: TextStyle(
                                              //           fontWeight:
                                              //               FontWeight.bold)),
                                              // ),
                                              // Icon(
                                              //   Icons.add,
                                              //   size: 25,
                                              //   color: Colors.grey.shade700,
                                              // )
                                              )
                                        ],
                                      )),
                                    ],
                                  ),
                                )
                              ],
                            ))),
                      ],
                    ),
                  ),
                ),
                // ListTile(
                //     onTap: () {},
                //     title: Text('Chair 02',
                //         style: TextStyle(
                //             fontSize: getHieghtPercentage(3),
                //             fontWeight: FontWeight.bold)),
                //     trailing: Icon(Icons.arrow_drop_down,
                //         size: getHieghtPercentage(5))),
                // Expanded(
                //   flex: 1,
                //   child: Container(
                //     child: Row(
                //       children: <Widget>[
                //         Image.asset('assets/tea_square.png',
                //             height: 70.0, width: 70.0, fit: BoxFit.contain),
                //         Expanded(
                //             flex: 1,
                //             child: Container(
                //                 child: Column(
                //               children: <Widget>[
                //                 Container(
                //                   child: Row(
                //                     mainAxisAlignment:
                //                         MainAxisAlignment.spaceBetween,
                //                     children: <Widget>[
                //                       Text('Hot,Double shots,No',
                //                           style: TextStyle(color: Colors.grey)),
                //                       Icon(Icons.close,
                //                           size: getHieghtPercentage(3))
                //                     ],
                //                   ),
                //                 ),
                //                 Container(
                //                   child: Row(
                //                     mainAxisAlignment:
                //                         MainAxisAlignment.spaceBetween,
                //                     children: <Widget>[
                //                       Text('\nAmericano',
                //                           style: TextStyle(
                //                               fontWeight: FontWeight.bold)),
                //                       Container(
                //                           child: Row(
                //                         // mainAxisAlignment: MainAxisAlignment.center,
                //                         // crossAxisAlignment: CrossAxisAlignment.end,
                //                         children: <Widget>[
                //                           Icon(
                //                             Icons.remove,
                //                             size: 25,
                //                             color: Colors.grey.shade700,
                //                           ),
                //                           Container(
                //                             color: Colors.grey.shade200,
                //                             alignment: Alignment.center,
                //                             padding: const EdgeInsets.only(
                //                                 bottom: 2, right: 10, left: 4),
                //                             child: Text("1",
                //                                 style: TextStyle(
                //                                     fontWeight:
                //                                         FontWeight.bold)),
                //                           ),
                //                           Icon(
                //                             Icons.add,
                //                             size: 25,
                //                             color: Colors.grey.shade700,
                //                           )
                //                         ],
                //                       )),
                //                     ],
                //                   ),
                //                 )
                //               ],
                //             ))),
                //       ],
                //     ),
                //   ),
                // ),
                // Expanded(
                //   flex: 1,
                //   child: Container(
                //     child: Row(
                //       children: <Widget>[
                //         Image.asset('assets/tea_square.png',
                //             height: 70.0, width: 70.0, fit: BoxFit.contain),
                //         Expanded(
                //             flex: 1,
                //             child: Container(
                //                 child: Column(
                //               children: <Widget>[
                //                 Container(
                //                   child: Row(
                //                     mainAxisAlignment:
                //                         MainAxisAlignment.spaceBetween,
                //                     children: <Widget>[
                //                       Text('Hot,Double shots,No',
                //                           style: TextStyle(color: Colors.grey)),
                //                       Icon(Icons.close,
                //                           size: getHieghtPercentage(3))
                //                     ],
                //                   ),
                //                 ),
                //                 Container(
                //                   child: Row(
                //                     mainAxisAlignment:
                //                         MainAxisAlignment.spaceBetween,
                //                     children: <Widget>[
                //                       Text('\nAmericano',
                //                           style: TextStyle(
                //                               fontWeight: FontWeight.bold)),
                //                       Container(
                //                           child: Row(
                //                         // mainAxisAlignment: MainAxisAlignment.center,
                //                         // crossAxisAlignment: CrossAxisAlignment.end,
                //                         children: <Widget>[
                //                           Icon(
                //                             Icons.remove,
                //                             size: 25,
                //                             color: Colors.grey.shade700,
                //                           ),
                //                           Container(
                //                             color: Colors.grey.shade200,
                //                             alignment: Alignment.center,
                //                             padding: const EdgeInsets.only(
                //                                 bottom: 2, right: 10, left: 4),
                //                             child: Text("1",
                //                                 style: TextStyle(
                //                                     fontWeight:
                //                                         FontWeight.bold)),
                //                           ),
                //                           Icon(
                //                             Icons.add,
                //                             size: 25,
                //                             color: Colors.grey.shade700,
                //                           )
                //                         ],
                //                       )),
                //                     ],
                //                   ),
                //                 )
                //               ],
                //             ))),
                //       ],
                //     ),
                //   ),
                // ),
                RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(children: [
                      TextSpan(
                          text: "\n\n\n\n\nBack To Home\n",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: getHieghtPercentage(2)))
                    ])),
                MaterialButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: ((context) {
                      return OrderPlacedScreen();
                    })));
                  },
                  minWidth: MediaQuery.of(context).size.width,
                  height: 60.0,
                  child: Text("Place Order",
                      style: TextStyle(color: Colors.white)),
                  color: Colors.red,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(24)),
                  ),
                ),
              ]))),
    );
  }

  double widthPercent(int value) {
    return (MediaQuery.of(context).size.width / 100) * value;
  }

  double getHieghtPercentage(double percentage) {
    return (MediaQuery.of(context).size.height / 100) * percentage;
  }

  void read() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      str = pref.getString('key')!;
    });
  }
}
