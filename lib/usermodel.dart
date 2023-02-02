class UserModel {
  String? uid;
  String? username;
  String? email;
  String? profilepic;
  UserModel(
      {required this.email,
      required this.uid,
      required this.username,
      required this.profilepic});
  UserModel.toMap(Map<String, dynamic> map) {
    uid:
    map["uid"];
    username:
    map["username"];
    email:
    map["email"];
    profilepic:
    map["profilepic"];
  }
  Map<String, dynamic> toMap() {
    return {
      "uid": uid,
      "username": username,
      "email": email,
      "profilepic": profilepic
    };
  }
}
