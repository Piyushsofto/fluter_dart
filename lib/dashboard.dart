import 'package:flutter/material.dart';
import 'package:my_project/sidebar.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key, this.email, this.password, this.phone})
      : super(key: key);
  final String? email;
  final String? password;
  final String? phone;

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DrawerScreen(),
      appBar: AppBar(
        title: Text('Dashboard'),
      ),
    );
  }
}
