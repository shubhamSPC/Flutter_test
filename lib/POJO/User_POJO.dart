class User_Pojo{
  String id;
  String email;
  String first_name;
  String last_name;
  String avatar;

  User_Pojo(this.id, this.email, this.first_name, this.last_name, this.avatar);
  // factory User_Pojo.fromJson(dynamic json) {
  //   return User_Pojo(
  //       id: json['id'],
  //       email: json['email'],
  //       first_name: json['first_name'],
  //       last_name: json['last_name'],
  //       avatar: json['avatar']);
  // }
}