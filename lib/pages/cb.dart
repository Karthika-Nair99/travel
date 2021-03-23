import 'package:bubble/bubble.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lemmatizer/lemmatizer.dart';
import 'package:travel/pages/helpline.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

enum TtsState { playing, stopped }


class Chb extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //color: Colors.black12,
      home: Scaffold(
        backgroundColor:Theme.of(context).scaffoldBackgroundColor,
        appBar: AppBar(
          title: Text('ASK ChatBot'),
          backgroundColor:Theme.of(context).primaryColor,
        ),
        body: Body(),
      ),
    );
  }
}
class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}
class _BodyState extends State<Body> {
  String name="";
  String final_response="";
  List<Widget> chat = [];
  final _formkey = GlobalKey<FormState>();

IconData icons = Icons.keyboard_voice;
    TextEditingController _textEditingController = TextEditingController();
    @override
    Widget build(BuildContext context) {
      return Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
      Flexible(
      child: SingleChildScrollView(
        //reverse: true,

        child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: chat,
      ),
      )
      //ListView(children: chat,)
      ),
            Row(
              children: <Widget>[
                Expanded(
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100)),
                      color: Color(0xFFE0C1E0),
                      child: TextField(
                          decoration: new InputDecoration(
                              border: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              contentPadding: EdgeInsets.only(
                                  left: 15, bottom: 11, top: 11, right: 15),
                              hintText: 'Enter your query'),
                          controller: _textEditingController,
                          onChanged: (_textEditingController) {
                            if (_textEditingController == '') {
                              setState(() {
                                icons = Icons.keyboard_voice;
                              });
                            } else {
                              setState(() {
                                icons = Icons.send;
                              });
                            }
                          }),
                    )),

                FlatButton(
                  child: CircleAvatar(
                    backgroundColor:Color(0xFF812281) ,
                    child: Icon(icons),
                  ),
                  onPressed: () async{
                    final url = 'http://10.0.2.2:5000/name';






                    setState(() {
                      if (_textEditingController.text != '') {
                        chat.add(
                          Bubble(
                            nip: BubbleNip.rightTop,
                            alignment: Alignment.centerRight,
                            margin: BubbleEdges.all(5),
                            color:Color(0xFFB266B2),
                            child: Text(_textEditingController.text),
                          ),
                        );}});
                    final response = await http.post(url, body: json.encode({'name' : _textEditingController.text}));
                        //print(chatbot('how are you'));
                        //print(_textEditingController.text);
                        final response1 = await http.get(url);

                        //converting the fetched data from json to key value pair that can be displayed on the screen
                        final decoded = json.decode(response1.body) as Map<String, dynamic>;
                        setState(() {
                          final_response = decoded['name'];
                        chat.add(
                          Bubble(
                            nip: BubbleNip.leftTop,
                            alignment: Alignment.centerLeft,
                            margin: BubbleEdges.all(5),
                            color:Color(0xFFe9adec),
                            child: Text(final_response),
                          ),
                        );


                        _textEditingController.clear();
                        icons = Icons.keyboard_voice;
                        print(chat.length);
                      }

                    );
                  },
                ),
              ],

            ),
          ],
      );
  }
}