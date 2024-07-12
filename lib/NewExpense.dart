import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:expenses/components.dart';

class newexpense extends StatefulWidget {
  const newexpense({super.key, required this.onadd});
  final void Function(Expense ex) onadd;
  @override
  State<newexpense> createState() => _newexpenseState();
}

class _newexpenseState extends State<newexpense> {
  Category selectedcategory = Category.food;

  final titlecontroller = TextEditingController();
  String nodate = 'No Date Selected';
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    titlecontroller.dispose();
    amountcontroller.dispose();
  }

  final amountcontroller = TextEditingController();

  DateTime? selecteddate;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20.0),
      child: Column(
        children: [
          TextField(
            controller: titlecontroller,
            maxLength: 50,
            decoration: const InputDecoration(
                label: Text(
              "Title",
              style: TextStyle(
                  fontFamily: 'font2',
                  fontWeight: FontWeight.w900,
                  fontSize: 20),
            )),
          ),
          TextField(
            controller: amountcontroller,
            keyboardType: TextInputType.number,
            maxLength: 50,
            decoration: const InputDecoration(
                label: Text(
                  "Amount",
                  style: TextStyle(
                      fontFamily: 'font2',
                      fontWeight: FontWeight.w900,
                      fontSize: 20),
                ),
                prefixText: "\$"),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                selecteddate == null
                    ? "No Date Selected"
                    : DateFormat().format(selecteddate!),
                style: const TextStyle(
                    fontFamily: 'font2',
                    fontWeight: FontWeight.w900,
                    fontSize: 20),
              ),
              IconButton(
                  onPressed: () async {
                    final now = DateTime.now();
                    final firstdate =
                        DateTime(now.year - 1, now.month - 10, now.day - 20);
                    final DateTime? Pickeddate = await showDatePicker(
                        context: context,
                        firstDate: firstdate,
                        lastDate: DateTime.now());
                    setState(() {
                      selecteddate = Pickeddate!;
                    });
                  },
                  icon: Icon(Icons.calendar_month))
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              DropdownButton(
                  value: selectedcategory,
                  items: Category.values
                      .map(
                        (e) => DropdownMenuItem(
                          value: e,
                          child: Text(
                            e.name,
                            style: const TextStyle(
                                fontFamily: 'font2',
                                fontWeight: FontWeight.w900,
                                fontSize: 20),
                          ),
                        ),
                      )
                      .toList(),
                  onChanged: (newvalue) {
                    setState(() {
                      selectedcategory = newvalue!;
                    });
                  }),
              Spacer(),
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("Cancel")),
              Container(
                width: 100,
                height: 30,
                child: FloatingActionButton(
                  onPressed: () {
                    final enteredamount = double.parse(amountcontroller.text);

                    if (titlecontroller.text.trim().isEmpty ||
                        enteredamount <= 0 ||
                        amountcontroller.text.trim().isEmpty ||
                        selecteddate == null) {
                      showDialog(
                          context: context,
                          builder: (a) => AlertDialog(
                                title: Text("Error"),
                                content: Container(
                                  height: 300,
                                  child: Column(
                                    children: [
                                      Image.asset('images/error.gif'),
                                      const Text(
                                        "Something went wrong or empty field has found",
                                        style: TextStyle(fontSize: 25),
                                      ),
                                    ],
                                  ),
                                ),
                                actions: [
                                  TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);

                                        widget.onadd(Expense(
                                            category: selectedcategory,
                                            title: titlecontroller.text,
                                            amount: enteredamount,
                                            date: selecteddate!));
                                      },
                                      child: Text("Close"))
                                ],
                              ));
                    } else {
                      showDialog(
                          context: context,
                          builder: (e) => AlertDialog(
                                title: Text("Saved"),
                                content: Image.asset('images/saved.gif'),
                                actions: [
                                  TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);

                                        widget.onadd(Expense(
                                            category: selectedcategory,
                                            title: titlecontroller.text,
                                            amount: enteredamount,
                                            date: selecteddate!));
                                      },
                                      child: Text("Close"))
                                ],
                              ));
                    }
                  },
                  child: Text("Save"),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
