import 'package:flutter/material.dart';
import 'package:my_project/onboarding_screen.dart';
import 'package:my_project/sidebar.dart';

class profileScreen extends StatelessWidget {
  const profileScreen({Key? key, this.email, this.password, this.phone})
      : super(key: key);
  final String? email;
  final String? password;
  final String? phone;

  void navigateNextPage(BuildContext ctx) {
    Navigator.of(ctx).push(MaterialPageRoute(builder: (_) {
      return onBoardingScreen();
    }));
  }
  // @override
  // Widget Build(BuildContext, context) {
  //   return Scaffold(
  //     appBar: AppBar(
  //       title: Text('New Page'),
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile Page'),
      ),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Container(
            child: Image.asset(
                'assets/images/95-950230_logo-flutter-png-transparent-png.png'),
            height: 150,
            width: 150,
          ),
          Text(
            email.toString(),
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30.0,
                letterSpacing: 5.0,
                color: Colors.blue),
          ),
          Text(
            password.toString(),
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30.0,
                letterSpacing: 5.0,
                color: Colors.blue),
          ),
          Text(
            phone.toString(),
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30.0,
                letterSpacing: 5.0,
                color: Colors.blue),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(primary: Colors.blue[600]),
            onPressed: () {
              print('not validated');
              navigateNextPage(context);
            },
            child: const Text('Onboaring'),
          ),
        ]),
      ),
    );
  }
}
