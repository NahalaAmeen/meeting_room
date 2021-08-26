import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:meetingroom/OrderScreen2.dart';
import 'package:meetingroom/api.dart';
import 'package:meetingroom/staticField.dart';
import 'package:meetingroom/webServer.dart';
import 'ProfileScreen.dart';
import 'dart:convert';

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomeScreenState();
  }
}

class HomeScreenState extends State<HomeScreen> {
  late Widget screen;
  static late BuildContext contextt;

  @override
  void initState() {
    // WebServer().getdata(API.chairs);
    screen = Home();
  }

  @override
  Widget build(BuildContext context) {
    contextt = context;
    return Scaffold(
      body: Column(children: [
        Flexible(child: screen),
        bottomtabItems(),
      ]),
    );
  }

  Widget bottomtabItems() {
    //tabs on the profile screen
    return Container(
      color: Colors.red,
      height: getHieghtPercentage(8),
      margin: EdgeInsets.only(bottom: 1, left: 1, right: 1, top: 1),
      child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        FlatButton(
            onPressed: (() {
              screen = Home();
              setState(() {});
            }),
            child: Column(children: [
              SizedBox(height: getHieghtPercentage(1)),
              Icon(
                Icons.home,
                color: Colors.white,
              ),
              Text('Home', style: TextStyle(color: Colors.white))
            ])),
        FlatButton(
            onPressed: (() {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => OrderScreen()));
            }),
            child: Column(children: [
              SizedBox(height: getHieghtPercentage(1)),
              Icon(Icons.shopping_cart, color: Colors.white),
              Text('Cart', style: TextStyle(color: Colors.white))
            ])),
        FlatButton(
            onPressed: (() {}),
            child: Column(children: [
              SizedBox(height: getHieghtPercentage(1)),
              Icon(Icons.search, color: Colors.white),
              Text('Explore', style: TextStyle(color: Colors.white))
            ])),
        FlatButton(
            onPressed: (() {
              screen = ProfileScreen();
              setState(() {});
            }),
            child: Column(children: [
              SizedBox(height: getHieghtPercentage(1)),
              Icon(Icons.login, color: Colors.white),
              Text('Account', style: TextStyle(color: Colors.white))
            ]))
      ]),
    );
  }

  double getHieghtPercentage(double percentage) {
    return (MediaQuery.of(HomeScreenState.contextt).size.height / 100) *
        percentage;
  }
}

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomeState();
  }
}

var select_Chair;

class HomeState extends State<Home> {
  @override
  void initState() {

  setItems();
  setCategories();

  Future.delayed(Duration(milliseconds: 5000),((){setData();}));

  WebServer().getdata(API.chairs); //calling data from the api
    //Data().getDishes();
  }

  static late BuildContext contextt;
  static List<dynamic> foods = [];
  static List dishes = [];
  List<Widget> foodList = [];
  var select_Chair;
  static  List categories = [];
  static List items = [];
  static var selectedItem;

  setCategories() async{
   await  WebServer().getcategory(API.category);
   setState(() {});
  }

  setItems() async{
    await WebServer().getitems(API.items); 
  }

  setData(){
     getFoodItems();
  }

  @override
  Widget build(BuildContext context) {
    contextt = context;
    return Scaffold(
      // appBar: AppBar(backgroundColor: Colors.red, actions: [
      //   IconButton(onPressed: (() {}), icon: Icon(Icons.notifications))
      // ]),
      // drawer: Drawer(),
      floatingActionButton: FloatingActionButton.extended(
          backgroundColor: Colors.black,
          onPressed: (() {
            if (StaticField.cart.length > 0) {
              Navigator.push(context, MaterialPageRoute(builder: ((context) {
                return OrderScreen();
              })));
            } else {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text('No Foods in Cart yet, hurry up Order Now')));
            }
          }),
          label: Icon(Icons.flatware)),
      body: Container(
          alignment: Alignment.center,
          margin: EdgeInsets.all(5),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            SizedBox(height: getHieghtPercentage(5)),
            Text('Fast and Delicious',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
            SizedBox(height: getHieghtPercentage(2)),
            getaddressBox(),
            SizedBox(height: getHieghtPercentage(2)),
            Container(
                width: getWidthPercentage(100),
                height: getHieghtPercentage(8),
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: categories.length,
                    itemBuilder: ((context, index) {
                      return Container(
                          margin: EdgeInsets.all(getWidthPercentage(1)),
                          child: getDishButton(categories[index]as Map<String,dynamic>));
                    }))),
            SizedBox(height: getHieghtPercentage(2)),
            Flexible(
                child: Container(
                    child: ListView.builder(
                        itemCount: foodList.length,
                        itemBuilder: ((context, index) {
                          return foodList[index];
                        }))))
          ])),
    );
  }

  // getAllFoods() {
  //   //print(items);
  //   items.forEach((element) {
  //     foods.addAll(element);
  //   });
  //   //getDishes();
  //   getFoodItems();
  // }

  // getDishes() {
  //   Data.Tags.forEach((element) {
  //     dishes.add(element);
  //   });
  //   getFoodItems();
  // }
 
  getFoodItems() {
    foodList = [];
    foods!=null?
        foods.forEach((element) {
          items.add(element);
        }):null;

    bool isOdd = items.length.isOdd;
    for (int i = 0; i <= items.length - 2; i++) {
      var item1 = items[i];
      var item2 = items[i + 1];
      foodList.add(Row(
        children: [
          Flexible(child: getFoodBoxes(item1)),
          SizedBox(width: 5),
          Flexible(child: getFoodBoxes(item2))
        ],
      ));
      items.removeAt(i + 1);
    }
    if (isOdd) {
      var item = items.last;
      foodList.add(getFoodBoxes(item));
    }
    setState(() {});
  }

  Widget getFoodBoxes(var item) {
    bool isOrdered = false;

    isOrdered = StaticField.cart.contains(item);

    Widget increment() {
      int x = 0;
      StaticField.cart.forEach((element) {
        if (element == item) {
          x++;
        }
      });
      return Container(
          margin: EdgeInsets.all(5),
          decoration: BoxDecoration(
              border: Border.all(color: Colors.red),
              borderRadius: BorderRadius.circular(10)),
          child: Row(children: [
            Flexible(
                fit: FlexFit.tight,
                child: IconButton(
                    onPressed: (() {
                      StaticField.cart.add(item);
                      setState(() {
                        // selectedItem=item;
                        getFoodItems();
                      });
                      setState(() {});
                    }),
                    icon: Icon(Icons.add))),
            Container(
                color: Colors.white,
                child:
                    Text('$x', style: TextStyle(fontWeight: FontWeight.bold))),
            Flexible(
                fit: FlexFit.tight,
                child: IconButton(
                    onPressed: (() {
                      setState(() {
                        StaticField.cart.remove(item);
                        setState(() {
                          getFoodItems();
                        });
                      });
                    }),
                    icon: Icon(Icons.remove))),
          ]));
    }

    Widget button() {
      //add to basket button
      return FlatButton(
          onPressed: (() {
            showDialog(
                context: context,
                builder: (context) {
                  return Dialog(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40)),
                    elevation: 16,
                    child: Container(
                      child: ListView(
                        shrinkWrap: true,
                        children: <Widget>[
                          SizedBox(
                            height: 20,
                          ),
                          Center(
                            child: Text(
                              'Order Details',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          _buildContent()
                        ],
                      ),
                    ),
                  );
                });

            StaticField.cart.add(item);
            setState(() {
              getFoodItems();
            });
          }),
          child: Text('ADD TO BUSKET', style: TextStyle(color: Colors.white)),
          color: Colors.red);
    }

    return Container(
      //the products data
      margin: EdgeInsets.all(getWidthPercentage(3)),
      height: getHieghtPercentage(35),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey, width: 1),
          borderRadius: BorderRadius.circular(8)),

      child: Container(
          margin: EdgeInsets.all(2),
          child: Column(children: [
            Flexible(
                child: Image.memory(
              base64Decode(item['image']),width: getWidthPercentage(40),
              height: getHieghtPercentage(20),
            )),
            SizedBox(height: getHieghtPercentage(2)),
            Text(item['name'], style: TextStyle(fontWeight: FontWeight.bold)),
            SizedBox(height: getHieghtPercentage(2)),
            Container(
              child: increment(),
              width: 120,
              height: 50,
              //color: Colors.red,
            ),
            button(),
            //WebServer().getdata(API.chairs)
          ])),
    );
  }

  Widget _buildContent() {
    //dialouge boxs
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(children: <Widget>[
          Row(
            children: <Widget>[
              new Flexible(
                  child: DropdownButton<String>(
                hint: Text("Select Chair No. "),
                isExpanded: true,
                style: TextStyle(color: Colors.black),
                items: ka.map((String item) {
                  //displaying data from api
                  return DropdownMenuItem<String>(
                    value: item,
                    child: Text(item),
                  );
                }).toList(),
                value: select_Chair,
                onChanged: (newvalue) {
                  setState(() {
                    select_Chair = newvalue;
                    return select_Chair;
                  });
                },
              ))
            ],
          ),
          Row(
            children: <Widget>[
              new Flexible(
                child: new TextFormField(
                  decoration: const InputDecoration(
                    // border: OutlineInputBorder(),
                    labelText: 'Person Name', hintText: 'Person Name',
                  ),
                  initialValue: 'Alia Daher',
                ),
              )
            ],
          ),
          SizedBox(height: 5),
          Row(
            children: <Widget>[
              new Flexible(
                child: new TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Extra',
                    hintText: 'Extras',
                  ),
                  initialValue: 'Hot, Double Shots, Sugar',
                ),
              ),
            ],
          ),
          SizedBox(height: 15),
          Row(children: [
            Expanded(
              child: Flexible(
                  child: Align(
                alignment: Alignment.center,
                child: FlatButton(
                  onPressed: () {},
                  height: 40,
                  minWidth: 200,
                  child: Text('Place Order',
                      style: TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.bold)),
                  color: Colors.red,
                  textColor: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                ),
              )),
            ),
          ]),
          SizedBox(height: 5),
          Row(
            children: [
              Flexible(
                  child: Align(
                alignment: Alignment.center,
                child: FlatButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('Cancel',
                      style: TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.bold)),
                  color: Colors.white,
                  textColor: Colors.red,
                ),
              ))
            ],
          ),
          SizedBox(height: 10),
        ]));
  }

  Widget getDishButton(Map dish) {
    return FloatingActionButton.extended(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        onPressed: (() {
          getFoodItems();
        }),
        label: Row(children: [
          Icon(Icons.food_bank, color: Colors.red[300]),
          SizedBox(width: 1),
          Text(dish['name'], style: TextStyle(color: Colors.black))
        ]));
  }

  Widget getaddressBox() {
    return FloatingActionButton.extended(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        backgroundColor: Colors.white,
        onPressed: (() {}),
        label: Row(children: [
          Icon(
            Icons.gps_fixed,
            color: Colors.black,
          ),
          SizedBox(width: 5),
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text('Room Number', style: TextStyle(color: Colors.black)),
            Text('Chair', style: TextStyle(color: Colors.red[300]))
          ])
        ]));
  }

  double getHieghtPercentage(double percentage) {
    return (MediaQuery.of(HomeScreenState.contextt).size.height / 100) *
        percentage;
  }

  double getWidthPercentage(double percentage) {
    return (MediaQuery.of(HomeScreenState.contextt).size.width / 100) *
        percentage;
  }
}
