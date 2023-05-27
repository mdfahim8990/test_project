import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductViewPage extends StatefulWidget {
  const ProductViewPage({Key? key}) : super(key: key);

  @override
  State<ProductViewPage> createState() => _ProductViewPageState();
}

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
        padding:  EdgeInsets.all(8.0),
        child: SizedBox(
          height: height/2.8,
          width: width/2.6,
          child: Card(
            elevation: 15,
            shadowColor: Colors.grey,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: Column(
              children: <Widget>[
                Stack(
                  children: [
                    Container(
                      height: height/6,
                      width: width,
                      child: Image.asset("assets/product/prod.jpg",fit: BoxFit.fill),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        //color: Colors.white,
                      ),
                    ),
                     Positioned(
                        top: 10,
                        child: IconButton(
                          iconSize: 100,
                          icon:  const Icon(
                            Icons.add,
                          ),
                          onPressed: () {
                            setState(
                                  () {

                              },
                            );
                          },
                        ),),
                    Positioned(
                        bottom: 10,
                        child: ElevatedButton(
                          onPressed: () {},
                          child: Text("Button 2"),
                        )),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                  ],
                ),

              ],
            ),
          ),
        ),
      )
    );
  }
}
