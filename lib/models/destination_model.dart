import 'package:travel/models/activity_model.dart';

class Destination {
  String imageUrl;
  String city;
  String country;
  String description;
  List<Activity> activities;

  Destination({
    this.imageUrl,
    this.city,
    this.country,
    this.description,
    this.activities,
  });
}
List<Activity> activities = [
  Activity(
    imageUrl: 'assets/jantar-mantar.jpg',
    name: 'Jantar Mantar Jaipur',
    type: 'Museum',
    startTimes: ['6:00 am', '6:00 pm'],
    rating: 5,
    price: 200,
  ),
  Activity(
    imageUrl: 'assets/Hawa-Mahal.jpg',
    name: 'Hawa Mahal - Palace of Wind',
    type: 'Sightseeing Tour',
    startTimes: ['9:00 am', '4:30 pm'],
    rating: 4,
    price: 50,
  ),
  Activity(
    imageUrl: 'assets/Naharagarh-Fort-2.jpg',
    name: 'Nahargarh Fort',
    type: 'Sightseeing Tour',
    startTimes: ['10:00 am', '5:30 pm'],
    rating: 3,
    price: 200,
  ),
];

List<Destination> destinations = [
  Destination(
    imageUrl: 'assets/mumbai.jpg',
    city: 'Mumbai',
    country: 'India',
    description: 'Visit Mumbai for an amazing and unforgettable experience.',
    activities: activities,
  ),
  Destination(
    imageUrl: 'assets/jaipur.jpg',
    city: 'Jaipur',
    country: 'India',
    description: 'Visit Jaipur for an amazing and unforgettable experience.',
    activities: activities,
  ),
  Destination(
    imageUrl: 'assets/delhi.jpg',
    city: 'New Delhi',
    country: 'India',
    description: 'Visit New Delhi for an amazing and unforgettable experience.',
    activities: activities,
  ),
  Destination(
    imageUrl: 'assets/chennai.jpg',
    city: 'Chennai',
    country: 'India',
    description: 'Visit Chennai for an amazing and unforgettable experience.',
    activities: activities,
  ),
  Destination(
    imageUrl: 'assets/bangalore.jpg',
    city: 'Bangalore',
    country: 'India',
    description: 'Visit Bangalore for an amazing and unforgettable experience.',
    activities: activities,
  ),
];