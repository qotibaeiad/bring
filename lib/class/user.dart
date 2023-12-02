class User {
  late String name;
  late String phoneNumber;

  // Private constructor
  User._private();

  // Singleton instance
  static final User _instance = User._private();

  // Factory constructor to return the singleton instance
  factory User() => _instance;

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
