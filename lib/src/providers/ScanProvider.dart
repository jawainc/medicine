import 'package:flutter/foundation.dart';
import 'package:vibration/vibration.dart';

enum ScanText { Yes, No }

enum ExitScan { Yes, No }

enum ScanReady { Yes, No }

class ScanProvider with ChangeNotifier {
  ScanText _scanText = ScanText.No;
  ExitScan _exitScan = ExitScan.No;
  String _resultText = "";

  ScanText get scanText => _scanText;
  ExitScan get exitScan => _exitScan;
  bool get hasText => _resultText.isNotEmpty;
  String get resultText => _resultText;

  set scanText(ScanText status) {
    _scanText = status;
    notifyListeners();
  }

  set exitScan(ExitScan status) {
    _exitScan = status;
    notifyListeners();
  }

  set resultText(String text) {
    if (text.isNotEmpty) {
      _resultText = text;
      _scanText = ScanText.No;
      _vibrate();
      notifyListeners();
    }
  }

  Future<void> _vibrate() async {
    bool vib = await Vibration.hasVibrator();
    if (vib) {
      Vibration.vibrate();
    }
  }
}
