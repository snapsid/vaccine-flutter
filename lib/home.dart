import 'package:flutter/material.dart';

class MyHome extends StatefulWidget {
  const MyHome({Key? key}) : super(key: key);

  static String pincode = "";

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text("Indian Vaccine"),
      ),
      body: Container(
        margin: EdgeInsets.only(left: 30, right: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              keyboardType: TextInputType.number,
              onChanged: (data) {
                MyHome.pincode = data;
              },
              decoration: InputDecoration(
                  hintText: "Pincode",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20))),
            ),
            SizedBox(
              height: 10,
            ),
            Material(
              borderRadius: BorderRadius.circular(20),
              color: Colors.teal,
              elevation: 5,
              child: MaterialButton(
                height: 40,
                minWidth: 130,
                onPressed: () {
                  Navigator.pushNamed(context, 'vaccine');
                },
                child: Text(
                  'Search',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
