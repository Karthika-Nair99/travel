import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:travel/pages/all_destination.dart';
import 'package:travel/pages/signup.dart';
import 'package:travel/widgets/destination_carousel.dart';
import 'package:travel/widgets/hotel_carousel.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:travel/pages/sign.dart';
import 'chatbot.dart';
class HomeScreen extends StatefulWidget{
  @override
  _HomeScreenState createState() => _HomeScreenState();

}

class _HomeScreenState extends State<HomeScreen>{
  int _selectedIndex=0;
  int _currentTab=0;
  List<IconData> _icon=[
    FontAwesomeIcons.plane,
    FontAwesomeIcons.bed,
    FontAwesomeIcons.walking,
    FontAwesomeIcons.biking,
  ];

  final FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseUser user;
  bool isloggedin= false;


  checkAuthentification() async{

    _auth.onAuthStateChanged.listen((user) {

      if(user ==null)
      {
        Navigator.push(context, MaterialPageRoute(builder: (context)=> StartPage()));
      }
    });
  }

  getUser() async{

    FirebaseUser firebaseUser = await _auth.currentUser;
    await firebaseUser?.reload();
    firebaseUser = await _auth.currentUser;

    if(firebaseUser !=null)
    {
      setState(() {
        this.user =firebaseUser;
        this.isloggedin=true;
      });
    }
  }

  signOut()async{

    _auth.signOut();
  }

  @override
  void initState(){

    this.checkAuthentification();
    this.getUser();
  }

  @override
  Widget _buildIcon(int index){
    return

         GestureDetector(
        onTap: (){
          setState(() {
            _selectedIndex = index;

          });
          if (_selectedIndex==3){
            Navigator.push(context, MaterialPageRoute(builder: (context)=> Cb()));
          }
        },

      child:Container(
        height: 60.0,
        width: 60.0,
        decoration: BoxDecoration(
          color:_selectedIndex == index? Theme.of(context).accentColor:Color(0xFFe9adec),
          borderRadius: BorderRadius.circular(30.0),
        ),
        child: Icon(
      _icon[index],
      size:25.0,
      color: _selectedIndex == index?Theme.of(context).primaryColor:Color(0xFF812281)),
      ),
    );
  }
  @override
  Widget build(BuildContext context){
    return Scaffold(

      body: SafeArea(

        child: ListView(
          padding: EdgeInsets.symmetric(vertical: 30.0),
          children: <Widget>[
            Padding(
                padding: const EdgeInsets.only(left: 50.0, right:20.0),
                child:Text('What would you like to find?',
                    style:TextStyle(
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold,
                    ))
            ),
            SizedBox(height: 20.0),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: _icon.asMap().entries.map(
                      (MapEntry map) => _buildIcon(map.key),).toList(),
            ),
            SizedBox(height: 20.0),
             DestinationCarousel(),
            SizedBox(height: 20.0),
            HotelCarousel(),
            RaisedButton(

              padding: EdgeInsets.fromLTRB(70,10,70,10),
              onPressed: signOut,
              child: Text('Signout',style: TextStyle(

                  color: Colors.white,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold

              )),

              color: Colors.orange,
              shape: RoundedRectangleBorder(

                borderRadius: BorderRadius.circular(20.0),
              ),
            )
          ],


        ),),
    bottomNavigationBar: BottomNavigationBar(
      currentIndex: _currentTab,
        onTap: (int value) {
          setState(() {
            _currentTab = value;
          });
        },
      items:[BottomNavigationBarItem(icon: Icon(
       Icons.search,
        size:30.0,
      ),
      title: SizedBox.shrink(),),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.local_pizza,
            size: 30.0,
          ),
          title: SizedBox.shrink(),
        ),
        BottomNavigationBarItem(
          icon: CircleAvatar(
            radius: 15.0,
            backgroundImage: NetworkImage('http://i.imgur.com/zL4Krbz.jpg'),
          ),
          title: SizedBox.shrink(),
        )]
    ),);

  }
}