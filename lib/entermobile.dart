import 'package:flutter/material.dart';
import 'package:liveasy_project/verifymobile.dart';

class EnterMobile extends StatefulWidget {
  const EnterMobile({super.key});

  @override
  State<EnterMobile> createState() => _EnterMobileState();
}

class _EnterMobileState extends State<EnterMobile> {
  TextEditingController phonecontroller = TextEditingController();
  late String phonenumber = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.black,
        leading: IconButton(
          icon: const Icon(Icons.close), // Replace with a cross icon
          onPressed: () {
            Navigator.of(context).pop(); // Handle back navigation
          },
        ),
      ),
      body: Stack(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 100),
                  child: Column(
                    children: [
                      const Text(
                        "Please enter your mobile number",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 22),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 8.0),
                        child: Text(
                          'You will receive a 4-digit code \n to verify next',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.grey),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 30, left: 18, right: 18),
                        child: SizedBox(
                          width: double.infinity,
                          height: 65,
                          child: TextFormField(
                            controller: phonecontroller,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              hintText: ' - Mobile Number',
                              prefixIcon: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8.0),
                                    child: Image.asset(
                                      'assets/images/india_flag.png', // Add your country flag image here
                                      width: 24,
                                      height: 24,
                                    ),
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.all(5),
                                    child: Text(
                                      "+91",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ],
                              ),
                              prefixIconConstraints: const BoxConstraints(
                                minWidth: 0,
                                minHeight: 0,
                              ),
                              enabledBorder: const OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.black, width: 2),
                              ),
                              focusedBorder: const OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.black, width: 2),
                              ),
                              border: const OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.black, width: 2),
                              ),
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Enter mobile number';
                              } else if (phonecontroller.text.length == 10) {
                                phonenumber = phonecontroller.text;
                              }
                              return null;
                            },
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(right: 18, left: 18, top: 25),
                        child: SizedBox(
                          width: double.infinity,
                          height: 70,
                          child: ElevatedButton(
                            onPressed: () {
                              if (phonecontroller.text.isEmpty) {
                                // Show a SnackBar if the phone number is empty
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content:
                                        Text('Please enter your phone number!'),
                                    behavior: SnackBarBehavior.fixed,
                                  ),
                                );
                              } else if (phonecontroller.text.length == 10) {
                                phonenumber = phonecontroller.text;
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => VerifyPhone(
                                      phonenumber: phonenumber,
                                    ),
                                  ),
                                );
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text(
                                        'Please enter the correct 10-digit phone number!'),
                                  ),
                                );
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(0),
                              ),
                              backgroundColor:
                                  const Color.fromARGB(255, 1, 7, 116),
                            ),
                            child: const Text(
                              'CONTINUE',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          // The bottom image will be fixed in position
          Align(
              alignment: FractionalOffset.bottomCenter,
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: <Widget>[
                  Image.asset(
                    "assets/images/image4.png",
                    fit: BoxFit.fill,
                    height: 200,
                  ),
                ],
              ))
        ],
      ),
    );
  }
}
