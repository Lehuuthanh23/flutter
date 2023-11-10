import 'dart:convert';
import 'dart:io';

import 'package:demodatabase_info/models/member.dart';
import 'package:path_provider/path_provider.dart';

class InfoReader {
  /*được thực hiện bất đồng bộ (async) và trả về một tương lai (future) kiểu dữ liệu string.*/
  Future<String> get localPath async {
    final pathInfo = await getApplicationDocumentsDirectory();
    return pathInfo.path;
  }

/*được thực hiện bất đồng bộ (async) và trả về một tương lai (future) kiểu dữ liệu File.*/
/*lấy đường dẫn tới thư mục localpath (được truy cập bất đồng bộ) và sử dụng đường dẫn này
 để tạo một đối tượng file với đường dẫn là '$p/info.data' */
  Future<File> get localFile async {
    final p = await localPath;
    return File('$p/info.data');
  }

  Future<Member> getInfo() async {
    String s = "";
    try {
      final f = await localFile;
      s = await f.readAsString();
      Map<String, dynamic> sInfo = jsonDecode(s); // chuyển chuỗi thành Json
      return Member.fromJson(sInfo);// chuyển Json thành Member
    } catch (e) {
      return Member('', '');
    }
  }

  Future<File> saveInfo(Member mem) async {
    final f = await localFile;
    String memJson = jsonEncode(mem.toJson()); //chuyển member thành chuỗi Json
    return f.writeAsString(memJson);
  }
}
