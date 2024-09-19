import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:liveasy_project/entermobile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool check = false;
  String? selectedLanguage;
  String bottomImage = "assets/images/image2.png";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Padding(
                padding: const EdgeInsets.only(top: 180, bottom: 40),
                child: Center(
                  child: Image.asset(
                    "assets/images/image1.png",
                    height: 66,
                    width: 66,
                  ),
                )),
            const Text('Please Select Your Language',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
            const Padding(
                padding: EdgeInsets.only(top: 8.0),
                child: Text(
                  'You can change the language \n at any time',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.grey),
                )),
            Padding(
              padding: const EdgeInsets.only(top: 24, left: 72, right: 72),
              child: DropdownButtonFormField<String>(
                value: selectedLanguage,
                hint: const Text(
                  'English',
                  style: TextStyle(
                    fontWeight: FontWeight.normal, // Normal hint style
                  ),
                ),
                items: <String>[
                  'English',
                  'English-UK',
                  'English-AU',
                  'English-IND'
                ].map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(
                      value,
                      style: TextStyle(
                        fontWeight: value == selectedLanguage
                            ? FontWeight.bold
                            : FontWeight.normal,
                      ),
                    ),
                  );
                }).toList(),
                onChanged: (newValue) {
                  setState(() {
                    selectedLanguage = newValue;
                    check = true;

                    bottomImage = "assets/images/image3.png";
                  });
                },
                decoration: const InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black, width: 2),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black, width: 2),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 72, left: 72, top: 24),
              child: SizedBox(
                  width: double.infinity,
                  height: 55,
                  child: ElevatedButton(
                    onPressed: () {
                      if (check) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const EnterMobile()));
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content:
                                    Text('Please select the language first!')));
                      }
                    },
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(0)),
                        backgroundColor: const Color.fromARGB(255, 1, 7, 116)),
                    child: const Text(
                      'NEXT',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                  )),
            ),
            Expanded(
                child: Align(
                    alignment: FractionalOffset.bottomCenter,
                    child: Stack(
                      alignment: Alignment.bottomCenter,
                      children: <Widget>[
                        Image.asset(
                          bottomImage,
                          fit: BoxFit.fill,
                          height: 200,
                        ),
                      ],
                    )))
          ],
        ),
      ),
    );
  }
}
