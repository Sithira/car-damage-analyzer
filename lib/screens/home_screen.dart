import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tstr/screens/camera_screen.dart';
import 'package:flutter_tstr/screens/results_screen.dart';
import 'package:path/path.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeScreen();
  }
}

class _HomeScreen extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    FilePickerResult result;
    return Container(
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                alignment: Alignment.center,
                height: MediaQuery.of(context).size.height / 2,
                child: Text(
                  'Car Damage Analyzer',
                  style: TextStyle(fontSize: 30.0),
                ),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                child: ButtonBar(
                  children: [
                    RaisedButton(
                        child: Text('Using Camera'),
                        onPressed: () => {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => CameraScreen()))
                            }),
                    RaisedButton(
                        child: Text('Using Photos'),
                        onPressed: () async => {
                              result = await FilePicker.platform.pickFiles(
                                  type: FileType.custom,
                                  allowedExtensions: ['jpg', 'png', 'jpeg']),

                          getFileInfo(result),

                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => ResultScreen(
                                      imageKey: result.files.first.name,
                                      imagePath: result.files.first.path)))
                              // getFileInfo(result)
                            })
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  getFileInfo(FilePickerResult result) {
    PlatformFile file = result.files.first;

    print(file.name);
    print(file.bytes);
    print(file.size);
    print(file.extension);
    print(file.path);
  }
}
