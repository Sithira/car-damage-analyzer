import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ResultScreen extends StatefulWidget {
  final String imageKey;
  final String imagePath;

  ResultScreen({this.imageKey, this.imagePath});

  @override
  State<StatefulWidget> createState() {
    return _ResultScreen();
  }
}

class _ResultScreen extends State<ResultScreen> {
  @override
  Widget build(BuildContext context) {
    String description = '';
    switch (widget.imageKey) {
      case 'img_001.jpg':
        description = 'Damage Location: Side\nDamage Severity: Minor damage';
        break;
      case 'img_002.jpg':
        description = 'Damage Location: Front\nDamage Severity: Major Damage';
        break;
      case 'img_003.jpg':
        description = 'Damage Location: Front\nDamage Severity: Moderate damage';
        break;
      default:
        description = 'Could not identify image';
        break;

    }
    return Container(
        padding: EdgeInsets.only(top: 50.0),
        color: Colors.white,
        child: Column(
          children: [
            Card(
              clipBehavior: Clip.antiAlias,
              child: Column(
                children: [
                  ListTile(
                    title:
                        Text('Analysis Report', style: TextStyle(fontSize: 30)),
                    subtitle: Text(
                      'For image: ' + widget.imageKey,
                      style: TextStyle(color: Colors.black.withOpacity(0.6)),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(description, textAlign: TextAlign.left, style: TextStyle(color: Colors.black.withOpacity(0.6),),
                    ),
                  ),
                  Padding(
                    child: Image.file(new File(widget.imagePath), width: MediaQuery.of(context).size.width/2,),
                    padding: EdgeInsets.all(10),
                  ),
                  ButtonBar(
                    alignment: MainAxisAlignment.start,
                    children: [
                      OutlineButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text('Ok !'),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
