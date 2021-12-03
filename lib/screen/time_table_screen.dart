import 'package:flutter/material.dart';
import 'package:uitoux/model/table_model.dart';

class TimeTableScreen extends StatefulWidget {
  const TimeTableScreen({Key? key}) : super(key: key);

  @override
  _TimeTableScreenState createState() => _TimeTableScreenState();
}

class _TimeTableScreenState extends State<TimeTableScreen> {
  var tableData = [
    TableModel(1, "A", 100, 100, 100, 300, 1),
    TableModel(2, "D", 50, 50, 50, 150, 2),
    TableModel(3, "C", 50, 25, 25, 100, 3),
  ];
  List<String> columnHeading = [
    "S NO",
    "Name",
    "Mark 1",
    "Mark 2",
    "Mark 3",
    "Total",
    "Rank"
  ];

  TextEditingController nameTextEditingController = TextEditingController();
  TextEditingController mark1TextEditingController = TextEditingController();
  TextEditingController mark2TextEditingController = TextEditingController();
  TextEditingController mark3TextEditingController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    showMessage(String msg) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(msg),
        duration: const Duration(seconds: 1),
      ));
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("students details"),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
           const Padding(
             padding: EdgeInsets.all(8.0),
             child: Text("Rank wise student is displayed"),
           ),

            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Container(
                margin: const EdgeInsets.all(10),
                decoration: const BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 4.0, // soften the shadow
                      spreadRadius: 1.0, //extend the shadow
                      offset: Offset(
                        2.0, // Move to right 10  horizontally
                        2.0, // Move to bottom 10 Vertically
                      ),
                    )
                  ],
                ),
                child: Card(
                  elevation: 10,
                  child: DataTable(
                    dividerThickness: 1.7,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey, width: 1),
                    ),
                    horizontalMargin: 10,
                    dataRowHeight: 55,
                    columns: columnHeading.map((e) {
                      return DataColumn(
                          label: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Text(
                              e,
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16),
                            ),
                          )
                        ],
                      ));
                    }).toList(),
                    rows: [
                      for (int i = 0; i < tableData.length; i++)
                        DataRow(
                          color: MaterialStateProperty.all(
                              i.isEven ? Colors.grey[200] : Colors.transparent),
                          cells: [
                            DataCell(
                                Text(
                                  (i + 1).toString(),
                                ),
                                onTap: () {
                                  showMessage("S No auto generated, can't be edited");
                                }),
                            DataCell(
                                Text(
                                  tableData[i].stdName,
                                ),showEditIcon: true,
                                onTap: () {
                                  showBottomForEditingName(i);
                                }),
                            DataCell(
                                Text(
                                  tableData[i].mark1.toString(),
                                ),
                                showEditIcon: true,
                                onTap: () {
                                  showBottomForEditingMark1(i);
                                }),
                            DataCell(
                                Text(
                                  tableData[i].mark2.toString(),
                                ),
                                showEditIcon: true,
                                onTap: () {
                                  showBottomForEditingMark2(i);
                                }),
                            DataCell(
                                Text(
                                  tableData[i].mark3.toString(),
                                ),
                                showEditIcon: true,
                                onTap: () {
                                  showBottomForEditingMark3(i);
                                }),
                            DataCell(
                                Text(
                                  tableData[i].total.toString(),
                                ),
                                onTap: () {
                                  showMessage("total will be calculated automatically by marks");
                                }),
                            DataCell(
                                Text(
                                  tableData[i].rank.toString(),
                                ),
                                onTap: () {
                                  showMessage("Rank is calculated by the total mark");

                                }),
                          ],
                        ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
      floatingActionButton: MediaQuery.of(context).viewInsets.bottom > 0
          ? Container()
          : FloatingActionButton.extended(
              onPressed: () => showBottomForgettingData(),
              isExtended: true,
              label: const Text("Add New Student"),
            ),
    );
  }

  showBottomForgettingData() {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(20),
          ),
        ),
        builder: (_) {
          return Container(
              padding: EdgeInsets.only(
                  left: 15,
                  right: 15,
                  top: 10,
                  bottom: MediaQuery.of(context).viewInsets.bottom),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Add New Student",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w700),
                        ),
                        ElevatedButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                int total = (int.parse(
                                        mark1TextEditingController.text) +
                                    int.parse(mark2TextEditingController.text) +
                                    int.parse(mark3TextEditingController.text));

                                tableData.add(TableModel(
                                  tableData.length,
                                  nameTextEditingController.text,
                                  int.parse(mark1TextEditingController.text),
                                  int.parse(mark2TextEditingController.text),
                                  int.parse(mark3TextEditingController.text),
                                  total,
                                  tableData.length + 1,
                                ));

                                tableData
                                    .sort((b, a) => a.total.compareTo(b.total));
                                for (int i = 0; i < tableData.length; i++) {
                                  int rank = tableData.indexOf(tableData[i]);
                                  tableData[i].rank = rank + 1;
                                }
                                Navigator.of(context).pop();
                                setState(() {});
                              }
                            },
                            child: const Text("save"))
                      ],
                    ),
                    Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                            controller: nameTextEditingController,
                            validator: (value) {
                              if (value!.trim().isEmpty) {
                                return 'Name is mandatory';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.grey[200],
                              contentPadding: const EdgeInsets.only(left: 10),
                              hintText: 'Name',
                              border: InputBorder.none,
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Theme.of(context).primaryColor),
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                            controller: mark1TextEditingController,
                            validator: (value) {
                              if (value!.trim().isEmpty) {
                                return 'Mark 1 is mandatory';
                              }
                              if (!isNumericUsingRegularExpression(value)) {
                                return 'Mark should been in number';
                              }
                              return null;
                            },
                            keyboardType:
                                const TextInputType.numberWithOptions(),
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.grey[200],
                              contentPadding: const EdgeInsets.only(left: 10),
                              hintText: 'Mark 1',
                              border: InputBorder.none,
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Theme.of(context).primaryColor),
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                            controller: mark2TextEditingController,
                            keyboardType:
                                const TextInputType.numberWithOptions(),
                            validator: (value) {
                              if (value!.trim().isEmpty) {
                                return 'Mark 2 is mandatory';
                              }
                              if (!isNumericUsingRegularExpression(value)) {
                                return 'Mark should been in number';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.grey[200],
                              contentPadding: const EdgeInsets.only(left: 10),
                              hintText: 'Mark 2',
                              border: InputBorder.none,
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Theme.of(context).primaryColor),
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                            keyboardType:
                                const TextInputType.numberWithOptions(),
                            controller: mark3TextEditingController,
                            validator: (value) {
                              if (value!.trim().isEmpty) {
                                return 'Mark 3 is mandatory';
                              }
                              if (!isNumericUsingRegularExpression(value)) {
                                return 'Mark should been in number';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.grey[200],
                              contentPadding: const EdgeInsets.only(left: 10),
                              hintText: 'Mark 3',
                              border: InputBorder.none,
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Theme.of(context).primaryColor),
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 35,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ));
        });
  }


  showBottomForEditingName(int i) {
    bool error=false;
    TextEditingController textEditingController=TextEditingController();
    textEditingController.text=tableData[i].stdName;
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(20),
          ),
        ),
        builder: (_) {
          return Container(
              padding: EdgeInsets.only(
                  left: 15,
                  right: 15,
                  top: 10,
                  bottom: MediaQuery.of(context).viewInsets.bottom),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Edit ",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w700),
                        ),
                        ElevatedButton(
                            onPressed: () {
                              if (!error) {
                                 tableData[i].stdName = textEditingController.text;

                                Navigator.of(context).pop();
                                setState(() {});
                              }
                            },
                            child: const Text("save"))
                      ],
                    ),
                    TextFormField(
                      keyboardType: const TextInputType.numberWithOptions(),
                      controller: textEditingController,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) {
                        if (value!.trim().isEmpty) {
                          error=true;
                          return 'Name is mandatory';
                        }
                        error=false;
                        return null;
                      },
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.grey[200],
                        contentPadding: const EdgeInsets.only(left: 10),
                        hintText: "Name",
                        border: InputBorder.none,
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Theme.of(context).primaryColor),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        )
                      ),
                    ),
                  const  SizedBox(
                      height: 30,
                    ),
                  ],
                ),
              ));
        });
  }


  showBottomForEditingMark1(int i) {
    bool error=false;
    TextEditingController textEditingController=TextEditingController();
    textEditingController.text=tableData[i].mark1.toString();
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(20),
          ),
        ),
        builder: (_) {
          return Container(
              padding: EdgeInsets.only(
                  left: 15,
                  right: 15,
                  top: 10,
                  bottom: MediaQuery.of(context).viewInsets.bottom),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Edit ",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w700),
                        ),
                        ElevatedButton(
                            onPressed: () {
                              if (!error) {
                                 tableData[i].mark1 = int.parse(textEditingController.text);

                                 tableData[i].total=tableData[i].mark1+tableData[i].mark2+tableData[i].mark3;

                                 tableData.sort((b, a) => a.total.compareTo(b.total));
                                 for (int i = 0; i < tableData.length; i++) {
                                   int rank = tableData.indexOf(tableData[i]);
                                   tableData[i].rank = rank + 1;
                                 }

                                Navigator.of(context).pop();
                                setState(() {});
                              }
                            },
                            child: const Text("save"))
                      ],
                    ),
                    TextFormField(
                      keyboardType: const TextInputType.numberWithOptions(),
                      controller: textEditingController,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) {
                        if (value!.trim().isEmpty) {
                          error=true;
                          return 'Mark 1 is mandatory';
                        }
                        if (!isNumericUsingRegularExpression(value)) {
                          return 'Mark 1 should been in number';
                        }
                        error=false;
                        return null;
                      },
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.grey[200],
                        contentPadding: const EdgeInsets.only(left: 10),
                        hintText: "Mark 1",
                        border: InputBorder.none,
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Theme.of(context).primaryColor),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        )
                      ),
                    ),
                  const  SizedBox(
                      height: 30,
                    ),
                  ],
                ),
              ));
        });
  }

  showBottomForEditingMark2(int i) {
    bool error=false;
    TextEditingController textEditingController=TextEditingController();
    textEditingController.text=tableData[i].mark2.toString();
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(20),
          ),
        ),
        builder: (_) {
          return Container(
              padding: EdgeInsets.only(
                  left: 15,
                  right: 15,
                  top: 10,
                  bottom: MediaQuery.of(context).viewInsets.bottom),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Edit ",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w700),
                        ),
                        ElevatedButton(
                            onPressed: () {
                              if (!error) {
                                 tableData[i].mark2 = int.parse(textEditingController.text);

                                 tableData[i].total=tableData[i].mark1+tableData[i].mark2+tableData[i].mark3;

                                 tableData.sort((b, a) => a.total.compareTo(b.total));
                                 for (int i = 0; i < tableData.length; i++) {
                                   int rank = tableData.indexOf(tableData[i]);
                                   tableData[i].rank = rank + 1;
                                 }

                                Navigator.of(context).pop();
                                setState(() {});
                              }
                            },
                            child: const Text("save"))
                      ],
                    ),
                    TextFormField(
                      keyboardType: const TextInputType.numberWithOptions(),
                      controller: textEditingController,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) {
                        if (value!.trim().isEmpty) {
                          error=true;
                          return 'Mark 2 is mandatory';
                        }
                        if (!isNumericUsingRegularExpression(value)) {
                          return 'Mark 2 should been in number';
                        }
                        error=false;
                        return null;
                      },
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.grey[200],
                        contentPadding: const EdgeInsets.only(left: 10),
                        hintText: "Mark 2",
                        border: InputBorder.none,
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Theme.of(context).primaryColor),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        )
                      ),
                    ),
                  const  SizedBox(
                      height: 30,
                    ),
                  ],
                ),
              ));
        });
  }

  showBottomForEditingMark3(int i) {
    bool error=false;
    TextEditingController textEditingController=TextEditingController();
    textEditingController.text=tableData[i].mark3.toString();
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(20),
          ),
        ),
        builder: (_) {
          return Container(
              padding: EdgeInsets.only(
                  left: 15,
                  right: 15,
                  top: 10,
                  bottom: MediaQuery.of(context).viewInsets.bottom),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Edit ",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w700),
                        ),
                        ElevatedButton(
                            onPressed: () {
                              if (!error) {
                                 tableData[i].mark3 = int.parse(textEditingController.text);

                                 tableData[i].total=tableData[i].mark1+tableData[i].mark2+tableData[i].mark3;

                                 tableData.sort((b, a) => a.total.compareTo(b.total));
                                 for (int i = 0; i < tableData.length; i++) {
                                   int rank = tableData.indexOf(tableData[i]);
                                   tableData[i].rank = rank + 1;
                                 }

                                Navigator.of(context).pop();
                                setState(() {});
                              }
                            },
                            child: const Text("save"))
                      ],
                    ),
                    TextFormField(
                      keyboardType: const TextInputType.numberWithOptions(),
                      controller: textEditingController,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) {
                        if (value!.trim().isEmpty) {
                          error=true;
                          return 'Mark 3 is mandatory';
                        }
                        if (!isNumericUsingRegularExpression(value)) {
                          return 'Mark 3 should been in number';
                        }
                        error=false;
                        return null;
                      },
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.grey[200],
                        contentPadding: const EdgeInsets.only(left: 10),
                        hintText: "Mark 3",
                        border: InputBorder.none,
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Theme.of(context).primaryColor),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        )
                      ),
                    ),
                  const  SizedBox(
                      height: 30,
                    ),
                  ],
                ),
              ));
        });
  }

  bool isNumericUsingRegularExpression(String string) {
    final numericRegex = RegExp(r'^-?(([0-9]*)|(([0-9]*)\.([0-9]*)))$');

    return numericRegex.hasMatch(string);
  }
}
