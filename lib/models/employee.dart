class Employee {
  int? id;
  String? email;
  String? firstName;
  String? lastName;
  String? avatar;

  Employee({
    required this.id,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.avatar,
  });

  Employee.fromMap(Map<String, dynamic> e) {
    id = e['id'];
    email = e['email'];
    firstName = e['first_name'];
    lastName = e['last_name'];
    avatar = e['avatar'];
  }
}
