import 'package:flutter/material.dart';
import 'package:firebase_ml_vision/firebase_ml_vision.dart';
import 'package:flutter_camera_ml_vision/flutter_camera_ml_vision.dart';
import 'package:provider/provider.dart';

import 'package:medicine_scheduler/src/providers/ScanProvider.dart';
import 'package:medicine_scheduler/src/resources/Constants.dart';
import 'package:medicine_scheduler/src/arguments/SaveMedicineArguments.dart';

class ScanPage extends StatefulWidget {
  @override
  _ScanPageState createState() => _ScanPageState();
}

class _ScanPageState extends State<ScanPage> {
  bool resultSent = false;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          builder: (_) => ScanProvider(),
        )
      ],
      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: <Widget>[
              Consumer<ScanProvider>(
                builder: (context, scanProvider, _) {
                  return SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height / 3,
                    child: CameraMlVision<VisionText>(
                      detector:
                          FirebaseVision.instance.textRecognizer().processImage,
                      onResult: (VisionText visionText) {
                        if (scanProvider.scanText == ScanText.Yes) {
                          scanProvider.resultText = visionText.text;
                        }
                        if (scanProvider.exitScan == ExitScan.Yes) {
                          Navigator.of(context).pop<VisionText>(visionText);
                        }

                        return;
                      },
                    ),
                  );
                },
              ),
              Expanded(
                child: Consumer<ScanProvider>(
                  builder: (context, scanProvider, _) {
                    return Column(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            RaisedButton(
                              child: Text('Scan'),
                              onPressed: () {
                                scanProvider.scanText = ScanText.Yes;
                              },
                            ),
                            RaisedButton(
                              child: Text('Save'),
                              onPressed: scanProvider.hasText
                              ? () {
                                Navigator.pushReplacementNamed(
                                  context, 
                                  kSaveMedicinePath, 
                                  arguments: SaveMedicineArguments(scanProvider.resultText),
                                  );
                              }
                              : null,
                            ),
                            RaisedButton(
                              child: Text('Exit'),
                              onPressed: () {
                                scanProvider.exitScan = ExitScan.Yes;
                              },
                            ),
                          ],
                        ),
                        Text(scanProvider.resultText),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
