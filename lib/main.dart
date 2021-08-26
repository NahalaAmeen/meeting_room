import 'dart:convert';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:meetingroom/webServer.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'home.dart';
import 'package:lottie/lottie.dart';

void main() {
  runApp(MyApp());
}
bool isLoggedIn=false;
class MyApp extends StatelessWidget {
  // MyApp() {
  //   WebServer().getdata(API.chairs);
  // }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
      theme: ThemeData(appBarTheme: AppBarTheme(color: Colors.red)),
    );
  }
}

class SplashScreen extends StatelessWidget {
  static late BuildContext contextt;
  @override
  Widget build(BuildContext context) {
    contextt = context;
    toNextScreen();
    return Scaffold(
        backgroundColor: Colors.red[100],
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Flexible(child: Lottie.asset('assets/snacks.json')),
            Flexible(
                child: Container(
                    alignment: Alignment.topCenter,
                    child: Column(
                      children: [
                        SizedBox(height: HeightPercent(10)),
                        Text('CTH COFFEE', style: TextStyle(fontSize: 40)),
                         Text('Made with Love', style: TextStyle(fontSize: 20))
                      ],
                    )))
          ],
        ));
  }

 double HeightPercent(int value) {
   return (MediaQuery.of(contextt).size.height / 100) * value;
 }
  toNextScreen() async {
    await Future.delayed(Duration(seconds: 5));
    Navigator.push(
        contextt, MaterialPageRoute(builder: (contextt) => GettingStarted()));
  }
}

class GettingStarted extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return GettingStartedState();
  }
}

class GettingStartedState extends State<GettingStarted> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Flexible(child: Lottie.asset('assets/meetingroom.json')),
      buton()
    ]));
  }

  Widget buton() {
    return Container(
        color: Colors.white,
        padding: EdgeInsets.only(left: 10, right: 10),
        width: MediaQuery.of(context).size.width,
        child: FloatingActionButton.extended(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
            onPressed: (() async {
              final prefs = await SharedPreferences.getInstance();
              isLoggedIn = prefs.getBool('isLogin') ?? false;
              if(isLoggedIn)
                Navigator.push(context,MaterialPageRoute(builder: (context) => HomeScreen()));
              else
                Navigator.push(context,MaterialPageRoute(builder: (context) => LoginScreen()));
              
            }),
            label: Text('Get Started',
                style: TextStyle(fontWeight: FontWeight.bold)),
            backgroundColor: Colors.red));
  }
}

class LoginScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return LoginScreenState();
  }
}

bool loginResult = false;

class LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  @override
  void initState() {
    // WebServer().loginUser(username.text,password.text).then((value) => setToken(value));
  }
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(children: [
      Flexible(
          child: Container(
        alignment: Alignment.topRight,
        //width: MediaQuery.of(context).size.width,
        child: FittedBox(
          child: Image(
            image: AssetImage('assets/Tea.png'),
          ),
        ),
      )),
      Flexible(child: register())
    ]));
  }

  double widthPercent(int value) {
    return (MediaQuery.of(context).size.width / 100) * value;
  }

  double HeightPercent(int value) {
    return (MediaQuery.of(context).size.height / 100) * value;
  }

  Widget register() {
    Widget form() {
      return Center(
          child: SingleChildScrollView(
              child: Form(
                  child: Column(children: <Widget>[
        TextField(
          controller: username,
          decoration: InputDecoration(
              icon: Icon(Icons.account_circle, color: Colors.black),
              labelText: 'Username'),
        ),
        TextField(
          controller: password,
          decoration: InputDecoration(
              icon: Icon(
                Icons.vpn_key,
                color: Colors.black,
              ),
              labelText: 'Password'),
          obscureText: true,
        )
      ]))));
    }

    return Container(
        margin:
            EdgeInsets.only(left: widthPercent(10), right: widthPercent(10)),
        child: ListView(
          children: [
            Text('Let\'s Sign you in',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30)),
            SizedBox(height: HeightPercent(1)),
            Text('Welcome Back, You\'ve'),
            SizedBox(height: HeightPercent(1)),
            Text('been missed!'),
            SizedBox(height: HeightPercent(4)),
            form(),
            SizedBox(height: HeightPercent(8)),
            FloatingActionButton.extended(
                onPressed: (() async {
                  var result=await WebServer().loginUser(username.text,password.text);
                  var mp = json.decode(result.body);
                  String token = mp['id_token'];
                  final prefs = await SharedPreferences.getInstance();
                 
                  if(result.statusCode==200)
                  {
                    prefs.setString('token', token);
                    isLoggedIn=true;
                    prefs.setBool('isLogin', isLoggedIn);
                    Navigator.push(context,MaterialPageRoute(builder: (context) => HomeScreen()));
                   
                  }
                  else {
                    isLoggedIn=false;
                    prefs.setBool('isLogin', isLoggedIn);
                    print("error");
                  }
                }),
                label: Text('Login'),
                backgroundColor: Colors.red,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)))
          ],
        ));
  }
}

class OtpScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return OtpScreenState();
  }
}

class OtpScreenState extends State<OtpScreen> {
  var f1, f2, f3, f4, f5;
  bool otpIncorrect = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            margin: EdgeInsets.all(widthPercent(10)),
            child: ListView(children: [
              SizedBox(height: HeightPercent(5)),
              Text('Verication code',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30)),
              SizedBox(height: HeightPercent(2)),
              Text('Enter the code we send you'),
              SizedBox(height: HeightPercent(10)),
              form(),
              SizedBox(height: HeightPercent(0.5)),
              Container(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                      onPressed: (() {}),
                      child: Text('Resent Code',
                          style: TextStyle(color: Colors.blue[800])))),
              SizedBox(height: HeightPercent(0.5)),
              Container(
                  alignment: Alignment.center,
                  child: Visibility(
                      visible: otpIncorrect,
                      child: Text('OTP Incorrect, please enter Resend Code',
                          style: TextStyle(color: Colors.red)))),
              SizedBox(height: HeightPercent(10)),
              FloatingActionButton.extended(
                  backgroundColor: Colors.red,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                  onPressed: (() {
                    if (f1 == null ||
                        f2 == null ||
                        f3 == null ||
                        f4 == null ||
                        f5 == null) {
                      otpIncorrect = true;
                      setState(() {});
                    } else if (f1 + f2 + f3 + f4 + f5 == '11111') {
                      otpIncorrect = false;
                      setState(() {});
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => HomeScreen()));
                    } else {
                      otpIncorrect = true;
                      setState(() {});
                    }
                  }),
                  label: Text('Confirm'))
            ])));
  }

  Widget form() {
    Widget getFiled(String f) {
      return Flexible(
          child: TextField(
        onChanged: (value) {
          switch (f) {
            case 'f1':
              f1 = value;
              break;
            case 'f2':
              f2 = value;
              break;
            case 'f3':
              f3 = value;
              break;
            case 'f4':
              f4 = value;
              break;
            case 'f5':
              f5 = value;
              break;
          }
        },
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
            border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black))),
      ));
    }

    return Container(
        child: Row(children: [
      getFiled('f1'),
      SizedBox(width: widthPercent(2)),
      getFiled('f2'),
      SizedBox(width: widthPercent(2)),
      getFiled('f3'),
      SizedBox(width: widthPercent(2)),
      getFiled('f4'),
      SizedBox(width: widthPercent(2)),
      getFiled('f5'),
      SizedBox(width: widthPercent(2)),
    ]));
  }

  double widthPercent(int value) {
    return (MediaQuery.of(context).size.width / 100) * value;
  }

  double HeightPercent(double value) {
    return (MediaQuery.of(context).size.height / 100) * value;
  }
}