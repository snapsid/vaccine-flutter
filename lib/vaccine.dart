import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:vaccine/home.dart';

class MyVaccine extends StatefulWidget {
  const MyVaccine({Key? key}) : super(key: key);

  @override
  State<MyVaccine> createState() => _MyVaccineState();
}

class _MyVaccineState extends State<MyVaccine> {
  int listC = 0;
  var sessions = [];

  var pincode = "";

  @override
  void initState() {
    print("Results opened");
    pincode = MyHome.pincode;

    print(pincode);
    getData();

    // TODO: implement initState
    super.initState();
  }

  getData() async {
    var url = Uri.parse(
        'https://cdn-api.co-vin.in/api/v2/appointment/sessions/public/findByPin?pincode=$pincode&date=23-06-2022');
    var response = await http.get(url);

    var decode = jsonDecode(response.body);

    sessions = decode['sessions'];

    setState(() {
      listC = sessions.length;
    });

    print(decode['sessions'][0]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text("Results"),
      ),
      body: Container(
        child: ListView.builder(
            itemCount: listC,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                  margin: EdgeInsets.only(top: 10, left: 20, right: 20),
                  height: 200,
                  child: Container(
                    child: Card(
                      color: Colors.grey.shade100,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            width: 200,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(sessions[index]['vaccine']),
                                Text(sessions[index]['available_capacity']
                                    .toString()),
                                Text(sessions[index]['name']),
                                Text(
                                  sessions[index]['address'],
                                ),
                                Text(
                                    "${sessions[index]['district_name']}, ${sessions[index]['state_name']} "),
                              ],
                            ),
                          ),
                          Container(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(sessions[index]['fee_type'].toString()),
                                Column(
                                  children: [
                                    Text(
                                      "Available",
                                      style: TextStyle(
                                          fontSize: 18, color: Colors.red),
                                    ),
                                    Text(
                                        sessions[index]['available_capacity']
                                            .toString(),
                                        style: TextStyle(
                                            fontSize: 30,
                                            color: Colors.red,
                                            fontWeight: FontWeight.bold))
                                  ],
                                ),
                                Text(
                                  "Min age: ${sessions[index]['min_age_limit'].toString()}",
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ));
            }),
      ),
    );
  }
}
