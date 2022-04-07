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
        body: Column(children: [
      SizedBox(height: 20.0),
      Padding(
        padding: EdgeInsets.only(left: 20.0, right: 20.0),
      ),
      TextFormField(
        decoration: textInputDecoration.copyWith(hintText: 'Your Name'),
        validator: (val) => val!.isEmpty ? 'please enter your  name' : null,
        onChanged: (val) => setState(() => u_name = val),
      ),
      SizedBox(height: 20.0),
      Padding(
        padding: EdgeInsets.only(left: 20.0, right: 20.0),
      ),
      TextFormField(
        decoration:
            textInputDecoration.copyWith(hintText: 'Your Enrollment Number'),
        validator: (val) =>
            val!.isEmpty ? 'please enter your enrollment number' : null,
        onChanged: (val) => setState(() => u_roll_no = val),
      ),
      SizedBox(height: 20.0),
      Padding(
        padding: EdgeInsets.only(left: 20.0, right: 20.0),
      ),
      ElevatedButton(
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
          child: Text("Submit")),
    ]));
  }
}
