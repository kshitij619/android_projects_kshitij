class UserModel {
  UserModel({
    required this.name,
    required this.email,
    required this.createdAt,
  });

  final String name;
  final String email;
  final DateTime createdAt;

  @override
  String toString() =>
      'UserModel(name: $name, email: $email, createdAt: $createdAt)';
}
