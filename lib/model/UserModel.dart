class UserModel {
  final String username;
  final String password;
  final String firstName;
  final String lastName;
  final String email;
  final String phone;
  final String fullAddress;
  final String city;
  final String province;
  final String postalCode;
  final String country;

  UserModel({
    required this.username,
    required this.password,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phone,
    required this.fullAddress,
    required this.city,
    required this.province,
    required this.postalCode,
    required this.country,
  });
}
