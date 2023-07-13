import 'package:flutter/material.dart';
import 'package:my_project/dashboard.dart';
import 'package:my_project/profile.dart';

class loginFormScreen extends StatefulWidget {
  const loginFormScreen({super.key});

  @override
  State<loginFormScreen> createState() => _loginFormScreenState();
}

class _loginFormScreenState extends State<loginFormScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController phone = TextEditingController();

  void navigateNextPage(BuildContext ctx) {
    Navigator.of(ctx).push(MaterialPageRoute(builder: (_) {
      return DashboardScreen(
          email: email.text, password: password.text, phone: phone.text);
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red[600],
        title: const Text('Login'),
        centerTitle: true,
      ),
      body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Form(
              key: _formKey,
              child: ListView(
                children: [
                  Container(
                    child: Image.asset(
                        'assets/images/95-950230_logo-flutter-png-transparent-png.png'),
                    height: 50,
                    width: 50,
                  ),
                  const Text('Email'),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: email,
                    decoration: InputDecoration(
                        hintText: 'Enter your address',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                            borderSide: const BorderSide())),
                    // The validator receives the text that the user has entered.
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                  ),
                  const Text('Phone'),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: phone,
                    keyboardType: TextInputType.number,
                    maxLength: 10,
                    decoration: InputDecoration(
                        hintText: 'Phone number',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                            borderSide: const BorderSide())),
                    // The validator receives the text that the user has entered.
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                  ),
                  const Text('Password'),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    obscureText: true,
                    controller: password,
                    decoration: InputDecoration(
                        hintText: 'password',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                            borderSide: const BorderSide())),
                    // The validator receives the text that the user has entered.
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        print('validated');
                        navigateNextPage(context);
                        print("${email.text},${password.text}, ${phone.text}");
                      } else {
                        print('not validated');
                      }
                    },
                    child: const Text('Submit'),
                  ),
                ],
              ))),
    );
  }
}
