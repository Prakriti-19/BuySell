import 'package:flutter/material.dart';
import 'package:madd/services/auth.dart';
import 'package:madd/models/user.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:madd/screens/home/wrapper.dart';
import 'package:provider/provider.dart';

class Homepage extends StatelessWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamProvider<Usser?>.value(
      initialData: Usser(uid: ""),
      value: AuthService().user,
      child: MaterialApp(home: wrapper()),
    );
  }
}
