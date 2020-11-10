import'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';


class AllDestination extends StatefulWidget {
  @override
  _AllDestinationState createState() => _AllDestinationState();
}

class _AllDestinationState extends State<AllDestination> {
  Map data;
  List userData;

  Future getData() async {
    http.Response response = await http.get("https://my-json-server.typicode.com/Karthika-Nair99/place/db");
    data = json.decode(response.body);
    setState(() {
      userData = data["posts"];
    });

  }
  @override
  void initState(){
    super.initState();
    getData();
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
        itemCount:userData== null?0:userData.length ,
        itemBuilder: (BuildContext context, int index){
          return Stack(
              children:[Container(
                margin: EdgeInsets.fromLTRB(40.0, 5.0, 20.0, 5.0),
                height: 120.0,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20.0),
                ),
          child: Padding(
          padding: EdgeInsets.fromLTRB(100.0, 20.0, 20.0, 20.0),
          child: Column(
          mainAxisAlignment:MainAxisAlignment.center ,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

          Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          Column(


          children: [
          Text(userData[index]["name"],
            style: TextStyle(
              fontSize: 26.0,
              fontWeight: FontWeight.w600,
            ),
          ),
            Text(userData[index]["location"],
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.w600,
                color: Colors.grey,
              ),
            ),
          ]

          ),])],),),


          ),
                Positioned(
                  left: 20.0,
                  top: 15.0,
                  bottom: 15.0,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20.0),
                    child: Image(
                      width: 110.0,

                      image: NetworkImage(
                        userData[index]["picture"],
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ]
          );

        },
      ),
    );
  }
}
//
