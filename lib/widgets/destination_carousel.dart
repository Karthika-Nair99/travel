import'package:flutter/material.dart';
import 'package:travel/models/destination_model.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:travel/pages/destination_screen.dart';
import 'package:travel/pages/all_destination.dart';
class DestinationCarousel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children:<Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                'Top Destination',
                style: TextStyle(
                  fontSize: 22.0,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.5,
                ),
              ),
              GestureDetector(
                onTap: ()=>Navigator.push(
    context,
    MaterialPageRoute(
    builder: (_) => AllDestination(),
    ),
    ),
                child: Text(
                  'See All',
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.0,
                  ),),
              ),

            ],
          ),
        ),
        Container(
          height: 300.0,

          child: ListView.builder(
            scrollDirection: Axis.horizontal,
              itemCount: destinations.length,
              itemBuilder: (BuildContext context,int index){
                Destination destination = destinations[index];
                return GestureDetector(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => DestinationScreen(
                        destination: destination,
                      ),
                    ),
                  ),
                  child: Container(
                    margin: EdgeInsets.all(10.0),
                    width: 210.0,

                    child: Stack(
                      alignment: Alignment.topCenter,
                      children: <Widget>[
                        Positioned(
                          bottom:15.0,
                          child: Container(
                              height: 85.0,
                              width: 200.0,
                              decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10.0),
                              ),
                            child: SingleChildScrollView(
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children:<Widget>[
                                    Text('${destination.activities.length} activities',
                                    style: TextStyle(
                                      fontSize: 22.0,
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 1.2,
                                    ),),
                                    Text(
                                      destination.description,
                                    style: TextStyle(
                                      color: Colors.black,
                                    ),),
                                  ]
                              ),
                            ),

                    ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20.0),
                            boxShadow: [
                              BoxShadow(
                              color:Colors.black26,
                                offset: Offset(0.0,2.0),
                                blurRadius: 6.0,
                              )
                            ]
                          ),
                          child: Stack(
                            children:<Widget> [

                              Hero(
                                tag:destination.imageUrl,
                                child: ClipRRect(
                                  borderRadius:BorderRadius.circular(20.0),
                                  child: Image(
                                    height:180.0,
                                    width:200.0,
                                    image: AssetImage(destination.imageUrl),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 10.0,
                                bottom: 10.0,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children:<Widget> [
                                    Text(destination.city,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w700,
                                      fontSize: 24.0,
                                    ),),
                                    Row(
                                      children:<Widget> [
                                        Icon(
                                          FontAwesomeIcons.locationArrow,
                                          size: 15.0,
                                          color: Colors.white),
                                        Text(destination.country,
                                        style:TextStyle(
                                          fontWeight: FontWeight.w700,
                                          color:Color(0xFFFFF4F6),)),
                                      ],
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },),
        )
      ],
    );
  }
}
