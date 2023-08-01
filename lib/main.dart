import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';

class OTPScreen extends StatefulWidget {
  @override
  _OTPScreenState createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  int otpTimer = 120;
  Timer? _timer;
  final double width = 1020 / 2;
  TextEditingController _mobile = new TextEditingController();
  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void restartTimer() {
    setState(() {
      otpTimer = 120;
    });
    startTimer();
  }

  void startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(
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

  void openAlertDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return TimerDialog(
          timerValue: otpTimer,
          restartTimer: restartTimer,
        );
      },
    ).then((_) {
      _timer?.cancel(); // Cancel the timer after the dialog is closed
    });
  }

  validatemobile() {
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
    } else {
      openAlertDialog();
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
            decoration: InputDecoration(hintText: 'Enter the Mobile number'),
          ),
        ),
        TextButton(
          onPressed: () {
            validatemobile();
          },
          child: Container(
            color: Color.fromARGB(255, 89, 0, 255),
            padding: EdgeInsets.symmetric(horizontal: 100, vertical: 15),
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
    return Scaffold(
      appBar: AppBar(
        title: Text('OTP Timer'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SingleChildScrollView(
                physics: const NeverScrollableScrollPhysics(),
                child: Loginandregister()),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}

class TimerDialog extends StatefulWidget {
  final int timerValue;
  final VoidCallback restartTimer;
  TimerDialog({required this.timerValue, required this.restartTimer});

  @override
  _TimerDialogState createState() => _TimerDialogState();
}

class _TimerDialogState extends State<TimerDialog> {
  late int currentTimerValue;
  late var minutes;
  late var seconds;
  var otpvaildate = '1234';
  String enteredOTP = '';
  List<TextEditingController> _otpControllers = [];

  @override
  void initState() {
    super.initState();
    currentTimerValue = widget.timerValue;
    for (int i = 0; i < 4; i++) {
      _otpControllers.add(TextEditingController());
    }
    startDialogTimer();
  }

  String getFormattedDuration() {
    minutes = currentTimerValue ~/ 60;
    seconds = currentTimerValue % 60;

    String minutesStr = minutes.toString().padLeft(2, '0');
    String secondsStr = seconds.toString().padLeft(2, '0');

    return '$minutesStr:$secondsStr';
  }

  void validateotp() {
    if (enteredOTP == otpvaildate) {
      // Correct OTP entered
      setState(() {
        enteredOTP = '';
      });
    } else {
      // Wrong OTP entered
      setState(() {});
    }
  }

  void startDialogTimer() {
    const oneSec = Duration(seconds: 1);
    Timer.periodic(
      oneSec,
      (Timer timer) {
        setState(() {
          if (currentTimerValue < 1) {
            timer.cancel();
          } else {
            currentTimerValue -= 1;
          }
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        height: 350,
        width: double.infinity,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                  child: Text(
                    'Verify OTP',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
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
                      image: AssetImage('assets/images/cancel.png'),
                    ),
                  ),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: Text(
                'Please enter the 4 digit code received in your registered mobile to reset your password ',
                style: TextStyle(color: Colors.black),
              ),
            ),
            if (enteredOTP == otpvaildate)
              Text(
                'Correct OTP entered',
                style: TextStyle(color: Colors.green),
              ),
            if (enteredOTP.isNotEmpty && enteredOTP != otpvaildate)
              Text(
                'Wrong OTP ',
                style: TextStyle(color: Colors.red),
              ),
            Container(
              margin: EdgeInsets.only(top: 10, right: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  for (int i = 0; i < 4; i++)
                    SizedBox(
                      height: 68,
                      width: 64,
                      child: TextField(
                        onChanged: (value) {
                          if (value.length == 1) {
                            if (i < 3) {
                              FocusScope.of(context).nextFocus();
                            } else {
                              FocusScope.of(context).unfocus();
                            }
                          } else if (value.length == 0) {
                            if (i > 0) {
                              FocusScope.of(context).previousFocus();
                            }
                          }
                          setState(() {
                            // Store entered OTP
                            enteredOTP = '';
                            for (int j = 0; j <= i; j++) {
                              enteredOTP += _otpControllers[j].text;
                            }
                          });
                        },
                        style: Theme.of(context).textTheme.headline6,
                        controller: _otpControllers[i],
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              width: 1,
                              color: enteredOTP.length > i
                                  ? (enteredOTP[i] == otpvaildate[i]
                                      ? Colors.green
                                      : Colors.red)
                                  : Colors.black,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              width: 1,
                              color: enteredOTP.length > i
                                  ? (enteredOTP[i] == otpvaildate[i]
                                      ? Colors.green
                                      : Colors.red)
                                  : Colors.black,
                            ),
                          ),
                        ),
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(1),
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                      ),
                    ),
                ],
              ),
            ),
            if (currentTimerValue == 0)
              TextButton(
                onPressed: () {
                  widget.restartTimer();
                  setState(() {
                    currentTimerValue = widget.timerValue;
                  });
                },
                child: Text('Resend'),
              )
            else
              TextButton(
                onPressed: () {},
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Container(
                    margin: EdgeInsets.only(left: 19, top: 2),
                    child: Text('Resend OTP ${getFormattedDuration()}'),
                  ),
                ),
              ),
            TextButton(
              onPressed: () {
                validateotp();
              },
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
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: OTPScreen(),
  ));
}
