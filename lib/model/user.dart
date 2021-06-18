
class User {
  int userId;
  String userName;
  String password;
  String fullName;


  User(this.userId,
      this.userName,
      this.password,
      this.fullName);

  factory User.fromJson(dynamic json) {
    return User(
        json['id'],
        json['username'],
        json['password'],
        json['fullName']

    );
  }


}
