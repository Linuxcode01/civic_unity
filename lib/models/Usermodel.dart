class User{
  int? id;
  String? name;
  String? email;
  String? pass;
  bool? driver;
  String? avatar;

  User({this.id, this.name, this.email, this.pass, this.avatar, this.driver});

  User.fromJson(Map<String, dynamic> json){
    id = json['id'];
    name = json['name'];
    email = json['email'];
    pass = json['pass'];
    driver = json['driver'];
    avatar = json['avatar'];
  }
}