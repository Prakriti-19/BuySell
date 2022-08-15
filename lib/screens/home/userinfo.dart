import 'package:flutter/material.dart';
import 'package:madd/models/user2.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server/gmail.dart';
import '../../models/profile_item.dart';
import '../../shared/constraints.dart';
import 'package:madd/screens/home/flash.dart';
import 'mail.dart';
class UserInfo extends StatefulWidget {
final Profile_item profile;
UserInfo({required this.profile});

@override
_UserInfoState createState() => _UserInfoState();
}

class _UserInfoState extends State<UserInfo> {
  @override
  user2 user = user2(name: '', roll_no: '');
  String u_name = '';
  String u_roll_no = '';
  Widget build(BuildContext context) {
    Profile_item profile = widget.profile;
    Future sendemail() async{
      final email='buy132sell@gmail.com';
      String password='Buy@182008';
      final smtpServer=gmail(email, password);
      final message=Message()
        ..from=Address(email,'Buy and sell')
        ..recipients=[profile.email]
        ..subject='Buyer Found'
        ..text='Hello, ${user.name} of your college is interested in your enlisted product, ${profile.p_name} on BUY & SELL. Contact them on the given email id:\n${user.roll_no}@iiita.ac.in';
      try{
        await send(message,smtpServer);}
      on MailerException catch(e){print(e);}
    }
    return Scaffold(
      appBar: new PreferredSize(
        child: new Container(
          padding: new EdgeInsets.only(
              top: MediaQuery.of(context).padding.top
          ),
          child: new Padding(
            padding: const EdgeInsets.only(
                left: 30.0,
                top: 20.0,
                bottom: 20.0
            ),
            child: new Text(
              'Enter Details',
              style: new TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w500,
                  color: Colors.white
              ),
            ),
          ),
          decoration: new BoxDecoration(
            gradient: new LinearGradient(
                colors: [
                  Colors.orangeAccent,
                  Colors.redAccent,
                ]
            ),
          ),
        ),
        preferredSize: new Size(
            MediaQuery.of(context).size.width,
            150.0
        ),
      ),
      body: SingleChildScrollView(
        child:Container(
        // decoration: BoxDecoration(
        //   image: DecorationImage(
        //     image: AssetImage("images/pp.png"),
        //     alignment: Alignment.topCenter,
        //   ),
        // ),
            padding: EdgeInsets.fromLTRB(9, 0, 9, 0),
            child: Column(children: [
    SizedBox(height: 360.0),
    TextFormField(
    decoration: textInputDecoration.copyWith(hintText: 'Your Name',hoverColor: Colors.orange[400],fillColor: Colors.orange[50]),
    validator: (val) => val!.isEmpty ? 'please enter your  name' : null,
    onChanged: (val) => setState(() => u_name = val),
    ),
    SizedBox(height: 30.0),
    Padding(
    padding: EdgeInsets.only(left: 20.0, right: 20.0),
    ),
    TextFormField(
    decoration:
    textInputDecoration.copyWith(hintText: 'Your Enrollment Number',hoverColor: Colors.orange[400],fillColor: Colors.orange[50],),
    validator: (val) =>
    val!.isEmpty ? 'please enter your enrollment number' : null,
    onChanged: (val) => setState(() => u_roll_no = val),
    ),
    SizedBox(height: 20.0),
    Padding(
    padding: EdgeInsets.only(left: 20.0, right: 20.0),
    ),
    RaisedButton.icon(
    color: Colors.white,
    label: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children:  <Widget>[
    Container(
    width: 140,
    height: 50,
    decoration: BoxDecoration(
    gradient: LinearGradient(
    colors: [
    Colors.orangeAccent,
    Colors.redAccent,
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    ),
    borderRadius: BorderRadius.circular(20),),
    child: Center(
    child: Text(
    'Submit',
    style: TextStyle(
    color: Colors.white,
    fontSize: 17,
    fontWeight: FontWeight.bold),
    ),
    )
    )]),
    icon: Icon(
    Icons.account_balance_outlined,
    color: Colors.transparent,
    size: 0.0,
    ),
    elevation: 0,
    onPressed: () {
    // user = user2(name: u_name, roll_no: u_roll_no);
    // Navigator.push(
    //     context,
    //     MaterialPageRoute(
    //         builder: (context) => mail(
    //               profile: profile,
    //               usser: user2(name: u_name, roll_no: u_roll_no),
    //             )));
    user = user2(name: u_name, roll_no: u_roll_no);
    sendemail();
    Navigator.push(context, MaterialPageRoute(builder: (context)=>Flash())) ;
    },
    padding: EdgeInsets.symmetric(vertical: 5),
    shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(48.0))),
    ),
    ]))));
  }
}
