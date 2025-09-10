import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:mytask/models/employee.dart';

class EmployeeServices {
  Future<List<Employee>> fetchUsers() async {
    List<Employee> allEmployee = [];
    try {
      String url = 'https://reqres.in/api/users?page=2';
      var uri = Uri.parse(url);
      var response = await http.get(uri);

      if (response.statusCode == 200) {
        var body = response.body;
        var json = jsonDecode(body);
        var employeeData = json['data'];
        print('fetched');
        print(employeeData);
        for (var employee in employeeData) {
          Employee newEmployee = Employee.fromMap(employee);
          allEmployee.add(newEmployee);
        }
        return allEmployee;
      } else {
        throw Exception('Failed to load employees');
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
