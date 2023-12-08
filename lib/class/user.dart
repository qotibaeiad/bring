class User {
  late String name;
  late String phoneNumber;

  // Private constructor
  User();

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
