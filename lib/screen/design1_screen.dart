import 'package:flutter/material.dart';

class Design1Screen extends StatefulWidget {
  const Design1Screen({Key? key}) : super(key: key);

  @override
  _Design1ScreenState createState() => _Design1ScreenState();
}

class _Design1ScreenState extends State<Design1Screen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Colors.orange, Colors.deepOrangeAccent])),
      child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Center(
            child: Container(
              height: 490,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              margin: const EdgeInsets.symmetric(horizontal: 15),
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: const [
                      Expanded(
                          child: Text("FUEL INJECTION PUMP-4CTI 87KW",textScaleFactor: 1,style: TextStyle(
                              fontWeight: FontWeight.w600))),
                      Text("BACK",style: TextStyle(color: Colors.grey),)
                    ],
                  ),
                  const SizedBox(height: 10),
                  const Divider(color: Colors.grey),
                  Row(
                    children: const [
                      Text("Unit Price: ₹"),
                      Text(
                        "1500",
                        style: TextStyle(color: Colors.orange),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 13,
                  ),
                  const Text("AVAILABLE STOCK",textScaleFactor: 1,style: TextStyle(
                      fontWeight: FontWeight.w500)),
                  const  SizedBox(height: 5),
                  Table(
                    border: TableBorder.all(),
                    defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                    children: [
                      TableRow(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 8, top: 8, bottom: 3),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text(
                                  "Warehouse North",
                                  textScaleFactor: 1,
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w300),
                                ),
                                SizedBox(height: 5),
                                Text("500",
                                    textScaleFactor: 1,
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600)),
                              ],
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(left: 25, top: 8),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text(
                                  "Warehouse South",
                                  textScaleFactor: 1,
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w300),
                                ),
                                SizedBox(height: 5),
                                Text("500",
                                    textScaleFactor: 1,
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600)),
                              ],
                            ),
                          ),
                        ],
                      ),
                      TableRow(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 8, top: 8, bottom: 3),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text(
                                  "Warehouse East",
                                  textScaleFactor: 1,
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w300),
                                ),
                                SizedBox(height: 5),
                                Text("500",
                                    textScaleFactor: 1,
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600)),
                              ],
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(left: 25, top: 8),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text(
                                  "Warehouse West",
                                  textScaleFactor: 1,
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w300),
                                ),
                                SizedBox(height: 5),
                                Text("500",
                                    textScaleFactor: 1,
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600)),
                              ],
                            ),
                          ),
                        ],
                      ),
                      TableRow(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 8, top: 8, bottom: 3),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text(
                                  "Warehouse North East",
                                  textScaleFactor: 1,
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w300),
                                ),
                                SizedBox(height: 5),
                                Text("500",
                                    textScaleFactor: 1,
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600)),
                              ],
                            ),
                          ),
                          Container(),
                        ],
                      ),
                    ],
                  ),
                  const  SizedBox(height: 25),
                  const Align(
                    child: Text(
                      "Quality",
                      textScaleFactor: 1,
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      RawMaterialButton(
                          onPressed: () {},
                          child:const Text("-",textScaleFactor: 1,style: TextStyle(color: Colors.white),),
                          fillColor: Colors.deepOrangeAccent,
                          constraints: const BoxConstraints.tightFor(
                              width: 32, height: 32),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          )),
                      Container(margin: const EdgeInsets.symmetric(horizontal: 25),child: const Text("02",textScaleFactor: 1,style: TextStyle(fontSize: 18),)),
                      RawMaterialButton(
                          onPressed: () {},
                          child:const Text("+",textScaleFactor: 1,style: TextStyle(color: Colors.white),),
                          fillColor: Colors.deepOrangeAccent,
                          constraints: const BoxConstraints.tightFor(
                              width: 32, height: 32),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          )),
                    ],
                  ),
                  const Divider(color: Colors.grey),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: const [
                          Text("Unit Price: ₹",textScaleFactor: 1,),
                          Text(
                            "3000",
                            textScaleFactor: 1,
                            style: TextStyle(color: Colors.orange),
                          ),
                        ],
                      ),
               Container(
                  decoration: BoxDecoration(
                    boxShadow:const [
                      BoxShadow(
                          color: Colors.black26, offset: Offset(0, 4), blurRadius: 5.0)
                    ],
                    gradient:const LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      stops: [0.0, 1.0],
                      colors: [
                        Colors.orange,
                        Colors.deepOrange,
                      ],
                    ),
                    color: Colors.deepPurple.shade300,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor:
                      MaterialStateProperty.all(Colors.transparent),
                      // elevation: MaterialStateProperty.all(3),
                      shadowColor:
                      MaterialStateProperty.all(Colors.transparent),
                    ),
                    onPressed: () {
                    },
                    child: const Text(
                        "ADD",
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),

                  ),
                ),
                    ],
                  )
                ],
              ),
            ),
          )),
    );
  }
}
