class User {
  final String? id;
  final String? lastLogin;
  final bool isSuperuser;
  final bool isStaff;
  final String dateJoined;
  final String firstName;
  final String lastName;
  final String email;
  final String? phone;
  final String? username;
  final String? dateOfBirth;
  final String? profilePicture;
  final bool isCustomer;
  final bool isAdmin;
  final bool isSeller;
  final bool isActive;

  User({
    this.id,
    this.lastLogin,
    required this.isSuperuser,
    required this.isStaff,
    required this.dateJoined,
    required this.firstName,
    required this.lastName,
    required this.email,
    this.phone,
    this.username,
    this.dateOfBirth,
    this.profilePicture,
    required this.isCustomer,
    required this.isAdmin,
    required this.isSeller,
    required this.isActive,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'].toString(),
      lastLogin: json['last_login'],
      isSuperuser: json['is_superuser'],
      isStaff: json['is_staff'],
      dateJoined: json['date_joined'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      email: json['email'],
      phone: json['phone'],
      username: json['username'],
      dateOfBirth: json['date_of_birth'],
      profilePicture: json['profile_picture'],
      isCustomer: json['is_customer'],
      isAdmin: json['is_admin'],
      isSeller: json['is_seller'],
      isActive: json['is_active'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'last_login': lastLogin,
      'is_superuser': isSuperuser,
      'is_staff': isStaff,
      'date_joined': dateJoined,
      'first_name': firstName,
      'last_name': lastName,
      'email': email,
      'phone': phone,
      'username': username,
      'date_of_birth': dateOfBirth,
      'profile_picture': profilePicture,
      'is_customer': isCustomer,
      'is_admin': isAdmin,
      'is_seller': isSeller,
      'is_active': isActive,
    };
  }
}
