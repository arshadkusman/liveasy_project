import 'package:flutter/material.dart';

class PostAuth extends StatefulWidget {
  const PostAuth({super.key});

  @override
  State<PostAuth> createState() => _PostAuthState();
}

class _PostAuthState extends State<PostAuth> {
  int groupvalue = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          foregroundColor: Colors.transparent,
        ),
        body: Center(
            child: Padding(
          padding: const EdgeInsets.only(top: 80),
          child: Column(children: [
            const Text(
              'Please select your profile',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20, left: 0, right: 0),
              child: Column(children: [
                Padding(
                  padding: const EdgeInsets.only(
                      top: 20, bottom: 20, left: 16, right: 16),
                  child: SizedBox(
                    height: 120,
                    child: Card(
                      color: Colors.white,
                      semanticContainer: true,
                      shape: RoundedRectangleBorder(
                          side: const BorderSide(color: Colors.black, width: 3),
                          borderRadius: BorderRadius.circular(2)),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Transform.scale(
                              scale: 1.7,
                              alignment: Alignment.center,
                              child: Radio(
                                  value: 1,
                                  groupValue: groupvalue,
                                  activeColor:
                                      const Color.fromARGB(255, 1, 7, 116),
                                  onChanged: (value) {
                                    setState(() {
                                      groupvalue = 1;
                                    });
                                  }),
                            ),
                          ),
                          Stack(
                            alignment: Alignment.center,
                            children: <Widget>[
                              Image.asset(
                                "assets/images/shipper.png",
                                fit: BoxFit.fill,
                                height: 50,
                              )
                            ],
                          ),
                          const Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(left: 15),
                                child: Text(
                                  'Shipper',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      fontWeight: FontWeight.normal,
                                      fontSize: 20),
                                ),
                              ),
                              Padding(
                                  padding: EdgeInsets.only(left: 15),
                                  child: Text(
                                    'Lorem Ipsum Donor sit amet,\nconseqtar adepsi',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                        fontWeight: FontWeight.normal,
                                        color: Colors.grey),
                                  )),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 0, bottom: 10, left: 16, right: 16),
                  child: SizedBox(
                    height: 120,
                    child: Card(
                      semanticContainer: true,
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                          side: const BorderSide(color: Colors.black, width: 3),
                          borderRadius: BorderRadius.circular(2)),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Transform.scale(
                              scale: 1.7,
                              alignment: Alignment.center,
                              child: Radio(
                                  value: 2,
                                  groupValue: groupvalue,
                                  activeColor:
                                      const Color.fromARGB(255, 1, 7, 116),
                                  onChanged: (value) {
                                    setState(() {
                                      groupvalue = 2;
                                    });
                                  }),
                            ),
                          ),
                          Stack(
                            alignment: Alignment.center,
                            children: <Widget>[
                              Image.asset(
                                "assets/images/transporter.png",
                                fit: BoxFit.fill,
                                height: 33,
                              ),
                            ],
                          ),
                          const Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                  padding: EdgeInsets.only(left: 10),
                                  child: Text(
                                    'Transporter',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                        fontWeight: FontWeight.normal,
                                        fontSize: 20),
                                  )),
                              Padding(
                                  padding: EdgeInsets.only(left: 15),
                                  child: Text(
                                    'Lorem Ipsum Donor sit amet,\nconseqtar adepsi',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                        fontWeight: FontWeight.normal,
                                        color: Colors.grey),
                                  )),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 18, left: 18, top: 25),
                  child: SizedBox(
                      width: double.infinity,
                      height: 70,
                      child: ElevatedButton(
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text('Process Completed!')));
                        },
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(0)),
                            backgroundColor:
                                const Color.fromARGB(255, 1, 7, 116)),
                        child: const Text(
                          'CONTINUE',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      )),
                ),
              ]),
            ),
          ]),
        )));
  }
}
