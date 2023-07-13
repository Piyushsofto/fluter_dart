import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_project/login.dart';

class onBoardingScreen extends StatefulWidget {
  const onBoardingScreen({super.key});

  @override
  State<onBoardingScreen> createState() => _onBoardingScreenState();
}

class _onBoardingScreenState extends State<onBoardingScreen> {
  List onBoardingData = [
    {
      "image": "assets/images/screen1.png",
      "title": "Care Your Family",
      "discription": "The process can included eduction new"
    },
    {
      "image": "assets/images/screen2.png",
      "title": "Care Your Family",
      "discription": "The process can included eduction new"
    },
    {
      "image": "assets/images/screen3.png",
      "title": "Care Your Family",
      "discription": "The process can included eduction new"
    }
  ];
  Color whiteColor = Colors.white;
  Color otherColor = Colors.black;
  PageController pageController = PageController();

  continueMthod() {
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => const loginFormScreen()),
        (Route<dynamic> route) => false);
  }

  int currentPage = 0;
  onChanged(int index) {
    setState(() {
      currentPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        actions: [
          TextButton(
              onPressed: continueMthod,
              child: Text(
                'skip',
                style: TextStyle(color: otherColor),
              ))
        ],
      ),
      body: Stack(
        children: [
          PageView.builder(
            scrollDirection: Axis.horizontal,
            controller: pageController,
            itemCount: onBoardingData.length,
            onPageChanged: onChanged,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Image.asset(onBoardingData[index]['image']),
                  Text(
                    onBoardingData[index]['title'],
                    style: TextStyle(fontSize: 20, color: otherColor),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    onBoardingData[index]['discription'],
                    style: TextStyle(fontSize: 20, color: otherColor),
                  ),
                ],
              );
            },
          ),
          Padding(
              padding: const EdgeInsets.only(bottom: 50),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  (currentPage == (onBoardingData.length - 1))
                      ? ElevatedButton(
                          onPressed: continueMthod,
                          child: const Text('continue'))
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List<Widget>.generate(onBoardingData.length,
                              (index) {
                            return AnimatedContainer(
                              duration: const Duration(milliseconds: 200),
                              height: 10,
                              width: (index == currentPage) ? 15 : 10,
                              margin: const EdgeInsets.symmetric(horizontal: 5),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: (index == currentPage)
                                      ? Colors.deepOrange
                                      : Colors.grey),
                            );
                          }),
                        )
                ],
              ))
        ],
      ),
    );
  }
}
