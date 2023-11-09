import 'dart:io';
import 'package:path_provider/path_provider.dart';

class CounterReader {
  static Future<String> get _localPath async {
    final Directory path = await getApplicationDocumentsDirectory();
    
    return path.path;
  }

  static Future<File> get _localFile async {
    final p = await _localPath;
    print("$p/counter.txt");
    return File("$p/counter.txt");
  }

  static Future<String> readCounter() async {
    try {
      final f = await _localFile;
      String s = await f.readAsString();
      return s;
    } catch (e) {
      return '0';
    }
  }

  static Future<File> writeCounter(String counter) async {
    final f = await _localFile;
    return f.writeAsString(counter);
  }
}
