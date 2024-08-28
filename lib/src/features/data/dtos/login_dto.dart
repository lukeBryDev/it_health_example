class LoginDTO {
  final String user;
  final String password;

  LoginDTO({required this.user, required this.password});

  Map<String, dynamic> queryParams() =>
      {'usuario': user, 'contrasenia': password};
}
