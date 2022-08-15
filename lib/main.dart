import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:madd/main2.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    theme:
    ThemeData(primaryColor: Colors.red, accentColor: Colors.yellowAccent),
    debugShowCheckedModeBanner: false,
    home: SplashScreen(),
  ));
}
class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigationtohome();
  }
  _navigationtohome()async{
    await Future.delayed(Duration(seconds:2), () {});
    Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (context) =>Homepage()));
  }
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(255, 248, 220,1),
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            color: Color.fromARGB(1, 255, 248, 220),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    //Image.network('https://ibb.co/CMBgCyf'),
                    Padding(padding: EdgeInsets.only(top:60.0,bottom: 10.0)),
                    Image(image: AssetImage('images/temp.png')),
                  ],
                ),
              ),
              Expanded(flex:1,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        CircularProgressIndicator(color: Colors.orange[700],),
                        Padding(
                          padding: EdgeInsets.only(top: 20.0),
                        ),
                      ]
                  ))
            ],
          )
        ],
      ),
    );
  }
}