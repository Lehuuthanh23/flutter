class Member {
  String us;
  String token;
  Member(this.us, this.token);
  Member.fromJson(
      Map<String, dynamic>
          json) //Lớp có phương thức "fromjson" nhận vào một đối tượng
      //JSON dưới dạng map<string, dynamic>, và sử dụng nó
      //để khởi tạo giá trị cho "us" và "token".
      : us = json['username'],
        token = json['password'];

  Map<String, dynamic> toJson() => {
        // Lớp có phương thức "tojson" trả về một đối tượng JSON
        //dưới dạng map<string, dynamic> với các thuộc tính "us" và "token".
        'username': us,
        'password': token
      };
}
/*Mục đích của đoạn code là định nghĩa một cấu trúc dữ liệu "member" để lưu trữ 
thông tin người dùng, và cung cấp các phương thức để tạo và chuyển đổi dữ liệu 
thành đối tượng JSON.*/