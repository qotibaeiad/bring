class PhoneNumberData {
  final String phoneNumber;
  final String isoCode;

  PhoneNumberData(this.phoneNumber, this.isoCode);

  // Convert class instance to Map
  Map<String, dynamic> toJson() {
    return {
      'phoneNumber': phoneNumber,
      'isoCode': isoCode,
      // Add any other necessary fields
    };
  }
}
