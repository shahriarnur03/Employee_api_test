import 'package:flutter/material.dart';
import 'package:mytask/models/employee.dart';
import 'package:mytask/services/employee_services.dart';

class EmployeeScreen extends StatefulWidget {
  const EmployeeScreen({super.key});

  @override
  State<EmployeeScreen> createState() => _EmployeeScreenState();
}

class _EmployeeScreenState extends State<EmployeeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text('Employee Data', style: TextStyle(color: Colors.white)),
        actions: [
          IconButton(
            onPressed: () {
              // EmployeeServices().fetchUsers();
              print(EmployeeServices().fetchUsers());
            },
            
            icon: Icon(Icons.refresh),
            
          ),
        ],
      ),
      body: FutureBuilder<List<Employee>>(
        future: EmployeeServices().fetchUsers(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text('Error fetching Employee Data'));
          }

          if (snapshot.hasData) {
            final employee = snapshot.data!;
            return ListView.builder(
              itemCount: employee.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(employee[index].avatar!),
                  ),
                  title: Text(
                    "${employee[index].firstName!} ${employee[index].lastName!}",
                  ),
                  subtitle: Text(employee[index].email!),
                );
              },
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
