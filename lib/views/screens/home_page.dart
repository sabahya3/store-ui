import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:store_ui/models/navbar_model.dart';
import 'package:store_ui/models/product.dart';
import 'package:store_ui/models/text_and_icon.dart';
import 'package:store_ui/utils/color_palete.dart';
import 'package:store_ui/utils/constants.dart';
import 'package:store_ui/views/screens/product_details.dart';
import 'package:store_ui/views/widgets/custom_app_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int current = 0;
  @override
  Widget build(BuildContext context) {
    double width = getWidth(context);
    double height = getHeight(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: bgColor,
      appBar: CustomAppBar(height: height, width: width),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Container(
          color: bgColor,
          width: width,
          height: height,
          padding: EdgeInsets.only(top: height * 0.02),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'What are you looking for today!',
                style: getTxtStyle(),
              ),
              Padding(
                padding: EdgeInsets.only(top: height * 0.03),
                child: SizedBox(
                  height: height * 0.10,
                  width: width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: height * 0.06,
                        width: width * 0.67,
                        child: TextField(
                          decoration: InputDecoration(
                              contentPadding: const EdgeInsets.all(10),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide: BorderSide.none),
                              fillColor: Colors.white,
                              filled: true,
                              hintText: 'Search for product',
                              prefixIcon: const Icon(
                                Icons.search,
                                color: Colors.black,
                              )),
                        ),
                      ),
                      SizedBox(
                        width: width * 0.03,
                      ),
                      Container(
                        width: width * 0.12,
                        height: height * 0.06,
                        child: const Icon(
                          FontAwesomeIcons.sliders,
                          size: 22,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding:
                    EdgeInsets.only(top: height * 0.03, left: width * 0.09),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Explore Categories',
                    style: getTxtStyle(fontSize: 20),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: height * 0.03),
                child: Align(
                    alignment: Alignment.centerLeft,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                          4,
                          (index) => Container(
                                margin: EdgeInsets.symmetric(
                                    horizontal: width * 0.03),
                                width: width * 0.15,
                                height: height * 0.08,
                                padding: const EdgeInsets.only(
                                  top: 10,
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      child: Icon(
                                        icons[index].icon,
                                        color: btnColor,
                                        size: 25,
                                      ),
                                    ),
                                    SizedBox(
                                      height: height * 0.01,
                                    ),
                                    Expanded(
                                      child: Text(
                                        icons[index].label,
                                        style: getTxtStyle(fontSize: 12),
                                      ),
                                    )
                                  ],
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              )),
                    )),
              ),
              Padding(
                padding:
                    EdgeInsets.only(top: height * 0.03, left: width * 0.09),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'New Arrival',
                    style: getTxtStyle(fontSize: 20),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: height * 0.03),
                child: SizedBox(
                  height: height * 0.35,
                  width: width,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(PageRouteBuilder(
                            transitionDuration:const Duration(milliseconds: 600),
                            pageBuilder:
                                (context, animation, secondaryAnimation) {
                              return FadeTransition(
                                
                                opacity: animation,
                                child: ProductDetails(
                                  index: index,
                                ),
                              );
                            },
                          ));
                        },
                        child: TweenAnimationBuilder(
                          tween: Tween<double>(begin: 2, end: 0.0),
                          duration: const Duration(milliseconds: 500),
                          builder: (context, double value, child) {
                            return Transform(
                              alignment: Alignment.center,
                              transform: Matrix4.identity()
                                ..setEntry(3, 2, 0.001)
                                ..rotateY(value),
                              child: child,
                            );
                          },
                          child: Column(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                child: SizedBox(
                                  height: height * 0.22,
                                  width: width * 0.45,
                                  child: Material(
                                    elevation: 10,
                                    child: Stack(
                                      clipBehavior: Clip.none,
                                      children: [
                                        Positioned(
                                            top: 10,
                                            right: 5,
                                            child: CircleAvatar(
                                              radius: 15,
                                              backgroundColor:
                                                  Colors.grey.withOpacity(0.2),
                                              child: const Icon(
                                                Icons.favorite,
                                                color: Colors.red,
                                                size: 20,
                                              ),
                                            )),
                                        Positioned(
                                            bottom: -height * 0.03,
                                            right: width * 0.19,
                                            child: CircleAvatar(
                                              radius: width * 0.05,
                                              backgroundColor: Colors.red,
                                              child: const Icon(
                                                FontAwesomeIcons.bagShopping,
                                                color: Colors.white,
                                                size: 20,
                                              ),
                                            )),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Hero(
                                            tag: products[index].img ,
                                            child: Image.asset(
                                              products[index].img,
                                              width: width * 0.40,
                                              height: height * 19,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                  top: height * 0.04,
                                ),
                                child: Text(
                                  products[index].title,
                                  style: getTxtStyle(
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                              Padding(
                                  padding: EdgeInsets.only(
                                    top: height * 0.01,
                                  ),
                                  child: Text(
                                    products[index].price,
                                    style: getTxtStyle(
                                      fontSize: 17,
                                    ),
                                  ))
                            ],
                          ),
                        ),
                      );
                    },
                    itemCount: 5,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: ClipPath(
        clipper: CustomBorder(),
        child: Container(
          padding: EdgeInsets.only(top: height * 0.03),
          height: height * 0.10,
          color: Colors.white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              4,
              (index) => GestureDetector(
                onTap: () {
                  setState(() {
                    current = index;
                  });
                },
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: width * 0.09),
                  width: width * 0.06,
                  height: height * 0.06,
                  child: Icon(
                    navIcons[index].icon,
                    size: index == 0 ? 30 : 22,
                    color: index == current ? btnColor : Colors.black,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: Transform.translate(
        offset: Offset(0.0, height * 0.03),
        child: FloatingActionButton(
          backgroundColor: btnColor,
          onPressed: () {},
          child: const Icon(
            FontAwesomeIcons.bagShopping,
            color: Colors.white,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

class CustomBorder extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double height = size.height;
    double width = size.width;
    var path = Path();

    path.moveTo(0.0, height);
    path.lineTo(0.0, height / 3);
    path.quadraticBezierTo(width / 2, 0.0, width, height / 3);

    path.lineTo(width, height);

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
