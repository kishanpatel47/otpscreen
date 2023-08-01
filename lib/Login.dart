import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:quiver/async.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final double width = 1020 / 2;
  TextEditingController _mobile = new TextEditingController();
  // int _timerSeconds = 30; // Total seconds for the timer

  // Timer? _timer;

  // @override
  // void initState() {
  //   super.initState();
  //   startTimer();
  // }

  // @override
  // void dispose() {
  //   _timer?.cancel();
  //   super.dispose();
  // }

  // void startTimer() {
  //   _timer = Timer.periodic(Duration(), (timer) {
  //     if (_timerSeconds > 0) {
  //       setState(() {
  //         _timerSeconds--;
  //       });
  //     } else if (_timerSeconds > 0) {
  //       setState(() {
  //         _timerSeconds--;
  //       });
  //     } else {
  //       setState(() {
  //         _timer?.cancel();
  //       });
  //     }
  //   });
  // }

  // void resendOtp() {
  //   // Implement your resend OTP logic here
  //   // This method will be called when the user taps on the resend OTP button
  //   setState(() {
  //     _timerSeconds = 30; // Reset the timer
  //     startTimer(); // Start the timer again
  //   });
  // }

  // void verifyOtp(String otp) {
  //   // Implement your OTP verification logic here
  //   // This method will be called when the user taps on the verify OTP button
  // }

  int otpTimer = 60;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    startDialogTimer();
  }

  // void startTimer() {
  //   const oneSec = Duration(seconds: 1);
  //   _timer = Timer.periodic(
  //     oneSec,
  //     (Timer timer) {
  //       setState(() {
  //         if (otpTimer < 1) {
  //           timer.cancel();
  //         } else {
  //           otpTimer -= 1;
  //         }
  //       });
  //     },
  //   );
  // }

  void startDialogTimer() {
    const oneSec = Duration(seconds: 1);
    Timer.periodic(
      oneSec,
      (Timer timer) {
        setState(() {
          if (otpTimer < 1) {
            timer.cancel();
          } else {
            otpTimer -= 1;
          }
        });
      },
    );
  }

  @override
  validationmobile(int timerSeconds) {
    if (_mobile.text.isEmpty) {
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: const Text("Email Alert"),
          content: const Text("Please Enter the Email"),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(ctx).pop();
              },
              child: Container(
                color: Colors.green,
                padding: const EdgeInsets.all(14),
                child: const Text(
                  "okay",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      );
      print(timerSeconds);
    } else if (otpTimer > 0) {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return Dialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)),
              //this right here
              child: Container(
                height: 300,
                width: double.infinity,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(
                              horizontal: 12, vertical: 10),
                          child: Text(
                            'Verify OTP',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Container(
                              margin: EdgeInsets.only(right: 10),
                              child: Image(
                                  color: Colors.red,
                                  image:
                                      AssetImage('assets/images/cancel.png'))),
                        ),

                        // Align(
                        //   alignment: Alignment.topRight,
                        //   child: Container(
                        //     alignment: Alignment.topRight,
                        //     child: Align(
                        //       alignment: Alignment.topRight,
                        //       child: Image(
                        //           image:
                        //               AssetImage('assets/images/cancel.png')),
                        //     ),
                        //   ),
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.all(10),
                      child: Text(
                        'Please enter the 4 digit code received in your registered mobile to reset your password ',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(
                            height: 68,
                            width: 64,
                            child: TextField(
                              onChanged: (value) {
                                if (value.length == 1) {
                                  FocusScope.of(context).nextFocus();
                                }
                              },
                              style: Theme.of(context).textTheme.headline6,
                              keyboardType: TextInputType.number,
                              textAlign: TextAlign.center,
                              decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 1,
                                      color: Colors.black), //<-- SEE HERE
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 1,
                                      color: Colors.black), //<-- SEE HERE
                                ),
                              ),
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(1),
                                FilteringTextInputFormatter.digitsOnly
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 68,
                            width: 64,
                            child: TextField(
                              onChanged: (value) {
                                if (value.length == 1) {
                                  FocusScope.of(context).nextFocus();
                                }
                              },
                              style: Theme.of(context).textTheme.headline6,
                              keyboardType: TextInputType.number,
                              textAlign: TextAlign.center,
                              decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 1,
                                      color: Colors.black), //<-- SEE HERE
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 1,
                                      color: Colors.black), //<-- SEE HERE
                                ),
                              ),
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(1),
                                FilteringTextInputFormatter.digitsOnly
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 68,
                            width: 64,
                            child: TextField(
                              onChanged: (value) {
                                if (value.length == 1) {
                                  FocusScope.of(context).nextFocus();
                                }
                              },
                              style: Theme.of(context).textTheme.headline6,
                              keyboardType: TextInputType.number,
                              textAlign: TextAlign.center,
                              decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 1,
                                      color: Colors.black), //<-- SEE HERE
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 1,
                                      color: Colors.black), //<-- SEE HERE
                                ),
                              ),
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(1),
                                FilteringTextInputFormatter.digitsOnly
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 68,
                            width: 64,
                            child: TextField(
                              onChanged: (value) {
                                if (value.length == 1) {
                                  FocusScope.of(context).nextFocus();
                                }
                              },
                              style: Theme.of(context).textTheme.headline6,
                              keyboardType: TextInputType.number,
                              textAlign: TextAlign.center,
                              decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 1,
                                      color: Colors.black), //<-- SEE HERE
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 1,
                                      color: Colors.black), //<-- SEE HERE
                                ),
                              ),
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(1),
                                FilteringTextInputFormatter.digitsOnly
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Container(
                          margin: EdgeInsets.only(left: 19, top: 2),
                          child: Text('Resend OTP ${otpTimer}'),
                        ),
                      ),
                    ),
                    // Expanded(

                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Expanded(
                        child: Container(
                          padding: EdgeInsets.all(20),
                          width: 250,
                          margin: EdgeInsets.only(top: 10),
                          decoration: BoxDecoration(
                            color: Colors.blueAccent,
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            'Verify',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            );
          });
    }
  }

  @override
  Widget Loginandregister() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          alignment: Alignment.center,
          width: width,
          decoration: BoxDecoration(),
          child: TextField(
            inputFormatters: [
              LengthLimitingTextInputFormatter(10),
            ],
            keyboardType: TextInputType.number,
            controller: _mobile,
            decoration:
                InputDecoration(hintText: 'Enter the Mobile number${otpTimer}'),
          ),
        ),
        TextButton(
          onPressed: () {
            validationmobile(otpTimer);
          },
          child: Container(
            color: Color.fromARGB(255, 89, 0, 255),
            margin: EdgeInsets.all(width / 8),
            padding: EdgeInsets.symmetric(horizontal: 100, vertical: 20),
            child: Text(
              'Submit ',
              style: TextStyle(color: Colors.white),
            ),
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            body: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[Loginandregister()],
    )));
  }
}
