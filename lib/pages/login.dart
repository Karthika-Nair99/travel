

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import  'package:travel/pages/home_screen.dart';
import 'signup.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final FirebaseAuth _auth= FirebaseAuth.instance;
  final GlobalKey<FormState> _formKey =GlobalKey<FormState>();

  String _email, _password;

  checkAuthentification() async {
    _auth.onAuthStateChanged.listen((user) {
      if (user != null) {
        Navigator.push(context, MaterialPageRoute(
            builder: (context) => HomeScreen()));
      }
    });


    @override
    void initState() {
      super.initState();
      this.checkAuthentification();
    }
  }

  login()async
  {
    if(_formKey.currentState.validate())
    {

      _formKey.currentState.save();

      try{
        FirebaseUser user =(await _auth.signInWithEmailAndPassword(email: _email, password: _password)).user;
      }on Exception catch (e) {

         showDialog(
             context: context,
             builder: (BuildContext context) {
               return AlertDialog(
              title: new Text(e.toString()),
              actions: <Widget>[
                FlatButton(
                  child: new Text("OK"),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );});

      }

    }
  }



  navigateToSignUp()async
  {

    Navigator.push(context, MaterialPageRoute(builder: (context)=> SignUp()));

  }

  
  Widget build(BuildContext context) {
    return Scaffold(
       body: SingleChildScrollView(
         child: Container(
           child: Column(
             children: [
               Padding(
                 padding: const EdgeInsets.fromLTRB(30,60,30,20),
                 child: Container(

                   child:ClipRRect(
                       borderRadius: BorderRadius.circular(30.0),
                       child: Image(image: AssetImage('assets/login.jpg'),
                         fit: BoxFit.contain,
                       )),),
               ),
               Container(
                    child: Form(
                      key: _formKey,

                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(20,0,20,0),
                        child: Column(
                          children: [
                            Container(
                              child: TextFormField(
                                // ignore: missing_return
                                validator: (input)
                                {
                                  if(input.isEmpty)
                                    return 'Enter Email';
                                  },
                                decoration:InputDecoration(
                                labelText:'Email',
                                prefixIcon:Icon(Icons.email)
                                ),
                                  onSaved:(input)=>_email= input

                              ),
                            ),
                            Container(
                                child: TextFormField(
                                    // ignore: missing_return
                                    validator: (input)
                                    {
                                      if(input.length <6)
                                        return 'Minimum 6 character';
                                      },
                                      decoration:InputDecoration(
                                          labelText:'Password',
                                          prefixIcon:Icon(Icons.lock)
                                      ),
                                      obscureText:true,
                                      onSaved:(input)=>_password= input,

                                ),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            RaisedButton(
                              padding: EdgeInsets.fromLTRB(70, 10, 70, 10),
                              onPressed:login,
                            child: Text('LOGIN',style: TextStyle(
                                color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),),
                            color: Theme.of(context).primaryColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0)
                            ),)
                          ],
                        ),
                      ),
                    ),
               )
             ],
           ),
         ),
       ),
    );
  }

}
