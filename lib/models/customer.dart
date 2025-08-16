class Customer {
  final int customerID;
  final String firstName;
  final String lastName;
  final String email;
  final DateTime registrationDate;

  Customer({
    required this.customerID,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.registrationDate,
  });

  factory Customer.fromJson(Map<String, dynamic> json) {
    return Customer(
      customerID: json['customerID'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      email: json['email'],
      registrationDate: DateTime.parse(json['registrationDate']),
    );
  }

  Map<String, dynamic> toJson() => {
    'customerID': customerID,
    'firstName': firstName,
    'lastName': lastName,
    'email': email,
    'registrationDate': registrationDate.toIso8601String(),
  };
}
