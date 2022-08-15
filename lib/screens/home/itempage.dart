import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:madd/models/profile_item.dart';
import 'package:madd/screens/home/userinfo.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server/gmail.dart';

import '../authentication/google_auth_api.dart';

class Userprof extends StatefulWidget {

  Profile_item profile;
  Userprof({required this.profile});
  @override
  _UserprofState createState() => _UserprofState();
}

class _UserprofState extends State<Userprof> {
  @override
  Widget build(BuildContext context) {
     Profile_item profile=widget.profile;
     Future sendemail() async{
       final user=await GoogleAuthApi.signIn();
       if (user==null) return;
       final email=user.email;
       final auth= await user.authentication;
       final token='';
       final smtpServer=gmailSaslXoauth2(email, token);
       final message=Message()
         ..from(email)
         ..recipients=[profile.email]
         ..subject='Buyer Found'
         ..text='Hello, I am interested in buying your product, ${profile.p_name}';
       await send(message,smtpServer);
     }
    return Scaffold(
      body: Container(
        width: 380,
        height: 700,
       color: Color.fromRGBO( 255, 248, 220,1),
          child: Column(
                children: <Widget>[
                  Container(
                    width: 380,
                    height: 300,
                    decoration: new BoxDecoration(color: Colors.orange[900],
                      shape: BoxShape.rectangle,borderRadius: BorderRadius.only(bottomRight: Radius.circular(65))),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text('${profile.p_name}',style: TextStyle(color: Colors.deepOrange,fontWeight: FontWeight.bold,fontSize: 30),),
                      Text('${profile.desc}',style: TextStyle(color: Colors.black54,fontSize: 27),),
                      Text('Rental Price:  ${profile.r_price}',style: TextStyle(color: Colors.black54,fontSize: 21),),
                      Text('Selling Price:  ${profile.b_price}',style: TextStyle(color: Colors.black54,fontSize: 21),),
                      Text('Contact No.:  ${profile.pno}',style: TextStyle(color: Colors.black54,fontSize: 21),),
                      SizedBox(height: 10,),
                    ],
                  ),

                            RaisedButton(
                              color: Colors.orange[50],
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children:  <Widget>[
                                    Container(
                                        width: 130,
                                        height: 55,
                                        decoration: BoxDecoration(
                                          gradient: LinearGradient(
                                            colors: [
                                              Colors.orangeAccent,
                                              Colors.redAccent,
                                            ],
                                            begin: Alignment.topLeft,
                                            end: Alignment.bottomRight,
                                          ),
                                          borderRadius: BorderRadius.circular(10),

                                        ),
                                        child: Center(
                                          child: Text(
                                            'Mail the Owner',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 12,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        )
                                    )]),onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>UserInfo(profile: profile)));},
                              padding: EdgeInsets.symmetric(vertical: 0),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(48.0))),
                            ),
                    ],
                  ),

                ),

    );
  }
}
