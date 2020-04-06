import 'package:chess_shop/data/data.dart';
import 'package:chess_shop/model/explore_model.dart';
import 'package:chess_shop/model/item_model.dart';
import 'package:chess_shop/views/details.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<exploreModel> exploredata = new List();
  List<itemModel> itemdata = new List();
  @override
  void initState() {
    exploredata = getExploreData();
    itemdata = getItemData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            resizeToAvoidBottomPadding: false,
            body: SafeArea(
              child: Column(
                children: <Widget>[
                  Stack(
                    children: <Widget>[
                      ClipPath(
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: 360,
                          color: Color(0xff009688),
                        ),
                        clipper: CustomClipPath(),
                      ),
                      Column(
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.only(top: 25),
                                child: Text(
                                  "Our Product",
                                  style: TextStyle(
                                      fontSize: 22, color: Colors.white),
                                ),
                              ),
                            ],
                          ),
                          Container(
                            height: 250,
                            child: ListView.builder(
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                itemCount: exploredata.length,
                                itemBuilder: (context, index) {
                                  return exploreTile(
                                    productName: exploredata[index].productName,
                                    price: exploredata[index].price,
                                    size: exploredata[index].size,
                                    color: exploredata[index].color,
                                    imgURL: exploredata[index].imgURL,
                                  );
                                }),
                          ),
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(40, 260, 40, 0),
                        width: MediaQuery.of(context).size.width,
                        child: Row(
                          children: <Widget>[
                            CircleAvatar(
                              backgroundColor: Color(0xff03746A),
                              radius: 25,
                              child: Icon(
                                Icons.arrow_back,
                                color: Colors.white,
                                size: 30,
                              ),
                            ),
                            Spacer(),
                            CircleAvatar(
                              backgroundColor: Color(0xff03746A),
                              radius: 25,
                              child: Icon(
                                Icons.arrow_forward,
                                color: Colors.white,
                                size: 30,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 8),
                    child: Text(
                      "Explore More",
                      style: TextStyle(fontSize: 25),
                    ),
                  ),
                  Container(
                    width: 280,
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                        color: Color(0xffD6E0DF),
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(22),
                            bottomRight: Radius.circular(22),
                            topLeft: Radius.circular(22),
                            topRight: Radius.circular(22))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          width: 200,
                          child: TextField(
                            decoration: InputDecoration(
                                hintStyle: TextStyle(color: Color(0xff009688)),
                                hintText: "Search",
                                border: InputBorder.none),
                          ),
                        ),
                        Spacer(),
                        InkWell(
                            onTap: () {
                              print("you clicked search icon");
                            },
                            child: Icon(
                              Icons.search,
                              color: Color(0xff009688),
                            ))
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.only(left: 25),
                      height: 200,
                      width: MediaQuery.of(context).size.width,
                      child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: itemdata.length,
                          itemBuilder: (context, index) {
                            return items(
                              price: itemdata[index].price,
                              productName: itemdata[index].productName,
                              imgURL: itemdata[index].imgURL,
                            );
                          }),
                    ),
                  )
                ],
              ),
            ),
            bottomNavigationBar: Container(
              padding: EdgeInsets.symmetric(horizontal: 15),
              color: Color(0xff009688),
              height: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Details()));
                      },
                      child: Icon(Icons.favorite_border, size: 40)),
                  Icon(Icons.shopping_cart, size: 40),
                  Icon(Icons.home, size: 40),
                  Icon(Icons.zoom_out_map, size: 40),
//                  ClipRRect(
//                      borderRadius: BorderRadius.circular(30.0),
//                      child: Image.asset(
//                        "images/profile.png",
//                        fit: BoxFit.fill,
//                      )),
                  CircleAvatar(
                    radius: 22,
                    backgroundImage: AssetImage("images/profile.png"),
                  )
                ],
              ),
            )));
  }
}

class CustomClipPath extends CustomClipper<Path> {
  var radius = 10.0;
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height - 100);
    path.quadraticBezierTo(
        size.width / 2, size.height, size.width, size.height - 100);
    path.lineTo(size.width, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class exploreTile extends StatelessWidget {
  final String productName;
  final String price;
  final String size;
  final String color;
  final String imgURL;

  exploreTile(
      {this.productName, this.price, this.size, this.color, this.imgURL});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(2),
      margin: EdgeInsets.symmetric(vertical: 2, horizontal: 20),
      height: 240,
      width: 350,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                productName,
                style: TextStyle(color: Colors.white, fontSize: 15),
              ),
            ],
          ),
          SizedBox(
            height: 8,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text(
                "Price:",
                style: TextStyle(fontSize: 12, color: Colors.white),
              ),
              Text(price, style: TextStyle(fontSize: 12, color: Colors.white)),
              Text("|"),
              Text("Size:",
                  style: TextStyle(fontSize: 12, color: Colors.white)),
              Text(size, style: TextStyle(fontSize: 12, color: Colors.white)),
              Text("|"),
              Text("Color:",
                  style: TextStyle(fontSize: 12, color: Colors.white)),
              Text(color, style: TextStyle(fontSize: 12, color: Colors.white)),
            ],
          ),
          SizedBox(
            height: 8,
          ),
          Image.asset(
            imgURL,
            fit: BoxFit.fill,
            height: 160,
            width: 150,
          ),
        ],
      ),
    );
  }
}

class items extends StatelessWidget {
  final String price;
  final String productName;
  final String imgURL;

  items({this.price, this.productName, this.imgURL});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: 55, right: 15),
                height: 150,
                width: 150,
                decoration: BoxDecoration(
                    color: Color(0xff037E73),
                    borderRadius: BorderRadius.circular(5)),
              ),
              Container(
                margin: EdgeInsets.only(left: 15),
                child: Column(
                  children: <Widget>[
                    Image.asset(
                      imgURL,
                      height: 150,
                      width: 120,
                      fit: BoxFit.fill,
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Text(
                      productName,
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 2,
                    ),
                    Text(
                      price,
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
