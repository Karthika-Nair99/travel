
import 'package:flutter/cupertino.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';
class Hp extends StatefulWidget {
  @override
  _HpState createState() => _HpState();
}

class _HpState extends State<Hp> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        backgroundColor:Color(0xFFFBF3FB),
        appBar: AppBar(
          title: Text('Helpline Numbers'),
          backgroundColor:Colors.purple,
        ),
        body: Container(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: [


                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Police", style: TextStyle(fontSize: 30,
                          color:Colors.black),),
                      SizedBox(height: 20,),
                      Text("Ambulance", style: TextStyle(fontSize: 30,
                          color:Colors.black),),
                      SizedBox(height: 20,),
                      Text("Women Helpline", style: TextStyle(fontSize: 30,
                          color:Colors.black),),
                      SizedBox(height: 20,),
                      Text("Tourist Helpline", style: TextStyle(fontSize: 30,
                          color:Colors.black),),

                    ],
                  ),
                  SizedBox(width: 50,),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RaisedButton(
                        child: Text("Call", style: TextStyle(fontSize: 20,
                            color:Colors.white),),
                        onPressed:() {
                          launch(('tel:100'));
                        },
                        color: Colors.purple,),
                      SizedBox(height: 5,),
                      RaisedButton(
                        child: Text("Call", style: TextStyle(fontSize: 20,
                            color:Colors.white),),
                        onPressed:() {
                          launch(('tel:102'));
                        },
                        color: Colors.purple,),
                      SizedBox(height: 5,),
                      RaisedButton(
                        child: Text("Call", style: TextStyle(fontSize: 20,
                            color:Colors.white),),
                        onPressed:() {
                          launch(('tel:1091'));
                        },
                        color: Colors.purple,),
                      SizedBox(height: 5,),
                      RaisedButton(
                        child: Text("Call", style: TextStyle(fontSize: 20,
                            color:Colors.white),),
                        onPressed:() {
                          launch(('tel:1363'));
                        },
                        color: Colors.purple,),

                    ],
                  )

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

