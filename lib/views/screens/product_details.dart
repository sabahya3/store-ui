import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:store_ui/models/product.dart';
import 'package:store_ui/utils/color_palete.dart';
import 'package:store_ui/utils/constants.dart';

class ProductDetails extends StatefulWidget {
  ProductDetails({Key? key, required this.index}) : super(key: key);
  late int index;

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  int trueIndex = 1;
  int sizeIndex = 1;

  @override
  Widget build(BuildContext context) {
    double width = getWidth(context);
    double height = getHeight(context);
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        leading: Padding(
          padding: EdgeInsets.only(left: width * 0.04),
          child: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        centerTitle: true,
        backgroundColor: bgColor,
        elevation: 0,
        title: Text(
          'Product',
          style: getTxtStyle(),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: width * 0.04),
            child: const CircleAvatar(
              backgroundColor: Colors.white,
              child: Icon(
                FontAwesomeIcons.bagShopping,
                color: btnColor,
                size: 22,
              ),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(top: height * 0.05),
              child: ClipPath(
                clipper: CardClipper(),
                child: Container(
                  color: Colors.white,
                  height: height * 0.35,
                  width: width * 0.75,
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Positioned(
                          top: height * 0.03,
                          right: width * 0.04,
                          child: CircleAvatar(
                            radius: 15,
                            backgroundColor: Colors.grey.withOpacity(0.2),
                            child: const Icon(
                              Icons.favorite,
                              color: Colors.red,
                              size: 20,
                            ),
                          )),
                      Center(
                        child: Hero(
                          tag: products[widget.index].img,
                          child: Image.asset(
                            products[widget.index].img,
                            width: width * 0.40,
                            height: height * 19,
                          ),
                        ),
                      ),
                      Positioned(
                          bottom: height * 0.04,
                          right: width * 0.29,
                          child: Row(
                            children: List.generate(
                                3,
                                (index) => Container(
                                      margin: const EdgeInsets.symmetric(
                                          horizontal: 2),
                                      decoration: BoxDecoration(
                                          color: index == 0
                                              ? btnColor
                                              : Colors.grey,
                                          borderRadius:
                                              BorderRadius.circular(25)),
                                      width: index == 0
                                          ? width * 0.06
                                          : width * 0.03,
                                      height: height * 0.01,
                                    )),
                          )),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: height * 0.05, left: width * 0.09),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  products[widget.index].title,
                  style: getTxtStyle(fontSize: 20),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: height * 0.02, left: width * 0.09),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  products[widget.index].desc,
                  style: getTxtStyle(fontSize: 18, color: Colors.grey),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: width * 0.06, vertical: height * 0.04),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(right: width * 0.09),
                        child: Text(
                          'Color',
                          style: getTxtStyle(fontSize: 20),
                        ),
                      ),
                      SizedBox(
                        height: height * 0.01,
                      ),
                      Row(
                        children: List.generate(
                            3,
                            (index) => GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      trueIndex = index;
                                    });
                                  },
                                  child: Container(
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 2),
                                    decoration: BoxDecoration(
                                        color: index == 0
                                            ? btnColor
                                            : index == 1
                                                ? Colors.green
                                                : Colors.blue,
                                        borderRadius:
                                            BorderRadius.circular(25)),
                                    width: width * 0.06,
                                    height: width * 0.06,
                                    child: index == trueIndex
                                        ? const Icon(
                                            Icons.check,
                                            color: Colors.white,
                                            size: 20,
                                          )
                                        : null,
                                  ),
                                )),
                      )
                    ],
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(right: width * 0.09),
                        child: Text(
                          'Size',
                          style: getTxtStyle(fontSize: 20),
                        ),
                      ),
                      SizedBox(
                        height: height * 0.01,
                      ),
                      Row(
                        children: List.generate(
                            3,
                            (index) => GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      sizeIndex = index;
                                    });
                                  },
                                  child: Container(
                                    alignment: Alignment.center,
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 2),
                                    decoration: BoxDecoration(
                                        color: index == sizeIndex
                                            ? btnColor
                                            : Colors.transparent,
                                        borderRadius:
                                            BorderRadius.circular(25)),
                                    width: width * 0.07,
                                    height: width * 0.07,
                                    child: Text(sizes[index],
                                        style: getTxtStyle(
                                            fontSize: 16,
                                            color: index == sizeIndex
                                                ? Colors.white
                                                : Colors.grey)),
                                  ),
                                )),
                      )
                    ],
                  )
                ],
              ),
            ),
            Row(
              children: [
                Padding(
                  padding:
                      EdgeInsets.only(top: height * 0.01, left: width * 0.05),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Review & Ratings',
                      style: getTxtStyle(fontSize: 20),
                    ),
                  ),
                ),
                Padding(
                    padding:
                        EdgeInsets.only(top: height * 0.01, left: width * 0.15),
                    child: Row(
                      children: List.generate(
                          5,
                          (index) => const Icon(
                                Icons.star,
                                color: Colors.yellow,
                              )),
                    )),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        color: Colors.white,
        padding: EdgeInsets.symmetric(
            horizontal: width * 0.06, vertical: height * 0.04),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Price',
                  style: getTxtStyle(fontSize: 16),
                ),
                SizedBox(
                  height: height * 0.01,
                ),
                Text(
                  products[widget.index].price,
                  style: getTxtStyle(fontSize: 16),
                ),
              ],
            ),
            FloatingActionButton.extended(
                backgroundColor: btnColor,
                onPressed: () {},
                icon: const Icon(
                  FontAwesomeIcons.bagShopping,
                  color: Colors.white,
                ),
                label: Text(
                  'Add To Cart',
                  style: getTxtStyle(fontSize: 16, color: Colors.white),
                ))
          ],
        ),
      ),
    );
  }
}

class CardClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double height = size.height;
    double width = size.width;
    Path path = Path();

    path.lineTo(0.0, height * 0.80);
    path.lineTo(width * 0.50, height);
    path.lineTo(width, height * 0.80);
    path.lineTo(width, 0.0);
    path.lineTo(0.0, 0.0);

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
