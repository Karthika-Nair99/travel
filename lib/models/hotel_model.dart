class Hotel {
  String imageUrl;
  String name;
  String address;
  int price;

  Hotel({
    this.imageUrl,
    this.name,
    this.address,
    this.price,
  });
}

final List<Hotel> hotels = [
  Hotel(
    imageUrl: 'assets/mumbaih.jpg',
    name: 'Oberoi',
    address: '404 Great St',
    price: 9000
  ),
  Hotel(
    imageUrl: 'assets/jaipurh.jpg',
    name: 'Rajmahal Palace',
    address: '404 Great St',
    price: 7000,
  ),
  Hotel(
    imageUrl: 'assets/chennaih.jpg',
    name: 'Hotel Leela Palace',
    address: '404 Great St',
    price: 6850,
  ),
];