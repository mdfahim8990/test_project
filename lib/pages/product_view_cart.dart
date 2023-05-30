import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductViewPage extends StatefulWidget {
  const ProductViewPage({Key? key}) : super(key: key);

  @override
  State<ProductViewPage> createState() => _ProductViewPageState();
}

int productQty = 01;
bool wantBuy = false;

class _ProductViewPageState extends State<ProductViewPage> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: AppBar(
          title: const Text("Product Cart"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(
                //height: height / 2.5,
                width: width / 2,
                child: Card(
                  elevation: 15,
                  shadowColor: Colors.grey,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Column(
                      // mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Stack(
                          children: [
                            SizedBox(
                              height: height / 6,
                              width: width,
                              child: const ClipRRect(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    topRight: Radius.circular(10)),
                                child: Image(
                                  image: AssetImage('assets/product/prod.jpg'),
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                            Positioned(
                              bottom: 5,
                              left: -5,
                              child: wantBuy
                                  ? Padding(
                                      padding:
                                          const EdgeInsets.only(left: 20.0),
                                      child: Row(
                                        children: [
                                          SizedBox(
                                            width: 30,
                                            child: ElevatedButton(
                                              onPressed: () {
                                                setState(() {
                                                  productQty--;
                                                  if (productQty == 0) {
                                                    wantBuy = false;
                                                  }
                                                });
                                              },
                                              style: ElevatedButton.styleFrom(
                                                padding: EdgeInsets.zero,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.only(
                                                      topLeft:
                                                          Radius.circular(8),
                                                      bottomLeft:
                                                          Radius.circular(
                                                              8)), // <-- Radius
                                                ),
                                                backgroundColor: Colors.black87,
                                                foregroundColor: Colors.white,
                                              ),
                                              child: Icon(Icons.remove,
                                                  color: Colors.white),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 35.0, right: 35.0),
                                            child: Text(
                                              "$productQty",
                                              style: TextStyle(
                                                  color: Colors.green,
                                                  fontSize: 16),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 30,
                                            child: ElevatedButton(
                                              onPressed: () {
                                                setState(() {
                                                  productQty++;
                                                });
                                              },
                                              style: ElevatedButton.styleFrom(
                                                padding: EdgeInsets.zero,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.only(
                                                      topRight:
                                                          Radius.circular(8),
                                                      bottomRight:
                                                          Radius.circular(
                                                              8)), // <-- Radius
                                                ),
                                                // padding: EdgeInsets.all(0),
                                                backgroundColor: Colors.black87,
                                                // <-- Button color
                                                foregroundColor: Colors
                                                    .white, // <-- Splash color
                                              ),
                                              child: Icon(Icons.add,
                                                  color: Colors.white),
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  : ElevatedButton(
                                      onPressed: () {
                                        setState(() {
                                          wantBuy = true;
                                        });
                                      },
                                      style: ElevatedButton.styleFrom(
                                        //padding:EdgeInsets.zero ,
                                        shape: const CircleBorder(),
                                        // padding: EdgeInsets.all(0),
                                        backgroundColor: Colors.black87,
                                        foregroundColor:
                                            Colors.red, // <-- Splash color
                                      ),
                                      child: const Padding(
                                        padding: EdgeInsets.all(4),
                                        child: Icon(Icons.shopping_bag_outlined,
                                            color: Colors.white),
                                      ),
                                    ),
                            ),
                            Positioned(
                              top: 10,
                              right: -5,
                              child: ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  shape: const CircleBorder(),
                                  // padding: EdgeInsets.all(0),
                                  backgroundColor: Colors.black87,
                                  // <-- Button color
                                  foregroundColor:
                                      Colors.green, // <-- Splash color
                                ),
                                child: const Padding(
                                  padding: EdgeInsets.all(3),
                                  child: Icon(
                                    Icons.favorite_border,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0, right: 8),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Apex Fresh Water King",
                                style: TextStyle(
                                    fontWeight: FontWeight.w600, fontSize: 16),
                              ),
                              const Padding(
                                padding: EdgeInsets.only(top: 3.0, bottom: 3),
                                child: Text(
                                  "SKU: 09U52A",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14,
                                      color: Colors.grey),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 4.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: const [
                                    //Text("    "),
                                    SizedBox(
                                      width: 70,
                                      child: Text(
                                        "data",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),

                                    Text("Each"),
                                    Text("Box"),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 4.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: const [
                                    SizedBox(
                                      width: 70,
                                      child: Text(
                                        "PRP",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Text(
                                      "& 15.5",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      "& 15.5",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 4.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: const [
                                    SizedBox(
                                      width: 70,
                                      child: Text(
                                        "Delivery",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.teal),
                                      ),
                                    ),
                                    Text(
                                      "& 15.5",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      "& 15.5",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 4.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: const [
                                    SizedBox(
                                      width: 70,
                                      child: Text(
                                        "Collection",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.green),
                                      ),
                                    ),
                                    Text(
                                      "& 15.5",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      "& 15.5",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 4.0),
                                child: Row(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                          color: Colors.deepOrangeAccent[100],
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(5.0))),
                                      child: const Padding(
                                        padding: EdgeInsets.all(2.0),
                                        child: Text(
                                          "10%",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 16),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Text(
                                      "Rp 330.000",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.grey.shade400),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              /* Row(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        productQty--;
                      });
                    },
                    style:  ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(8),bottomLeft: Radius.circular(8)), // <-- Radius
                      ),
                      backgroundColor: Colors.black87,
                      foregroundColor: Colors.white,
                    ),

                    child: Icon(Icons.remove,
                        color: Colors.white),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0,right: 20.0),
                    child: Text("$productQty",style: TextStyle(color: Colors.green,fontSize: 16),),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        productQty++;
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.zero,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(topRight: Radius.circular(8),bottomRight: Radius.circular(8)), // <-- Radius
                      ),
                      // padding: EdgeInsets.all(0),
                      backgroundColor: Colors.black87,
                      // <-- Button color
                      foregroundColor: Colors.white, // <-- Splash color
                    ),
                    child: Icon(Icons.add,
                        color: Colors.white),
                  ),
                ],
              ),*/
              Card(
                elevation: 15,
                shadowColor: Colors.grey,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: Row(
                  children: [
                    SizedBox(
                      width: width / 2.6,
                      height: height / 5,
                      child: Stack(
                          fit: StackFit.expand,
                          children: [
                            const ClipRRect(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  bottomLeft: Radius.circular(10)),
                              child: Image(
                                image: AssetImage('assets/product/prod.jpg'),
                                fit: BoxFit.fill,
                              ),
                            ),
                            Positioned(
                              top: 10,
                              right: -5,
                              child: ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  shape: const CircleBorder(),
                                  // padding: EdgeInsets.all(0),
                                  backgroundColor: Colors.black87,
                                  // <-- Button color
                                  foregroundColor:
                                  Colors.green, // <-- Splash color
                                ),
                                child: const Padding(
                                  padding: EdgeInsets.all(3),
                                  child: Icon(
                                    Icons.favorite_border,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                      ],
                      ),
                    ),
                    SizedBox(
                      height: height/5,
                      child: Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,

                          children: [
                            const Text("Apex Fresh Water King Prawns",style: TextStyle(fontWeight: FontWeight.w700),),
                            const Padding(
                              padding: EdgeInsets.only(top: 4.0),
                              child: Text(
                                "SKU: 09U52A",
                                style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 12,
                                    color: Colors.grey),
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(top: 4.0),
                              child: Text(
                                "RRP: 300.000",
                                style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14,
                                    color: Colors.green),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 6.0),
                              child: Row(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                        color: Colors.deepOrangeAccent[100],
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(5.0))),
                                    child:  const Padding(
                                      padding: EdgeInsets.all(2.0),
                                      child: Text(
                                        "10%",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 12),
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 10,),
                                  Text(
                                    "Rp 330.000",
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.grey.shade400),
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 20.0),
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  padding:EdgeInsets.zero,
                                 // elevation: 3,
                                  backgroundColor: Colors.green,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(3.0)),
                                  minimumSize: Size(100, 35), //////// HERE
                                ),
                                onPressed: () {},
                                child: Text('Add to cart'),
                              ),
                            )
                   ]
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
