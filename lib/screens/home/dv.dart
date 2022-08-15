import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:madd/screens/home/flash.dart';
import 'package:madd/screens/home/product_display.dart';
import 'package:madd/screens/home/product_listing.dart';
import '../../services/auth.dart';

class dv extends StatefulWidget {
  @override
  _dvState createState() => _dvState();
}

class _dvState extends State<dv> {
  final AuthService _auth = AuthService();
  String cat = '';
  @override
  Widget build(BuildContext context) {
    final Shader _linearGradient = LinearGradient(
      colors: [Colors.orange, Colors.red],
      begin: Alignment.centerLeft,
      end: Alignment.bottomRight,
    ).createShader(Rect.fromLTWH(0.0, 0.0, 320.0, 80.0));
    return Scaffold(
        body: SingleChildScrollView(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          SizedBox(
            height: 18,
          ),
          Container(
              child: Text(
            '  Heyy, What Are You \n  Looking For?',
            style: TextStyle(
                foreground: Paint()..shader = _linearGradient,
                fontSize: 29,
                fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic
            ),
          )),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Material(
              elevation: 10,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0),),
              child: Container(
                child: TextField(
                  cursorColor: Colors.grey,
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                      icon: Icon(
                        Icons.search,
                        color: Colors.deepOrange,
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => p_display(cat: cat)));
                      },
                    ),
                    fillColor: Colors.orange[50],
                    filled: true,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none), // OutlineInputBo
                    hintText: '   Search ',
                    hintStyle: TextStyle(color: Colors.deepOrange, fontSize: 18),
                  ),
                  onChanged: (val) {
                    setState(() => cat = val);
                  },
                ),
              ),
            ),
          ),
          SizedBox(
            height: 18,
          ),
          Container(
            child: Column(
              children: [
                Row(
                  children: [
                    SizedBox(
                      width: 8,
                    ),
                    Card(
                      elevation: 8,
                      shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                      shadowColor: Colors.deepOrange,
                      child: Container(
                        decoration: new BoxDecoration(
                            image: new DecorationImage(
                          image: new AssetImage("images/electronics.png"),
                         // fit: BoxFit.fill,
                        )),
                        height: 150,
                        width: 161,
                        child: FlatButton(
                            textColor: Colors.transparent,
                            child: Text(
                              'Electronics',
                            ),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          p_display(cat: 'electronics')));
                            }))),
                    SizedBox(
                      width: 8,
                    ),
                    Card(
                        elevation: 8,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10))),
                        shadowColor: Colors.deepOrange,
                        child: Container(
                            decoration: new BoxDecoration(
                                image: new DecorationImage(
                                  image: new AssetImage("images/book.png"),
                                  // fit: BoxFit.fill,
                                )),
                            height: 150,
                            width: 161,
                            child: FlatButton(
                                textColor: Colors.transparent,
                                child: Text(
                                  'Electronics',
                                ),
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              p_display(cat: 'books')));
                                }))),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 8,
                    ),
                    Card(
                        elevation: 8,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10))),
                        shadowColor: Colors.deepOrange,
                        child: Container(
                            decoration: new BoxDecoration(
                                image: new DecorationImage(
                                  image: new AssetImage("images/cooler.jpg"),
                                  // fit: BoxFit.fill,
                                )),
                            height: 150,
                            width: 161,
                            child: FlatButton(
                                textColor: Colors.transparent,
                                child: Text(
                                  'Electronics',
                                ),
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              p_display(cat: 'cooler')));
                                }))),
                    SizedBox(
                      width: 8,
                    ),
                    Card(
                        elevation: 8,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10))),
                        shadowColor: Colors.deepOrange,
                        child: Container(
                            decoration: new BoxDecoration(
                                image: new DecorationImage(
                                  image: new AssetImage("images/acce.jpg"),
                                  // fit: BoxFit.fill,
                                )),
                            height: 150,
                            width: 161,
                            child: FlatButton(
                                textColor: Colors.transparent,
                                child: Text(
                                  'Electronics',
                                ),
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              p_display(cat: 'accessories')));
                                }))),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 8,
                    ),
                    Card(
                        elevation: 8,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10))),
                        shadowColor: Colors.deepOrange,
                        child: Container(
                            decoration: new BoxDecoration(
                                image: new DecorationImage(
                                  image: new AssetImage("images/health.png"),
                                  // fit: BoxFit.fill,
                                )),
                            height: 150,
                            width: 161,
                            child: FlatButton(
                                textColor: Colors.transparent,
                                child: Text(
                                  'Electronics',
                                ),
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              p_display(cat: 'daily needs')));
                                }))),
                    SizedBox(
                      width: 8,
                    ),
                    Card(
                        elevation: 8,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10))),
                        shadowColor: Colors.deepOrange,
                        child: Container(
                            decoration: new BoxDecoration(
                                image: new DecorationImage(
                                  image: new AssetImage("images/sport.png"),
                                  // fit: BoxFit.fill,
                                )),
                            height: 150,
                            width: 161,
                            child: FlatButton(
                                textColor: Colors.transparent,
                                child: Text(
                                  'Electronics',
                                ),
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              p_display(cat: 'electronics')));
                                }))),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),

        ])),

        bottomNavigationBar: BottomAppBar(
          shape: CircularNotchedRectangle(),
          notchMargin: 0,
          child: Container(
              height: 50,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          MaterialButton(
                              minWidth: 40,
                              onPressed: () {},
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.home_outlined,color: Colors.deepOrange,),
                                  ])),
                          SizedBox(
                            width: 79,
                          ),
                          MaterialButton(
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.add_circle_rounded),
                                  ]),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => P_list()),
                                );
                              }),
                          SizedBox(
                            width: 79,
                          ),
                          MaterialButton(
                              minWidth: 40,
                              onPressed: () async {
                                await _auth.signOut();
                              },
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.logout),
                                  ]))
                        ])
                  ])),
        ));
  }
}
