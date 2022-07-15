
class User {
  String username;
  String password;

  User({required this.username, required this.password});

  User copyWith({
    String? username,
    String? password,
  }) {
    return User(
      username: username ?? this.username,
      password: password ?? this.password,
    );
  }

  factory User.fromMap(Map<String, dynamic> json) => new User(
    username: json["username"],
    password: json["password"]
  );

  Map<String, dynamic> toMap() => {
    "username": username,
    "password": password
  };

  isValidUsername() {
    if (username.isNotEmpty) return true;
  }

  isValidPassword() {
    if (password.isNotEmpty && password.length >= 6) return true;
  }

}


// User userFromJson(String s){
//   final jsonData = json.decode(s);
//   return User.fromMap(jsonData);
// }
//
// String userToJson(User user){
//   final jsonData = user.toMap();
//   return json.encode(jsonData);
// }
