import 'dart:io';
import 'package:path/path.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:async/async.dart';

class DiagnosisScreen extends StatefulWidget {
  static const String routeName = '/diagnosis-screen';

  @override
  State<DiagnosisScreen> createState() => _DiagnosisScreen();
}

class _DiagnosisScreen extends State<DiagnosisScreen> {
  String validation = '';
  File _image;
  var result;

  Future getImage(bool isCamera) async {
    XFile image;
    if (isCamera) {
      image = await ImagePicker().pickImage(source: ImageSource.camera);
    } else {
      image = await ImagePicker().pickImage(source: ImageSource.gallery);
    }
    File file = File(image.path);
    print(file);
    setState(() {
      _image = file;
    });
  }

  uploadImage(File imageFile) async {
    var stream =
        new http.ByteStream(DelegatingStream.typed(imageFile.openRead()));
    // get file length
    var length = await imageFile.length();

    // string to uri
    var uri = Uri.parse("http://10.113.63.96:5000/hello");

    // create multipart request
    var request = new http.MultipartRequest("POST", uri);

    // multipart that takes file
    var multipartFile = new http.MultipartFile('file', stream, length,
        filename: basename(imageFile.path));

    // add file to multipart
    request.files.add(multipartFile);

    // send
    var response = await request.send();
    print(response.statusCode);

    // listen for response
    response.stream.transform(utf8.decoder).listen((value) {
      setState(() {
        result = value;
      });

      print(value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: 300,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(primary: Colors.teal),
                onPressed: () {
                  getImage(true);
                  setState(() {
                    validation = '';
                  });
                },
                child: Text('Camera'),
              ),
            ),
            Container(
              width: 300,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(primary: Colors.amber),
                onPressed: () {
                  getImage(false);
                  setState(() {
                    validation = '';
                  });
                },
                child: Text('Gallery'),
              ),
            ),
            Container(
              width: 300,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(primary: Colors.redAccent),
                onPressed: () => uploadImage(_image),
                child: Text('Submit'),
              ),
            ),
            Text(
              validation,
              style: TextStyle(color: Colors.red),
            ),
            result == null
                ? Container()
                : Text(
                    result == '0' ? 'Normal' : 'Pnemonia',
                    style: TextStyle(
                      fontSize: 30,
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
