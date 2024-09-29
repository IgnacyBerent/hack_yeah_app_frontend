class User {
  String id;
  String email;
  String district;
  String fullName;
  String role;

  User({
    required this.id,
    required this.email,
    required this.district,
    required this.fullName,
    required this.role,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['_id'],
      email: json['email'],
      district: json['district'],
      fullName: json['full_name'],
      role: json['role'],
    );
  }

  get initials => fullName.split(' ').map((e) => e[0].toUpperCase()).join();
}
