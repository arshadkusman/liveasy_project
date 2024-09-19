import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:liveasy_project/postauth.dart';
import 'package:pinput/pinput.dart';

class VerifyPhone extends StatefulWidget {
  final String phonenumber;
  const VerifyPhone({super.key, required this.phonenumber});

  @override
  State<VerifyPhone> createState() => _VerifyPhoneState();
}

class _VerifyPhoneState extends State<VerifyPhone> {
  String _verificationcode = '';
  bool authcheck = false;
  bool isResending = false;

  @override
  Widget build(BuildContext context) {
    String phnno = widget.phonenumber;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.black,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 80),
          child: Column(
            children: [
              const Text(
                "Verify Phone",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8, bottom: 8),
                child: Text(
                  'Code is sent to $phnno',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.grey),
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Pinput(
                    androidSmsAutofillMethod:
                        AndroidSmsAutofillMethod.smsRetrieverApi,
                    onCompleted: (value) async {
                      await verifyCode(value);
                    },
                    length: 6,
                    onSubmitted: (value) async {
                      await verifyCode(value);
                    },
                    defaultPinTheme: PinTheme(
                      width: 60,
                      height: 60,
                      textStyle:
                          const TextStyle(fontSize: 20, color: Colors.white),
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(140, 91, 207, 225),
                        border: Border.all(
                            color: const Color.fromRGBO(234, 239, 243, 1)),
                        borderRadius: BorderRadius.circular(0),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Didn’t receive the code? ",
                      style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    TextButton(
                      onPressed: isResending
                          ? null
                          : () async {
                              setState(() {
                                isResending = true;
                              });
                              await newcode();
                              setState(() {
                                isResending = false;
                              });
                            },
                      child: Text(
                        isResending ? 'Resending...' : 'Request Again',
                        style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 18, left: 18, top: 25),
                child: SizedBox(
                  width: double.infinity,
                  height: 70,
                  child: ElevatedButton(
                    onPressed: () {
                      if (authcheck) {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const PostAuth()),
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                              content: Text('Invalid Authentication code!')),
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(0)),
                      backgroundColor: const Color.fromARGB(255, 1, 7, 116),
                    ),
                    child: const Text(
                      'VERIFY AND CONTINUE',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Align(
                  alignment: FractionalOffset.bottomCenter,
                  child: Image.asset(
                    "assets/images/image4.png",
                    fit: BoxFit.fill,
                    height: 200,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> verifyCode(String smsCode) async {
    try {
      await FirebaseAuth.instance
          .signInWithCredential(PhoneAuthProvider.credential(
              verificationId: _verificationcode, smsCode: smsCode))
          .then((value) async {
        if (value.user != null) {
          setState(() {
            authcheck = true;
          });
          print('Pass to home!');
        }
      });
    } catch (e) {
      FocusScope.of(context).unfocus();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Invalid verification code!')),
      );
    }
  }

  verifyotp() async {
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: '+91${widget.phonenumber}',
      verificationCompleted: (PhoneAuthCredential credential) async {
        await FirebaseAuth.instance
            .signInWithCredential(credential)
            .then((value) {
          if (value.user != null) {
            setState(() {
              authcheck = true;
            });
          }
        });
      },
      verificationFailed: (FirebaseAuthException error) {
        setState(() {
          authcheck = false;
        });
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text('Verification failed. Error: ${error.message}')));
      },
      codeSent: (String verificationId, int? resendToken) {
        setState(() {
          _verificationcode = verificationId;
        });
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        setState(() {
          _verificationcode = verificationId;
        });
      },
      timeout: const Duration(seconds: 60),
    );
  }

  newcode() async {
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: '+91${widget.phonenumber}',
      verificationCompleted: (PhoneAuthCredential credential) async {
        await FirebaseAuth.instance
            .signInWithCredential(credential)
            .then((value) async {
          if (value.user != null) print("User successfully logged in!");
        });
        setState(() {
          authcheck = true;
        });
      },
      verificationFailed: (FirebaseAuthException error) {
        print(error.message);
      },
      timeout: const Duration(seconds: 120),
      codeSent: (verificationId, forceResendingToken) {
        setState(() {
          _verificationcode = verificationId;
        });
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Code resent successfully!')),
        );
      },
      codeAutoRetrievalTimeout: (verificationId) {
        setState(() {
          _verificationcode = verificationId;
        });
      },
    );
  }

  @override
  void initState() {
    super.initState();
    verifyotp();
  }
}
