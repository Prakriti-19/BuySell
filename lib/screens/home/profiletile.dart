import 'package:flutter/material.dart';
import 'package:madd/screens/home/itempage.dart';
import '../../models/profile_item.dart';

class profiletile extends StatefulWidget {
  final Profile_item profile;
  int ind;
  profiletile({required this.profile, required this.ind});

  @override
  _profiletileState createState() => _profiletileState();
}

class _profiletileState extends State<profiletile> {
  @override
  Widget build(BuildContext context) {
    Profile_item profile = widget.profile;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 7,vertical: 10),
      child: Stack(children: <Widget>[
        Material(
          elevation: 12,
          shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(20)),
      child: Container(
        decoration: new BoxDecoration(
          border:  Border.all(
            color: Colors.orange, //                   <--- border color
            width: 5.0,
          ),
            color: Colors.orange[50],
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(20)),
            height: 93,
            child: Row(children: <Widget>[
              SizedBox(
                width: 5,
              ),
              Container(
                width: 270,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:<Widget>[
                      SizedBox(
                        width: 2,
                      ),
                      Text(
                        '  ${widget.profile.p_name} ',
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20,color: Colors.black54),
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Row(
                        children: [
                          SizedBox(width: 2,),
                          Container(
                            width: 180,
                            child: Text(
                              '  ${widget.profile.desc} ',
                              style: TextStyle(fontSize: 15,color: Colors.black38),
                            ),
                          ),
                        ],
                      ),
                    ]),
              ),
              Container(
                width: 50,
                child: IconButton(
                  color: Colors.orange[700],
                  onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>Userprof(profile: profile)));},
                  padding: EdgeInsets.symmetric(vertical: 0),
                  icon: Icon(Icons.double_arrow_outlined),
                ),
              ),
            ],
            ),
          ),
        )]),);
  }
}
