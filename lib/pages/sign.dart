import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:travel/pages/login.dart';
import 'package:travel/pages/signup.dart';
class  StartPage extends StatefulWidget {
  @override
  _StartState createState() => _StartState();
}

class _StartState extends State<StartPage> {
  navigateToLogin()async{

    Navigator.push(context, MaterialPageRoute(builder: (context)=> Login()));
  }

  navigateToRegister()async{

    Navigator.push(context, MaterialPageRoute(builder: (context)=> SignUp()));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body: Container(
        child: Column(
         children: [
           Padding(
             padding: const EdgeInsets.fromLTRB(30,60,30,20),
             child: Container(

             child:ClipRRect(
                 borderRadius: BorderRadius.circular(30.0),
                 child: Image(image: AssetImage('assets/start.jpg'),
                 )),),

           ),

           RichText( text: TextSpan(
             text:"Welcome to",
             style: TextStyle(
               fontSize: 20,
               fontWeight: FontWeight.bold,
               color: Colors.black,
             ),
               children: [
                 TextSpan(
                   text:"Travel",
                   style: TextStyle(
                     fontSize: 30,
                     fontWeight: FontWeight.bold,
                     color:Theme.of(context).primaryColor,
                   ),
                 )
               ]
           ),
           ),
           Padding(
             padding: const EdgeInsets.fromLTRB(30,30,30,0),
             child: Row(
               children: [
                 SizedBox(
                   width: 150,
                   height: 50,
                   child: RaisedButton(onPressed:navigateToLogin,
                   child: Text('Login',
                   style: TextStyle(
                     fontSize: 20,
                     fontWeight:FontWeight.bold,
                     color: Colors.white,
                   ),),
                     shape: RoundedRectangleBorder(
                       borderRadius: BorderRadius.circular(10),
                     ),
                     color:Theme.of(context).primaryColor,
                   ),
                 ),
                 SizedBox(
                   width: 40,
                 ),
                 SizedBox(
                   width: 150,
                   height: 50,
                   child: RaisedButton(onPressed:navigateToRegister,
                     child: Text('Sign Up',
                       style: TextStyle(
                         fontSize: 20,
                         fontWeight:FontWeight.bold,
                         color: Colors.white,
                       ),),
                     shape: RoundedRectangleBorder(
                       borderRadius: BorderRadius.circular(10),
                     ),
                     color:Theme.of(context).primaryColor,
                   ),
                 )
               ],
             ),
           ),
           SizedBox(
             height: 20,
           ),
           SignInButton(
             Buttons.Google,
             onPressed: () {
               
             },
           ),

],

       ),
    ),
    );
  }
}
