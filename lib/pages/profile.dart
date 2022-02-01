import 'dart:io';

import 'package:stylish_dialog/stylish_dialog.dart';
import 'package:pointi/pages/widgets/app_button.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'home.dart';
import 'dart:math' as math;

class Profile extends StatelessWidget {
  Profile(this.username, {Key key, this.imagePath}) : super(key: key);
  final String username;
  final String imagePath;

  var moonLanding = new DateTime.now().toString();
  @override
  Widget build(BuildContext context) {
    final double mirror = math.pi;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.black,
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: FileImage(File(imagePath)),
                      ),
                    ),
                    margin: EdgeInsets.all(20),
                    width: 50,
                    height: 50,
                    // child: Transform(
                    //     alignment: Alignment.center,
                    //     child: FittedBox(
                    //       fit: BoxFit.cover,
                    //       child: Image.file(File(imagePath)),
                    //     ),
                    //     transform: Matrix4.rotationY(mirror)),
                  ),
                  Text(
                    'Hi ' + username.toUpperCase() + '!',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.all(20),
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Color(0xFFFEFFC1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.history),
                      onPressed: () {
                        StylishDialog(
                          context: context,
                          alertType: StylishDialogType.NORMAL,
                          titleText: '  Pointer List ',
                          contentText: '$moonLanding',
                        ).show();
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      '''Welcome  ${username.toUpperCase()}''',
                      style: TextStyle(fontSize: 16),
                      textAlign: TextAlign.left,
                    ),
                    Divider(
                      height: 30,
                    ),
                    AppButton(
                      text: "PRESENT",
                      onPressed: () {
                        StylishDialog(
                          context: context,
                          alertType: StylishDialogType.NORMAL,
                          titleText: '  Pointer is valid at ',
                          contentText: '$moonLanding',
                        ).show();
                      },
                      icon: Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                      color: Colors.green,
                    ),
                  ],
                ),
              ),
              Spacer(),
              AppButton(
                text: "LOG OUT",
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MyHomePage()),
                  );
                },
                icon: Icon(
                  Icons.logout,
                  color: Colors.white,
                ),
                color: Color(0xFFFF6161),
              ),
              SizedBox(
                height: 20,
              )
            ],
          ),
        ),
      ),
    );
  }
}
