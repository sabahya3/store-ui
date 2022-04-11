class Product {
  late String title;
  late String img;
  late String price;
  late String desc;

  Product(
      {required this.img,
      required this.price,
      required this.title,
      required this.desc});
}

List<Product> products = [
  Product(
      img: 'assets/images/4.png',
      price: '\$220.00',
      title: 'Hoddie winter',
      desc: 'Uniex Cotton Hoded Hoddels'),
  Product(
      img: 'assets/images/5.png',
      price: '\$124.00',
      title: 'T-shirt winter',
      desc: 'Uniex Cotton Hoded Hoddels'),
  Product(
      img: 'assets/images/1.png',
      price: '\$250.00',
      title: 'Hand watch',
      desc: 'Uniex Cotton Hoded Hoddels'),
  Product(
      img: 'assets/images/2.png',
      price: '\$150.00',
      title: 'pants',
      desc: 'Uniex Cotton Hoded Hoddels'),
  Product(
      img: 'assets/images/3.png',
      price: '\$3000.00',
      title: 'Iphone',
      desc: 'Pretty Awesome Phone'),
];
