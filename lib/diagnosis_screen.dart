import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class DiagnosisScreen extends StatefulWidget {
  @override
  State<DiagnosisScreen> createState() => _DiagnosisScreen();
}

class _DiagnosisScreen extends State<DiagnosisScreen> {
  File _image;

  Future getImage(bool isCamera) async {
    XFile image;
    if (isCamera) {
      image = await ImagePicker().pickImage(source: ImageSource.camera);
    } else {
      image = await ImagePicker().pickImage(source: ImageSource.gallery);
    }
    File file = File(image.path);
    setState(() {
      _image = file;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Diagnosis'),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: 300,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: Theme.of(context).accentColor),
                onPressed: () {
                  getImage(true);
                },
                child: Text('Camera'),
              ),
            ),
            Container(
              width: 300,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: Theme.of(context).accentColor),
                onPressed: () {
                  getImage(false);
                },
                child: Text('Gallery'),
              ),
            ),
            Container(
              width: 300,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: Theme.of(context).accentColor),
                onPressed: () {},
                child: Text('Submit'),
              ),
            ),
            _image == null
                ? Container()
                : Image.file(
                    _image,
                    height: 300.0,
                    width: 300.0,
                  ),
          ],
        ),
      ),
    );
  }
}
