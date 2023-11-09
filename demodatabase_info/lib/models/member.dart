class Member {
  String us;
  String token;
  Member(this.us, this.token);
  Member.fromJson(Map<String, dynamic> json)
      : us = json['username'],
        token = json['password'];
       Map<String, dynamic>  toJson()=>{
        'username': us,
        'password': token
       };
}
