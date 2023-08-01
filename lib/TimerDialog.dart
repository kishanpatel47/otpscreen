// import 'dart:async';

// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';

// class TimerDialog extends StatefulWidget {
//   final int timerValue;

//   TimerDialog({required this.timerValue});

//   @override
//   _TimerDialogState createState() => _TimerDialogState();
// }

// class _TimerDialogState extends State<TimerDialog> {
//   late int currentTimerValue;

//   @override
//   void initState() {
//     super.initState();
//     currentTimerValue = widget.timerValue;
//     startDialogTimer();
//   }

//   void startDialogTimer() {
//     const oneSec = Duration(seconds: 1);
//     Timer.periodic(
//       oneSec,
//       (Timer timer) {
//         setState(() {
//           if (currentTimerValue < 1) {
//             timer.cancel();
//           } else {
//             currentTimerValue -= 1;
//           }
//         });
//       },
//     );
//   }

//   showdialog() {
//     showDialog(
//         context: context,
//         builder: (BuildContext context) {
//           return Dialog(
//             shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(10.0)),
//             //this right here
//             child:
// Container(
//               height: 300,
//               width: double.infinity,
//               child: Column(
//                 children: [
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Container(
//                         margin:
//                             EdgeInsets.symmetric(horizontal: 12, vertical: 10),
//                         child: Text(
//                           'Verify OTP',
//                           style: TextStyle(
//                               fontWeight: FontWeight.bold, fontSize: 18),
//                         ),
//                       ),
//                       TextButton(
//                         onPressed: () {
//                           Navigator.of(context).pop();
//                         },
//                         child: Container(
//                             margin: EdgeInsets.only(right: 10),
//                             child: Image(
//                                 color: Colors.red,
//                                 image: AssetImage('assets/images/cancel.png'))),
//                       ),

//                       // Align(
//                       //   alignment: Alignment.topRight,
//                       //   child: Container(
//                       //     alignment: Alignment.topRight,
//                       //     child: Align(
//                       //       alignment: Alignment.topRight,
//                       //       child: Image(
//                       //           image:
//                       //               AssetImage('assets/images/cancel.png')),
//                       //     ),
//                       //   ),
//                     ],
//                   ),
//                   Container(
//                     margin: EdgeInsets.all(10),
//                     child: Text(
//                       'Please enter the 4 digit code received in your registered mobile to reset your password ',
//                       style: TextStyle(color: Colors.black),
//                     ),
//                   ),
//                   Container(
//                     margin: EdgeInsets.only(top: 10),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                       children: [
//                         SizedBox(
//                           height: 68,
//                           width: 64,
//                           child: TextField(
//                             onChanged: (value) {
//                               if (value.length == 1) {
//                                 FocusScope.of(context).nextFocus();
//                               }
//                             },
//                             style: Theme.of(context).textTheme.headline6,
//                             keyboardType: TextInputType.number,
//                             textAlign: TextAlign.center,
//                             decoration: InputDecoration(
//                               focusedBorder: OutlineInputBorder(
//                                 borderSide: BorderSide(
//                                     width: 1,
//                                     color: Colors.black), //<-- SEE HERE
//                               ),
//                               enabledBorder: OutlineInputBorder(
//                                 borderSide: BorderSide(
//                                     width: 1,
//                                     color: Colors.black), //<-- SEE HERE
//                               ),
//                             ),
//                             inputFormatters: [
//                               LengthLimitingTextInputFormatter(1),
//                               FilteringTextInputFormatter.digitsOnly
//                             ],
//                           ),
//                         ),
//                         SizedBox(
//                           height: 68,
//                           width: 64,
//                           child: TextField(
//                             onChanged: (value) {
//                               if (value.length == 1) {
//                                 FocusScope.of(context).nextFocus();
//                               }
//                             },
//                             style: Theme.of(context).textTheme.headline6,
//                             keyboardType: TextInputType.number,
//                             textAlign: TextAlign.center,
//                             decoration: InputDecoration(
//                               focusedBorder: OutlineInputBorder(
//                                 borderSide: BorderSide(
//                                     width: 1,
//                                     color: Colors.black), //<-- SEE HERE
//                               ),
//                               enabledBorder: OutlineInputBorder(
//                                 borderSide: BorderSide(
//                                     width: 1,
//                                     color: Colors.black), //<-- SEE HERE
//                               ),
//                             ),
//                             inputFormatters: [
//                               LengthLimitingTextInputFormatter(1),
//                               FilteringTextInputFormatter.digitsOnly
//                             ],
//                           ),
//                         ),
//                         SizedBox(
//                           height: 68,
//                           width: 64,
//                           child: TextField(
//                             onChanged: (value) {
//                               if (value.length == 1) {
//                                 FocusScope.of(context).nextFocus();
//                               }
//                             },
//                             style: Theme.of(context).textTheme.headline6,
//                             keyboardType: TextInputType.number,
//                             textAlign: TextAlign.center,
//                             decoration: InputDecoration(
//                               focusedBorder: OutlineInputBorder(
//                                 borderSide: BorderSide(
//                                     width: 1,
//                                     color: Colors.black), //<-- SEE HERE
//                               ),
//                               enabledBorder: OutlineInputBorder(
//                                 borderSide: BorderSide(
//                                     width: 1,
//                                     color: Colors.black), //<-- SEE HERE
//                               ),
//                             ),
//                             inputFormatters: [
//                               LengthLimitingTextInputFormatter(1),
//                               FilteringTextInputFormatter.digitsOnly
//                             ],
//                           ),
//                         ),
//                         SizedBox(
//                           height: 68,
//                           width: 64,
//                           child: TextField(
//                             onChanged: (value) {
//                               if (value.length == 1) {
//                                 FocusScope.of(context).nextFocus();
//                               }
//                             },
//                             style: Theme.of(context).textTheme.headline6,
//                             keyboardType: TextInputType.number,
//                             textAlign: TextAlign.center,
//                             decoration: InputDecoration(
//                               focusedBorder: OutlineInputBorder(
//                                 borderSide: BorderSide(
//                                     width: 1,
//                                     color: Colors.black), //<-- SEE HERE
//                               ),
//                               enabledBorder: OutlineInputBorder(
//                                 borderSide: BorderSide(
//                                     width: 1,
//                                     color: Colors.black), //<-- SEE HERE
//                               ),
//                             ),
//                             inputFormatters: [
//                               LengthLimitingTextInputFormatter(1),
//                               FilteringTextInputFormatter.digitsOnly
//                             ],
//                           ),
//                         )
//                       ],
//                     ),
//                   ),
//                   TextButton(
//                     onPressed: () {},
//                     child: Align(
//                       alignment: Alignment.topLeft,
//                       child: Container(
//                         margin: EdgeInsets.only(left: 19, top: 2),
//                         child: Text('Resend OTP '),
//                       ),
//                     ),
//                   ),
//                   // Expanded(

//                   TextButton(
//                     onPressed: () {
//                       Navigator.of(context).pop();
//                     },
//                     child: Expanded(
//                       child: Container(
//                         padding: EdgeInsets.all(20),
//                         width: 250,
//                         margin: EdgeInsets.only(top: 10),
//                         decoration: BoxDecoration(
//                           color: Colors.blueAccent,
//                         ),
//                         alignment: Alignment.center,
//                         child: Text(
//                           'Verify',
//                           style: TextStyle(color: Colors.white),
//                         ),
//                       ),
//                     ),
//                   )
//                 ],
//               ),
//             ),
//           );
//         });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return showdialog();
//   }
// }
import 'dart:async';

import 'package:flutter/material.dart';

class TimerDialog extends StatefulWidget {
  final int timerValue;

  TimerDialog({required this.timerValue});

  @override
  _TimerDialogState createState() => _TimerDialogState();
}

class _TimerDialogState extends State<TimerDialog> {
  late int currentTimerValue;

  @override
  void initState() {
    super.initState();
    currentTimerValue = widget.timerValue;
    startDialogTimer();
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
    return AlertDialog(
      title: Text('OTP Timer'),
      content: Text('Time remaining: $currentTimerValue seconds'),
      actions: <Widget>[
        TextButton(
          child: Text('Close'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}
