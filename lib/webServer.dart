import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:meetingroom/api.dart';
import 'package:meetingroom/home.dart';
import 'package:shared_preferences/shared_preferences.dart';

List<String> ka = [];
List<String> category = [];
List<String> chairsorder = [];
var b;
var chairno; //chairnumber
var res; //values from api
List<dynamic> newList = [];
List<dynamic> categoryList = [];

class WebServer {
  // Get Item By Category
  Future<dynamic> getItembyCategory(String categoryId) async {
    final prefs = await SharedPreferences.getInstance();
    String Token = prefs.getString('token') ?? '';

    String url = API.item_byCategory + categoryId;
    http.get(Uri.parse(url), headers: {'Authorization': 'Bearer $Token'}).then(
        (response) {
      if (response.statusCode == 200) {
        var li = (json.decode(response.body)) as List;
        return li;
      }
    });
  }

  // Place Order
  Future<http.Response> placeOrder() async {
    print("oredr api");
    final prefs = await SharedPreferences.getInstance();
    String Token = prefs.getString('token') ?? '';
    var itemdetails = jsonEncode(<String, dynamic>{
      'chairId': 0,
      'description': '',
      'itemid': 0,
      'quantity': 0
    });
    return http.post(
      Uri.parse(API.placeorder),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $Token'
      },
      body: jsonEncode(<String, dynamic>{
        'createdDateTime': DateTime.now(),
        'discription': '',
        'itemDetailes': itemdetails,
        'status': "ACCEPTED",
        'updatedDateTime': DateTime.now()
      }),
    );
  }

  // Login API
  Future<http.Response> loginUser(String username, String password) {
    print("enter");
    return http.post(
      Uri.parse(API.userlogin),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'username': username,
        'password': password,
        'rememberme': true
      }),
    );
  }

  // Chair Details
  Future<dynamic> getdata(String url) async {
    final prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('token') ?? '';
    http.get(Uri.parse(url), headers: {'Authorization': 'Bearer $token'}).then(
        (response) {
      if (response.statusCode == 200) {
        var chairlist = (json.decode(response.body)) as List;
        newList = chairlist
            .map((m) => m['chairNumber'])
            .toList(); //filtering the data required
        //  print(newList);
        newList.forEach((element) {
          ka.add(element); //saving the values to a list
        });
      }
    });

    // //retrieve data from api
    // var request = http.Request('GET', Uri.parse(url)); //getting values from api
    // http.StreamedResponse response = await request.send();
    // if (response.statusCode == 200) {
    //   //waiting for response
    //   res = await response.stream.bytesToString();
    //   var li = json.decode(res) as List; //savings values to li
    //   newList = li
    //       .map((m) => m['chairNumber'])
    //       .toList(); //filtering the data required
    //   //  print(newList);
    //   newList.forEach((element) {
    //     ka.add(element); //saving the values to a list
    //   });
    // }
  }

  // Get Categories
  Future<dynamic> getcategory(String url) async {
    final prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('token') ?? '';
    http.get(Uri.parse(url), headers: {'Authorization': 'Bearer $token'}).then(
        (response) {
      if (response.statusCode == 200) {
        var li = (json.decode(response.body)) as List;
        categoryList = li.map((m) => {'name':m['name'],'id':m['id']}).toList();
        // print("before");print(categoryList);print("after");
        HomeState.categories=categoryList;
        (HomeState.contextt as StatefulElement).state.setState(() {});
        return categoryList;
      }
    });



    // var request = http.Request('GET', Uri.parse(url));
    // http.StreamedResponse response = await request.send();
    // if (response.statusCode == 200) {
    //   res = await response.stream.bytesToString();
    //   var li = json.decode(res) as List;

    //   categoryList = li.map((m) => m['name']).toList();
    //   return categoryList;
    // }
  }

  //Get Products
  Future<dynamic> getitems(String url) async {
    final prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('token') ?? '';
    http.get(Uri.parse(url), headers: {'Authorization': 'Bearer $token'}).then(
        (response) {
      if (response.statusCode == 200) {
        var li = (json.decode(response.body)) as List;
        HomeState.foods.clear();
        HomeState.foods=li;
        (HomeState.contextt as StatefulElement).state.setState(() {});
        return li;
      }
    });
    // var request = http.Request('GET', Uri.parse(url));
    // http.StreamedResponse response = await request.send();
    // if (response.statusCode == 200) {
    //   res = await response.stream.bytesToString();
    //   var li = json.decode(res) as List;
    //   return li;
    // }
  }

// Get UserDetail
  Future<dynamic> userDetail() async {
    final prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('token') ?? '';
    http.get(Uri.parse(API.userDetail),
        headers: {'Authorization': 'Bearer $token'}).then((response) {
      if (response.statusCode == 200) {
        var li = (json.decode(response.body)) as List;
        return li;
      }
    });
  }

  // UserLogin({
  //   var chairs,
  // }) async {
  //   await http.post(Uri.parse(API.login),
  //       body: {"username": "", "password": ""}).then((value) async {
  //     var mp = json.decode(value.body);
  //     String token = mp['token'];
  //     // var response = await http.get(Uri.parse(API.news),
  //     //     headers: {'Authorization': 'Bearer $token'});
  //     //Data.response = response.body;
  //   });
  // }

  // post(String url) async {
  //   await http.post(Uri.parse(url), body: {""});
  // }

  //User Login
  // Future<dynamic> userLogin(String url) async {
  //   var request = http.Request('POST', Uri.parse(url));
  //   http.StreamedResponse response = await request.send();
  //   if (response.statusCode == 200) {
  //     res = await response.stream.bytesToString();
  //     var token = json.decode(res) as String;
  //     (token);
  //     return token;

  //   var request = http.post(Uri.parse(API.userlogin),
  //       body: {"username": "", "password": ""}).then((value) async {
  //     var mp = json.decode(value.body);
  //     String token = mp['token'];
  //   });

  //   }
  // }
  // Future<dynamic> UserLogin(String username,String password)  async {
  //   print(username+password);
  //   await http.post(Uri.parse(API.login),
  //     body: {"username":username, "password": password,"rememberme":true}).then((value) async {
  //     var mp = json.decode(value.body);
  //     String token = mp['id_token'];
  //     print(token);
  //     return token;
  //   });
  // }

}
