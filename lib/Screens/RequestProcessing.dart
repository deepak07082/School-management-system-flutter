import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'LoginPage.dart';

class ProcessingRequest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text:
                        'YOUR USERNAME AND PASSWORD IS SENT TO YOUR MAIL PLEASE CHECK YOUR EMAIL!',
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                  TextSpan(
                    text: 'Click Here..',
                    style: TextStyle(
                      color: Colors.blue,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (BuildContext context) => MyHomePage(),
                          ),
                        );
                      },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
