import 'dart:io';
import 'package:path_provider/path_provider.dart';

class CounterReader {
  Future<String> get localPath async {
    final Directory path = await getApplicationDocumentsDirectory();
    print(path.path);
    return path.path;
  }

  Future<File> get localFile async {
    final p = await localPath;
    print('$p/counter.txt');
    return File('$p/counter.txt');
  }

  Future<int> readCounter() async {
    try {
      final f = await localFile;
      String s = await f.readAsString();
      return int.parse(s);
    } catch (e) {
      return 0;
    }
  }

  Future<File> writeCounter(int counter) async {
    final f = await localFile;
    return f.writeAsString('$counter');
  }
}
