import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:meetingroom/OrderDetailScreen.dart';
import 'package:meetingroom/main.dart';
import 'package:meetingroom/orderHistoryScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ProfileScreenState();
  }
}

bool _readaonly = false;
String str = '';

class ProfileScreenState extends State<ProfileScreen> {
  ProfileScreenState() {
    read();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          margin: EdgeInsets.only(
              left: getWidthPercentage(5), right: getWidthPercentage(5)),
          child: ListView(children: [
            Row(children: [
              Image(
                  image: AssetImage('assets/coffee.png'),
                  height: getHieghtPercentage(20),
                  width: getWidthPercentage(20)),
              SizedBox(width: getWidthPercentage(1)),
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text('CTH COFFEE',
                    style: TextStyle(color: Colors.red,
                        fontSize: getHieghtPercentage(4),
                        fontWeight: FontWeight.bold)),
                SizedBox(height: getHieghtPercentage(1)),
                // Text('madi@ge')
              ])
            ]),
            SizedBox(height: getHieghtPercentage(2)),
            Text('My Account',
                style: TextStyle(fontSize: getHieghtPercentage(3))),
                
            SizedBox(height: getHieghtPercentage(2)),
            // ListTile(
            //     onTap: () {},
            //     title: Text('Address'),
            //     leading: Icon(Icons.gps_fixed, color: Colors.red),
            //     trailing:
            //         Icon(Icons.arrow_right, size: getHieghtPercentage(5))),
            // Container(
            //     height: 0.5,
            //     color: Colors.grey[350],
            //     margin: EdgeInsets.only(left: 5, right: 5)),
            ListTile(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: ((context) {
                    return orderHistoryScreen();
                  })));
                },
                title: Text('Order History'),
                leading: Icon(Icons.history, color: Colors.red),
                trailing:
                    Icon(Icons.arrow_right, size: getHieghtPercentage(5))),

            Container(
                height: 0.5,
                color: Colors.grey[350],
                margin: EdgeInsets.only(left: 5, right: 5, top: 10)),
            // ListTile(
            //     onTap: () {},
            //     title: Text('Profile'),
            //     leading: Icon(Icons.account_circle_rounded, color: Colors.red),
            //     trailing:
            //         Icon(Icons.arrow_right, size: getHieghtPercentage(5))),
            // Container(height: 1, color: Colors.black),
            // SizedBox(height: getHieghtPercentage(2)),
            // Text('SETTINGS',
            //     style: TextStyle(fontSize: getHieghtPercentage(3))),
            // Container(
            //     height: 0.5,
            //     color: Colors.grey[350],
            //     margin: EdgeInsets.only(left: 5, right: 5, top: 10)),

            ListTile(
              onTap: () {
                setState(() {
                  room();
                });
              },
              leading: Icon(Icons.room, color: Colors.red),
              title: Text('Meeting room'),
              trailing: Text(
                '$str',
                style: TextStyle(fontSize: getHieghtPercentage(3)),
              ),
            ),
            // Container(
            //     height: 0.5,
            //     color: Colors.grey[350],
            //     margin: EdgeInsets.only(left: 5, right: 5)),
            // ListTile(
            //     onTap: () {},
            //     title: Text('Language'),
            //     leading: Icon(Icons.language, color: Colors.red),
            //     trailing:
            //         Icon(Icons.arrow_right, size: getHieghtPercentage(5))),
            SizedBox(height: getHieghtPercentage(3)),     
            Container(height: 1, color: Colors.black),
            SizedBox(height: getHieghtPercentage(2)),
            // Container(
            //     height: 0.5,
            //     color: Colors.grey[350],
            //     margin: EdgeInsets.only(left: 5, right: 5)),
            //Container(height: 1, color: Colors.black),
            //SizedBox(height: getHieghtPercentage(2)),
            // Text('REACH OUT TO US',
            //     style: TextStyle(fontSize: getHieghtPercentage(3))),
            // ListTile(
            //     onTap: () {},
            //     title: Text('Whats upp Us'),
            //     leading: Icon(Icons.message, color: Colors.red),
            //     trailing:
            //         Icon(Icons.arrow_right, size: getHieghtPercentage(5))),
            // Container(
            //     height: 0.5,
            //     color: Colors.grey[350],
            //     margin: EdgeInsets.only(left: 5, right: 5)),
            // ListTile(
            //     onTap: () {},
            //     title: Text('Help'),
            //     leading: Icon(Icons.help, color: Colors.red),
            //     trailing:
            //         Icon(Icons.arrow_right, size: getHieghtPercentage(5))),
            // Container(
            //     height: 0.5,
            //     color: Colors.grey[350],
            //     margin: EdgeInsets.only(left: 5, right: 5)),
            // ListTile(
            //     onTap: () {},
            //     title: Text('Contact Us'),
            //     leading: Icon(Icons.call, color: Colors.red),
            //     trailing:
            //         Icon(Icons.arrow_right, size: getHieghtPercentage(5))),
            // Container(height: 1, color: Colors.black),
            ListTile(
                onTap: () async {
                 isLoggedIn=false;
                 final prefs = await SharedPreferences.getInstance();
                 prefs.setBool('isLogin', isLoggedIn);
                 prefs.setString('token', '');
                 Navigator.push(context,MaterialPageRoute(builder: (context) => GettingStarted()));
                },
                title: Text('Sign Out'),
                leading: Icon(Icons.logout, color: Colors.red),
                // trailing:
                //     Icon(Icons.arrow_right, size: getHieghtPercentage(5))
                ),
            Container(
                height: 100,
                width: 100,
                margin: EdgeInsets.only(
                    top: getHieghtPercentage(4),
                    bottom: getHieghtPercentage(4)),
                child: Column(children: [
                  Flexible(
                      child: Row(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                        Flexible(
                            fit: FlexFit.tight, child: Text('Privacy Policy')),
                        Flexible(
                            fit: FlexFit.tight,
                            child: Text('Term of Condition')),
                        Text('Term of Use')
                      ])),
                  Flexible(child: Text('version 1.0.0'))
                ]))
          ])),
    );
  }

  double getHieghtPercentage(double percentage) {
    return (MediaQuery.of(context).size.height / 100) * percentage;
  }

  double getWidthPercentage(double percentage) {
    return (MediaQuery.of(context).size.width / 100) * percentage;
  }

  room() {
    if (str == '') {
      return showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
                title: Text('Meeting room'),
                content: TextFormField(
                  cursorHeight: 25,
                  onFieldSubmitted: (value) {
                    setState(() {
                      str = value;
                      save();
                    });
                  },
                ));
          });
    }
  }

  void save() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.setString('key', str);
  }

  void read() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      str = pref.getString('key')?? '';
    });
  }
}
