import 'package:flutter/material.dart';
import 'package:madd/services/auth.dart';
import 'package:madd/screens/authentication/signin.dart';
import 'package:flutter/services.dart';
import '../home/dv.dart';
class Register extends StatefulWidget {
  //const signIn({Key? key}) : super(key: key);
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget buildEmail() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[

        Text(
          'Enter your Email',
          style: TextStyle(
            color: Colors.orange,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 10),
        Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
            color: Colors.orange[50],
            borderRadius: BorderRadius.circular(16),
          ),
          height: 60,
          child: TextFormField(
              keyboardType: TextInputType.emailAddress,
              style: TextStyle(color: Colors.black87),
              decoration: InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.only(top: 14),
                  prefixIcon: Icon(Icons.email, color: Colors.orange),
                  hintText: 'Email',
                  hintStyle: TextStyle(color: Colors.orange[200])),
              validator: (val) => val!.isEmpty ? 'Enter an email' : null,
              onChanged: (val) {
                setState(() => email = val);
              }
          ),
        )
      ],
    );
  }

  Widget buildPassword() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text('Password',
          style: TextStyle(
            color: Colors.orange,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 10),
        Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
            color: Colors.orange[50],
            borderRadius: BorderRadius.circular(16),
          ),
          height: 60,
          child: TextFormField(
            obscureText: true,
            style: TextStyle(color: Colors.black87),
            decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 14),
                prefixIcon: Icon(Icons.lock, color: Colors.orange),
                hintText: 'Password',
                hintStyle: TextStyle(color: Colors.orange[200])),
            validator: (value) => value!.length < 6 ? 'Enter a password of 6 or more characters' : null,
            onChanged: (val) {setState(() => password = val);},
          ),
        )
      ],
    );
  }

  Widget buildRegisterBtn() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25),
      width: double.infinity,
      child: RaisedButton(
        elevation: 5,
        onPressed: () async {
          dynamic result = await _auth.registerWithEmailAndPassword(email, password);
          if (result == null) {setState(() {error = 'could not register';});
          }
          void Demo2() async{
            if(email.substring(email.indexOf('@'))=='@iiita.ac.in'){
              await Navigator.push(context, MaterialPageRoute(builder: (context) => dv()),);}
            else{
              Widget okButton = TextButton(
                child: Text("OK"),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => signIn()),);
                },
              );
              AlertDialog alert =AlertDialog(content: Text('please enter your IIITA mail id.'),actions: [okButton ]);
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return alert;
                },);
              email='';
            }
          }
          Demo2();
        },
        padding: EdgeInsets.all(15),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        color: Colors.white,
        child: Text(
          'REGISTER',
          style: TextStyle(
              color: Colors.orange,
              fontSize: 18,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  @override
  final AuthService _auth = AuthService();
  String email = '';
  String password = '';
  String error = '';

  final _formKey = GlobalKey<FormState>();

  Widget build(BuildContext context) {
    return Scaffold( //backgroundColor: Color.fromARGB(253, 237, 203, 1),
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: GestureDetector(
          child: Stack(children: <Widget>[
            Container(
              height: double.infinity,
              width: double.infinity,
              child: SingleChildScrollView(
                physics: AlwaysScrollableScrollPhysics(),
                padding: EdgeInsets.symmetric(
                  horizontal: 25,
                  vertical: 60,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                        child: CircleAvatar(
                            radius: 30.0,
                            backgroundColor:
                            Colors.orange,
                            child: const Icon(
                              Icons.person,
                              color: Colors.white,
                              size: 28,
                            ))),
                    SizedBox(height: 70),
                    buildEmail(),
                    SizedBox(height: 20),
                    buildPassword(),
                    SizedBox(height: 45),
                    buildRegisterBtn(),
                    SizedBox(height: 45),
                    TextButton(
                        style: TextButton.styleFrom(
                          padding: const EdgeInsets.all(16.0),
                          primary: Colors.white,
                          textStyle: const TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                        onPressed: () =>
                            Navigator.push(context, MaterialPageRoute(
                                builder: (context) => signIn()),),
                        child: RichText(
                            text: TextSpan(children: [
                              TextSpan(
                                  text: 'Already a User?',
                                  style: TextStyle(
                                      color: Colors.black12,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500)),
                              TextSpan(
                                  text: 'Sign in',
                                  style: TextStyle(
                                      color: Colors.orange,
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold))
                            ]))
                    ),
                  ],
                ),
              ),
            )
          ]),
        ),
      ),
    );
  }
}

