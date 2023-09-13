class UserLogin {
  String? userName;
  String? password;

  UserLogin({required this.userName, required this.password});

  Map<String, dynamic> toJson() {
    return {
      'username': userName,
      'password': password,
    };
  }
}
