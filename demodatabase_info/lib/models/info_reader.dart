import 'dart:convert';
import 'dart:io';

import 'package:demodatabase_info/models/member.dart';
import 'package:path_provider/path_provider.dart';

class InfoReader {
  Future<String> get localPath async {
    final pathInfo = await getApplicationDocumentsDirectory();
    return pathInfo.path;
  }

  Future<File> get localFile async {
    final p = await localPath;
    return File('$p/info.data');
  }

  Future<Member> getInfo() async {
    String s = "";
    try {
      final f = await localFile;
      s = await f.readAsString();
      Map<String, dynamic> sInfo = jsonDecode(s);
      return Member.fromJson(sInfo);
    } catch (e) {
      return Member('', '');
    }
  }

  Future<File> saveInfo(Member mem) async {
    final f = await localFile;
    String memJson = jsonEncode(mem.toJson());
    return f.writeAsString(memJson);
  }
}
