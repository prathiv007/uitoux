import 'package:flutter/material.dart';

class Design2Screen extends StatefulWidget {
  const Design2Screen({Key? key}) : super(key: key);

  @override
  _Design2ScreenState createState() => _Design2ScreenState();
}

class _Design2ScreenState extends State<Design2Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        leading: const Icon(
          Icons.keyboard_backspace_outlined,
          color: Colors.blue,
        ),
        title: const Text(
          "ASP PORTAL",
          textScaleFactor: 1,
          style: TextStyle(color: Colors.blue),
        ),
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Kindly ensure the following ASP details",
                textScaleFactor: 1,
                style: TextStyle(fontSize: 13),
              ),
              const SizedBox(height: 15),
              const Text(
                "Mr.John Doe",
                textScaleFactor: 1,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              textView(
                  text1: '109,Athipalayam Road, Ramkrishnapuram',
                  text2: "Address"),
              textView(text1: 'Chinnavedampatti', text2: "Location"),
              textView(text1: 'Combatore', text2: "District"),
              textView(text1: 'Tamil Nadu', text2: "State"),
              textView(text1: '641049', text2: "Pincode"),
              textView(text1: '+91 99999 00000', text2: "Contact No 1"),
              const SizedBox(height: 5),
              const Text(
                "Service Details",
                textScaleFactor: 1,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              textView(text1: 'Mechanical | Custoday', text2: ""),
              const SizedBox(height: 5),
              const Text(
                "Latitude & Longitude",
                textScaleFactor: 1,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              textView(text1: '11.664754,76.262606', text2: ""),
              const SizedBox(height: 5),
              const Text(
                "Bank Details",
                textScaleFactor: 1,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              doubleTextView(text1:'Account No',text2: '00021547850',text3: "Bank Name",text4:"Inian Oversass"),
              doubleTextView(text1:'Branch Name',text2: 'Saravanampatti',text3: "IFSC Code",text4:"AXIDE 1009A"),
              doubleTextView(text1:'Account Type',text2: 'Saving',text3: "PAN No",text4:"ANGHPO90V"),
              doubleTextView(text1:'GST Reg No',text2: 'ANGHPO90V',text3: "GST Reg Date",text4:"29/09/2017"),
              const SizedBox(height: 10),
              Align(
                alignment: Alignment.center,
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
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
                            Colors.blueAccent,
                            Colors.lightBlueAccent,
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
                    const SizedBox(height: 5),
                    Text("CANCEL",textScaleFactor: 1,style: TextStyle(color: Colors.grey),)
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget textView({required String text1, required String text2}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          Expanded(
              child: Text(
            text1,
            textScaleFactor: 1,
            style: const TextStyle(color: Colors.grey, fontSize: 14),
          )),
          Text(
            text2,
            textScaleFactor: 1,
            style: const TextStyle(fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }

  Widget doubleTextView({
    required String text1,
    required String text2,
    required String text3,
    required String text4,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(text1,textScaleFactor: 1,style: const TextStyle(fontWeight: FontWeight.w500)),
                     const SizedBox(height: 3),
                      Text(
                        text2,
                        textScaleFactor: 1,
                        style: const TextStyle(color: Colors.grey, fontSize: 14),
                      )
                    ], ),
          ),
          Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(text3,textScaleFactor: 1,style: const TextStyle(fontWeight: FontWeight.w500)),
                  const SizedBox(height: 3),
                  Text(
                    text4,
                    textScaleFactor: 1,
                    style: const TextStyle(color: Colors.grey, fontSize: 14),
                  )
                ], )),
        ],
      ),
    );
  }
}
