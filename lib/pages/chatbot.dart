
import 'package:bubble/bubble.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lemmatizer/lemmatizer.dart';
import 'package:travel/pages/helpline.dart';
import 'package:url_launcher/url_launcher.dart';
//import 'package:speech_to_text/speech_to_text.dart';

enum TtsState { playing, stopped }


class Cb extends StatelessWidget {
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
  List<Widget> chat = [];
  String chatbot(String inp) {
    Lemmatizer lemmatizer = new Lemmatizer();
    List l1 = [
      'hi',
      'Are u a robot?',
      'Can u help me?',
      "how are you ?",
      'what is your name',
      'what is the name of the project'
    ];
    List l2 = ['hello','yes',"yes i can",'better then any other chatbot', 'ASK Chatbot', 'Virtual chat'];

    List l3 = [];
    for (var i = 0; i < l1.length; i++) {
      l3.add(lemmatizer.lemma(l1[i]));
    }

    // for (var i = 0; i < l1.length; i++) {
    //l3.add(lemmatizer.lemma(l2[i]));
    //}
    List disti = [];
    List splt = [];
    List words = [];
    for (var i = 0; i < l3.length; i++) {
      var x = l3[i].split(' ');
      splt.add(x);
      for (var j = 0; j < x.length; j++) {
        words.add(x[j]);
        var check = 0;
        for (var k = 0; k < disti.length; k++) {
          if (disti[k] == x[j]) {
            check = 1;
            break;
          }
        }
        if (check == 0) {
          disti.add(x[j]);
        }
      }
    }
    List prob = [];
    inp = lemmatizer.lemma(inp);
    List x = inp.split(' ');
    for (var j = 0; j < l3.length; j++) {
      var p = 1.0;
      for (var i = 0; i < x.length; i++) {
        var count = 0;
        int count1 = 0;
        for (var k = 0; k < words.length; k++) {
          if (words[k] == x[i]) {
            count++;
          }
        }
        for (var k = 0; k < splt[j].length; k++) {
          if (splt[j][k] == x[i]) {
            count1++;
          }
        }
        var f1 = (count1 + 1) / (disti.length + count);
        p = p * f1;
      }
      p = p * 1 / 3;
      prob.add(p);
    }

    var largest_value =
    prob.reduce((current, next) => current > next ? current : next);
    print(prob);
    print(largest_value);
    print(l2[prob.indexOf(largest_value)]);
    return l2[prob.indexOf(largest_value)];
  }

  IconData icons = Icons.keyboard_voice;
  //final SpeechToText speech = SpeechToText();
  var statusListener;
  var lastWords;
  var lastError;
//  gg() async {
//    bool available = await speech.initialize(
//        onStatus: statusListener, onError: errorListener);
//    if (available) {
//      speech.listen(onResult: resultListener,partialResults: false);
//    } else {
//      print("The user has denied the use of speech recognition.");
//    }
//
//    // some time later...
//    speech.stop();
//    return true;
//  }

  void errorListener(error) {
    setState(() {
      lastError = "${error.errorMsg} - ${error.permanent}";
    });
  }

  void resultListener(result) {
    setState(() {
      lastWords = "${result.recognizedWords}  ";
    });

    print(lastWords);
    gg2();
  }

  void gg2() {
    setState(() {
      if (lastWords != '') {
        chat.add(Bubble(
          nip: BubbleNip.rightTop,
          alignment: Alignment.centerRight,
          margin: BubbleEdges.all(5),
          color: Color(0xFFB266B2),
          child: Text(lastWords),
        ));
        var opt = chatbot(lastWords);

        chat.add(
          Bubble(
            nip: BubbleNip.leftTop,
            alignment: Alignment.centerLeft,
            margin: BubbleEdges.all(5),
            color: Color(0xFF812281),
            child: Text(opt),
          ),
        );
        lastWords=''; } });
  }

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

          Column(
            children: [



              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    FlatButton(
                      // disabledColor: Colors.greenAccent,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                            side: BorderSide(color:Color(0xFF812281))
                        ),
                        textTheme: ButtonTextTheme.accent,
                        onPressed: () {
                          setState(() {


                            if (_textEditingController.text == '') {
                              chat.add( Bubble(
                                nip: BubbleNip.rightTop,
                                alignment: Alignment.centerRight,
                                margin: BubbleEdges.all(5),
                                color:Color(0xFFB266B2),
                                child: Text('Helpline'),

                              ),);
                              var opt = chatbot('Helpline');

                              chat.add(
                                Bubble(
                                  nip: BubbleNip.leftTop,
                                  alignment: Alignment.centerLeft,
                                  margin: BubbleEdges.all(5),
                                  color:Color(0xFFe9adec),
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.push(context, MaterialPageRoute(builder: (context)=> Hp()));
                                    },
                                    child: Text("Click me for helpline numbers"),
                                  ),
                                ),
                              );
                            }});},
                        child: Text('Helpline',
                          style:TextStyle(color: Color(0xFF812281)),)
                    ),
                    SizedBox(width: 5,),
                    FlatButton(
                      // disabledColor: Colors.greenAccent,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                            side: BorderSide(color:Color(0xFF812281))
                        ),
                        textTheme: ButtonTextTheme.accent,
                        onPressed: () {
                          setState(() {


                            if (_textEditingController.text == '') {
                              chat.add( Bubble(
                                nip: BubbleNip.rightTop,
                                alignment: Alignment.centerRight,
                                margin: BubbleEdges.all(5),
                                color:Color(0xFFB266B2),
                                child: Text('Groceries'),

                              ),);
                              var opt = chatbot('Groceries');

                              chat.add(
                                Bubble(
                                  nip: BubbleNip.leftTop,
                                  alignment: Alignment.centerLeft,
                                  margin: BubbleEdges.all(5),
                                  color:Color(0xFFe9adec),
                                  child: GestureDetector(
                                    onTap: () {
                                      launch('https://www.google.com/maps/search/Groceries/');
                                    },
                                    child: Text("Click me for groceries near you"),
                                  ),
                                ),
                              );
                            }});},
                        child: Text('Groceries',
                        style:TextStyle(color: Color(0xFF812281)),)
                    ),
                    SizedBox(width: 5,),
                    FlatButton(
                      // disabledColor: Colors.greenAccent,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                            side: BorderSide(color:Color(0xFF812281))
                        ),
                        textTheme: ButtonTextTheme.accent,
                        onPressed: () {
                          setState(() {


                            if (_textEditingController.text == '') {
                              chat.add( Bubble(
                                nip: BubbleNip.rightTop,
                                alignment: Alignment.centerRight,
                                margin: BubbleEdges.all(5),
                                color:Color(0xFFB266B2),
                                child: Text('Restaurants'),

                              ),);
                              var opt = chatbot('Restaurants');

                              chat.add(
                                Bubble(
                                  nip: BubbleNip.leftTop,
                                  alignment: Alignment.centerLeft,
                                  margin: BubbleEdges.all(5),
                                  color:Color(0xFFe9adec),
                                  child: GestureDetector(
                                    onTap: () {
                                      launch('https://www.google.com/maps/search/Restaurants/');
                                    },
                                    child: Text("Click me for restaurants near you"),
                                  ),
                                ),
                              );
                            }});},
                        child: Text('Restaurants',
                          style:TextStyle(color: Color(0xFF812281)),)
                    ),
                    SizedBox(width: 5,),
                    FlatButton(
                      // disabledColor: Colors.greenAccent,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                            side: BorderSide(color:Color(0xFF812281))
                        ),
                        textTheme: ButtonTextTheme.accent,
                        onPressed: () {
                          setState(() {


                            if (_textEditingController.text == '') {
                              chat.add( Bubble(
                                nip: BubbleNip.rightTop,
                                alignment: Alignment.centerRight,
                                margin: BubbleEdges.all(5),
                                color:Color(0xFFB266B2),
                                child: Text('Hospitals'),

                              ),);
                              var opt = chatbot('Hospitals');

                              chat.add(
                                Bubble(
                                  nip: BubbleNip.leftTop,
                                  alignment: Alignment.centerLeft,
                                  margin: BubbleEdges.all(5),
                                  color:Color(0xFFe9adec),
                                  child: GestureDetector(
                                    onTap: () {
                                      launch('https://www.google.com/maps/search/Hospitals/');
                                    },
                                    child: Text("Click me for hospitals near you"),
                                  ),
                                ),
                              );
                            }});},
                        child: Text('Hospitals',
                          style:TextStyle(color: Color(0xFF812281)),)
                    ),
                    SizedBox(width: 5,),
                    FlatButton(
                      // disabledColor: Colors.greenAccent,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                            side: BorderSide(color:Color(0xFF812281))
                        ),
                        textTheme: ButtonTextTheme.accent,
                        onPressed: () {
                          setState(() {


                            if (_textEditingController.text == '') {
                              chat.add( Bubble(
                                nip: BubbleNip.rightTop,
                                alignment: Alignment.centerRight,
                                margin: BubbleEdges.all(5),
                                color:Color(0xFFB266B2),
                                child: Text('Attractions'),

                              ),);
                              var opt = chatbot('Attractions');

                              chat.add(
                                Bubble(
                                  nip: BubbleNip.leftTop,
                                  alignment: Alignment.centerLeft,
                                  margin: BubbleEdges.all(5),
                                  color:Color(0xFFe9adec),
                                  child: GestureDetector(
                                    onTap: () {
                                      launch('https://www.google.com/maps/search/tourist+attractions/');
                                    },
                                    child: Text("Click me for attractions near you"),
                                  ),
                                ),
                              );
                            }});},
                        child: Text('Attractions',
                          style:TextStyle(color: Color(0xFF812281)),)
                    ),
                    SizedBox(width: 5,),
                    FlatButton(
                      // disabledColor: Colors.greenAccent,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                            side: BorderSide(color:Color(0xFF812281))
                        ),
                        textTheme: ButtonTextTheme.accent,
                        onPressed: () {
                          setState(() {


                            if (_textEditingController.text == '') {
                              chat.add( Bubble(
                                nip: BubbleNip.rightTop,
                                alignment: Alignment.centerRight,
                                margin: BubbleEdges.all(5),
                                color:Color(0xFFB266B2),
                                child: Text('Hotels'),

                              ),);
                              var opt = chatbot('Hotels');

                              chat.add(
                                Bubble(
                                  nip: BubbleNip.leftTop,
                                  alignment: Alignment.centerLeft,
                                  margin: BubbleEdges.all(5),
                                  color:Color(0xFFe9adec),
                                  child: GestureDetector(
                                    onTap: () {
                                      launch('https://www.google.com/maps/search/Hotels/');
                                    },
                                    child: Text("Click me for hotels near you"),
                                  ),
                                ),
                              );
                            }});},
                        child: Text('Hotels',
                          style:TextStyle(color: Color(0xFF812281)),)
                    ),
                    SizedBox(width: 5,),
                    FlatButton(
                      // disabledColor: Colors.greenAccent,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                            side: BorderSide(color:Color(0xFF812281))
                        ),
                        textTheme: ButtonTextTheme.accent,
                        onPressed: () {
                          setState(() {


                            if (_textEditingController.text == '') {
                              chat.add( Bubble(
                                nip: BubbleNip.rightTop,
                                alignment: Alignment.centerRight,
                                margin: BubbleEdges.all(5),
                                color:Color(0xFFB266B2),
                                child: Text('Pharmacies'),

                              ),);
                              var opt = chatbot('Pharmacies');

                              chat.add(
                                Bubble(
                                  nip: BubbleNip.leftTop,
                                  alignment: Alignment.centerLeft,
                                  margin: BubbleEdges.all(5),
                                  color:Color(0xFFe9adec),
                                  child: GestureDetector(
                                    onTap: () {
                                      launch('https://www.google.com/maps/search/Pharmacies/');
                                    },
                                    child: Text("Click me for pharmacies near you"),
                                  ),
                                ),
                              );
                            }});},
                        child: Text('Pharmacies',
                          style:TextStyle(color: Color(0xFF812281)),)
                    ),

                  ],
                ),
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
                    onPressed: () {
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
                          );
                          //print(chatbot('how are you'));
                          //print(_textEditingController.text);
                          var opt = chatbot(_textEditingController.text);

                          chat.add(
                            Bubble(
                              nip: BubbleNip.leftTop,
                              alignment: Alignment.centerLeft,
                              margin: BubbleEdges.all(5),
                              color:Color(0xFFe9adec),
                              child: Text(opt),
                            ),
                          );
                          _textEditingController.clear();
                          icons = Icons.keyboard_voice;
                          print(chat.length);
                        } else {
                          //stt.SpeechToText speech = stt.SpeechToText();

//                    gg();

                          print('ggggggggggggggggggggggggggggggg');
                        }
                      });
                    },
                  ),
                ],

              ),
            ],
          ),
        ]);
  }
}
