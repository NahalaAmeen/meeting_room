import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:meetingroom/OrderScreen2.dart';
import 'api.dart';
import 'webServer.dart';

class OrderDetailScreen extends StatefulWidget {
  @override
  _OrderDetailScreenPageState createState() => _OrderDetailScreenPageState();
}

class _OrderDetailScreenPageState extends State<OrderDetailScreen> {
  @override
  void initState() {
    //WebServer().status(API.status).then((value) => setStatus(value));
    super.initState();
  }

  List status = [];

  setStatus(value) {
    status = value;
    setState(() {});
  }

  var a, p, r, d;
  var pgbar;
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
              title: Text('Order Details',
                  style: TextStyle(color: Colors.black, fontSize: 25)),
            ),
            body: Container(
                // child: new SingleChildScrollView(
                child: ListView(children: [
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Container(
                    margin: EdgeInsets.only(left: 0, right: 0),
                    child: Column(children: [
                      Text(
                        '   Order Room 03 NAEC2691\n',
                      ),
                    ])),
                Container(
                    width: 500,
                    //alignment: Alignment.center,
                    //margin: const EdgeInsets.only(left: 20.0, right: 20.0),
                    child: Row(children: <Widget>[
                      Expanded(
                          child: Center(
                        child: LinearProgressIndicator(
                          value: pgbar,
                        ),
                      )),
                      //Expanded(child: Center(child: Text('$a'),))
                    ])),
                Container(
                  alignment: Alignment.topLeft,
                  child: Text('\n  ORDERED.',
                      style: TextStyle(
                          fontSize: 15,
                          color: Colors.grey,
                          fontWeight: FontWeight.bold)),
                ),
                Container(
                  alignment: Alignment.topLeft,
                  child: Text('  ROOM NO.',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                ),
                Container(
                  alignment: Alignment.topLeft,
                  margin: EdgeInsets.only(left: 10, right: 0),
                  child: RichText(
                    text: TextSpan(
                      children: [
                        WidgetSpan(
                          child: ImageIcon(
                            AssetImage('assets/room.png'),
                            color: Colors.grey,
                            size: 18,
                          ),
                        ),
                        TextSpan(
                            text: "  Room 03",
                            style: TextStyle(
                                color: Colors.grey,
                                fontSize: 16,
                                fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                ),
                Container(
                    alignment: Alignment.topLeft,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                  text: '  Abdelrazeq M Abu Madi',
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.bold)),
                              TextSpan(
                                  text: '\n  Main Building, Meeting Room 03',
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.bold,
                                      height: 2)),
                              TextSpan(
                                  text: "\n  +971-50-9440802  ",
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 95, 100, 111),
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold)),
                              WidgetSpan(
                                  child: Icon(
                                Icons.check_circle,
                                color: Colors.green,
                                size: 17,
                              )),
                            ],
                          ),
                        ),
                      ],
                    )),
                ListTile(
                  onTap: () {},
                  title: Text('REVIEW YOUR ORDER',
                      style: TextStyle(
                        fontSize: getHieghtPercentage(2),
                      )),
                  trailing: new Column(
                    children: <Widget>[
                      new GestureDetector(
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: ((context) {
                              return OrderScreen();
                            })));
                          },
                          child: ImageIcon(AssetImage('assets/edit_button.png'),
                              size: getHieghtPercentage(3)))
                    ],
                  ),
                ),
                Container(
                    margin: EdgeInsets.only(
                        left: widthPercent(4), right: widthPercent(4)),
                    height: 500.0,
                    child: ListView(children: [
                      Row(children: [
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [])
                      ]),
                      ListTile(
                          onTap: () {},
                          title: Text('Chair 01',
                              style: TextStyle(
                                  fontSize: getHieghtPercentage(3),
                                  fontWeight: FontWeight.bold)),
                          trailing: Icon(Icons.arrow_drop_down,
                              size: getHieghtPercentage(5))),
                      Container(
                          child: Row(children: <Widget>[
                        Container(
                          width: 70.0,
                          height: 70.0,
                          child: Flexible(
                              child: Image.network(
                            'https://cdn-a.william-reed.com/var/wrbm_gb_food_pharma/storage/images/publications/food-beverage-nutrition/beveragedaily.com/article/2020/01/31/what-next-for-lipton-and-pg-tips-unilever-s-strategic-tea-review/10657232-5-eng-GB/What-next-for-Lipton-and-PG-Tips-Unilever-s-strategic-tea-review.jpg',
                            height: getHieghtPercentage(20),
                          )),
                        ),
                        Container(
                            margin: const EdgeInsets.only(left: 0.0, right: 60),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Hot,Double shots,No',
                                    style: TextStyle(color: Colors.grey)),
                                Align(),
                                Text('Americano',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold)),
                                //                                      Container(
                                //   child: Column(
                                //     children: <Widget>[

                                //       ListView.builder(
                                //         itemCount: statusList.length,
                                //         itemBuilder: (context,index){
                                //           return Text(statusList[index]);
                                //         },
                                //       )
                                //     ],
                                //   ),
                                // ),

                                Text('\nOrder received',
                                    style: TextStyle(color: Colors.grey)),
                                Text('Sat,Aug 22\n',
                                    style: TextStyle(color: Colors.green[300])),
                              ],
                            )),
                        Container(
                            child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: <Widget>[
                            Icon(
                              Icons.remove,
                              size: 25,
                              color: Colors.grey.shade700,
                            ),
                            Container(
                              color: Colors.grey.shade200,
                              alignment: Alignment.center,
                              padding: const EdgeInsets.only(
                                  bottom: 2, right: 10, left: 4),
                              child: Text("1",
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                            ),
                            Icon(
                              Icons.add,
                              size: 25,
                              color: Colors.grey.shade700,
                            )
                          ],
                        )),
                      ])),
                      ListTile(
                          onTap: () {},
                          title: Text('Chair 02',
                              style: TextStyle(
                                  fontSize: getHieghtPercentage(3),
                                  fontWeight: FontWeight.bold)),
                          trailing: Icon(Icons.arrow_drop_down,
                              size: getHieghtPercentage(5))),
                      Container(
                          child: Row(children: <Widget>[
                        Container(
                          width: 70.0,
                          height: 70.0,
                          child: Flexible(
                              child: Image.network(
                            'https://cdn-a.william-reed.com/var/wrbm_gb_food_pharma/storage/images/publications/food-beverage-nutrition/beveragedaily.com/article/2020/01/31/what-next-for-lipton-and-pg-tips-unilever-s-strategic-tea-review/10657232-5-eng-GB/What-next-for-Lipton-and-PG-Tips-Unilever-s-strategic-tea-review.jpg',
                            height: getHieghtPercentage(20),
                          )),
                        ),
                        Container(
                            margin: const EdgeInsets.only(left: 0.0, right: 60),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Hot,Double shots,No',
                                    style: TextStyle(color: Colors.grey)),
                                Align(),
                                Text('Americano',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold)),
                                Text('\nOrder in next 30mn',
                                    style: TextStyle(color: Colors.grey)),
                                Text('Sat,Aug 22\n',
                                    style: TextStyle(color: Colors.green[300])),
                              ],
                            )),
                        Container(
                            child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: <Widget>[
                            Icon(
                              Icons.remove,
                              size: 25,
                              color: Colors.grey.shade700,
                            ),
                            Container(
                              color: Colors.grey.shade200,
                              alignment: Alignment.center,
                              padding: const EdgeInsets.only(
                                  bottom: 2, right: 10, left: 4),
                              child: Text("1",
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                            ),
                            Icon(
                              Icons.add,
                              size: 25,
                              color: Colors.grey.shade700,
                            )
                          ],
                        )),
                      ])),
                    ]))
              ])
            ]))));
  }

  double widthPercent(int value) {
    return (MediaQuery.of(context).size.width / 100) * value;
  }

  double getHieghtPercentage(double percentage) {
    return (MediaQuery.of(context).size.height / 100) * percentage;
  }
}
