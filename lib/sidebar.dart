import 'package:flutter/material.dart';
import 'package:my_project/login.dart';
import 'package:my_project/profile.dart';
import 'package:my_project/todoApp/todoApp.dart';

class DrawerScreen extends StatelessWidget {
  const DrawerScreen({Key? key}) : super(key: key);

  final List drawerMenuListname = const [
    {
      "leading": Icon(
        Icons.account_circle,
        color: Color(0xFF13C0E3),
      ),
      "title": "Profile",
      "trailing": Icon(
        Icons.chevron_right,
      ),
      "action_id": 1,
    },
    {
      "leading": Icon(
        Icons.animation_rounded,
        color: Color(0xFF13C0E3),
      ),
      "title": "About Us",
      "trailing": Icon(Icons.chevron_right),
      "action_id": 2,
    },
    {
      "leading": Icon(
        Icons.help,
        color: Color(0xFF13C0E3),
      ),
      "title": "Help",
      "trailing": Icon(Icons.chevron_right),
      "action_id": 3,
    },
    {
      "leading": Icon(
        Icons.settings,
        color: Color(0xFF13C0E3),
      ),
      "title": "Settings",
      "trailing": Icon(Icons.chevron_right),
      "action_id": 4,
    },
    {
      "leading": Icon(
        Icons.exit_to_app,
        color: Color(0xFF13C0E3),
      ),
      "title": "Todo App",
      "trailing": Icon(Icons.chevron_right),
      "action_id": 6,
    },
    {
      "leading": Icon(
        Icons.exit_to_app,
        color: Color(0xFF13C0E3),
      ),
      "title": "Log Out",
      "trailing": Icon(Icons.chevron_right),
      "action_id": 5,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: 280,
        child: Drawer(
          child: ListView(
            children: [
              const ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(
                      "https://www.channelfutures.com/files/2019/10/Focus-877x432.jpg"),
                ),
                title: Text(
                  "Piyush Home",
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
                subtitle: Text(
                  "8340172667",
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
              const SizedBox(
                height: 1,
              ),
              ...drawerMenuListname.map((sideMenuData) {
                return ListTile(
                  leading: sideMenuData['leading'],
                  title: Text(
                    sideMenuData['title'],
                  ),
                  trailing: sideMenuData['trailing'],
                  onTap: () {
                    Navigator.pop(context);
                    if (sideMenuData['action_id'] == 1) {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const profileScreen(),
                        ),
                      );
                    } else if (sideMenuData['action_id'] == 5) {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const loginFormScreen(),
                        ),
                      );
                    } else if (sideMenuData['action_id'] == 6) {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => TodoAppScreen(),
                        ),
                      );
                    }
                  },
                );
              }).toList(),
            ],
          ),
        ),
      ),
    );
  }
}
