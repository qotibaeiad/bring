class User {
  late String name;
  late String phoneNumber;

  // Public constructor
  User();

  // Factory constructor to create a User object from JSON
  factory User.fromJson(Map<String, dynamic> json) {
    User user = User();
    user.name =
        json['name'] ?? ''; // Add null check and provide a default value
    user.phoneNumber = json['phoneNumber'] ?? '';
    return user;
  }

  // Method to set user data
  void setUserData(String name, String phoneNumber) {
    this.name = name;
    this.phoneNumber = phoneNumber;
  }

  // Method to convert the user to JSON
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'phoneNumber': phoneNumber,
    };
  }
}
