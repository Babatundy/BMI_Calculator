import 'dart:math';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:testingnewshit/button.dart';

class Bmi extends StatefulWidget {
  @override
  _BmiState createState() => _BmiState();
}

final _Tkey = GlobalKey<FormState>();

class _BmiState extends State<Bmi> {
  String age, weight, lenght;
  double BMI = 0, age_n, weight_n, lenght_n;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.purple,
          title: Text(
            "Bmi calculator",
            style: TextStyle(fontSize: 40),
          ),
          centerTitle: true,
        ),
        body: Container(
          color: Colors.purple.shade200,
          child: ListView(
            padding: EdgeInsets.all(10),
            children: [
              Center(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.grey.shade400,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        "BMI CALCULATOR",
                        style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                          color: Colors.purple,
                        ),
                      ),
                      Form(
                        key: _Tkey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextFormField(
                                decoration: InputDecoration(
                                  labelText: "Age",
                                  border: OutlineInputBorder(
                                    gapPadding: 4,
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                ),
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return "RBK ch7al 3omrek?";
                                  } else {
                                    age = value;
                                    age_n = double.parse(age);
                                  }
                                },
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextFormField(
                                decoration: InputDecoration(
                                  labelText: "Height in M",
                                  border: OutlineInputBorder(
                                    gapPadding: 4,
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                ),
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return "RBK ch7al twil nta?";
                                  } else {
                                    lenght = value;
                                    lenght_n = double.parse(lenght);
                                  }
                                },
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextFormField(
                                decoration: InputDecoration(
                                  labelText: "Weight in KG ",
                                  border: OutlineInputBorder(
                                    gapPadding: 4,
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                ),
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return "RBK ch7al 3tozen?";
                                  } else {
                                    weight = value;
                                    weight_n = double.parse(weight);
                                  }
                                },
                              ),
                            ),
                            RaisedButton(
                              onPressed: () {
                                setState(() {
                                  if (_Tkey.currentState.validate()) {
                                    BMI = (weight_n / pow(lenght_n, 2));
                                  }
                                });
                              },
                              color: Colors.purple,
                              child: Text("Calculate"),
                            ),
                            Center(
                                child: Text(
                              ("YOUR BMI=${BMI.toStringAsFixed(3)}"),
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 40,
                              ),
                            )),
                            Container(
                              child: BMI > 2 ? Image_handler(BMI) : Container(),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}

class Image_handler extends StatelessWidget {
  String path;
  double BMI;

  Image_handler(this.BMI);

  List deside() {
    if (BMI < 18) {
      return [
        Image.asset("images/under.jpg"),
        Text(
          "DUH u nEED to EAT",
          textDirection: TextDirection.ltr,
          style: TextStyle(fontSize: 20),
        )
      ]; //slim
    } else if (BMI < 24.9) {
      return [
        Image.asset("images/normal.jpg"),
        Text(
          "NOrmal GuY",
          textDirection: TextDirection.ltr,
          style: TextStyle(fontSize: 20),
        )
      ];
    } else if (BMI < 30) {
      return [
        Image.asset("images/obese.jpg"),
        Text(
          "u NEED to LOSE some weight aa rbk",
          textDirection: TextDirection.ltr,
          style: TextStyle(fontSize: 20),
        )
      ];
    } else {
      return [
        Image.asset("images/thicc.jpg"),
        Text(
          "Pls Die",
          textDirection: TextDirection.ltr,
          style: TextStyle(fontSize: 20),
        )
      ];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        deside()[0],
        deside()[1],
      ],
    );
  }
}
