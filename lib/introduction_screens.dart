import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'home_screen.dart';

class IntroScreen extends StatelessWidget {
  IntroScreen({Key? key}) : super(key: key);

  ///Changed a little bit of buttons styling and text for the thumbnail lol
  ///Thanks for coming here :-)
  final List<PageViewModel> pages = [
    PageViewModel(
        title: 'Connect With Everyone',
        body:
            'Here you can have whatever description you would like to have, you can type it all in here',
        footer: SizedBox(
          height: 45,
          width: 300,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                primary: Colors.green,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                elevation: 8),
            onPressed: () {},
            child: const Text("Let's Go", style: TextStyle(fontSize: 20)),
          ),
        ),
        image: Center(
          child: Image.network('https://img.freepik.com/free-vector/recruiting-professionals-studying-candidate-profiles_1262-21404.jpg?t=st=1649585335~exp=1649585935~hmac=2d5bad7c01f5f27e7277706c2899fa9ce271537f01ed5fbf80588553084ea556&w=826'),
        ),
        decoration: const PageDecoration(
            titleTextStyle: TextStyle(
          fontSize: 25.0,
          fontWeight: FontWeight.bold,
        ))),
    PageViewModel(
        title: 'Have Access Everywhere!',
        body:
            'Here you can have whatever description you would like to have, you can type it all in here',
        footer: SizedBox(
          height: 45,
          width: 300,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                // primary: Colors.red,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                elevation: 8),
            onPressed: () {},
            child: const Text(
              "Why to wait!",
              style: TextStyle(fontSize: 20),
            ),
          ),
        ),
        image: Center(
          child:  Image.network('https://img.freepik.com/free-vector/recruiting-professionals-studying-candidate-profiles_1262-21404.jpg?t=st=1649585335~exp=1649585935~hmac=2d5bad7c01f5f27e7277706c2899fa9ce271537f01ed5fbf80588553084ea556&w=826'),
        ),
        decoration: const PageDecoration(
            titleTextStyle: TextStyle(
          fontSize: 25.0,
          fontWeight: FontWeight.bold,
        ))),
    PageViewModel(
        title: 'Here We Start!',
        body:
            'Here you can have whatever description you would like to have, you can type it all in here',
        footer: SizedBox(
          height: 45,
          width: 300,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                primary: Colors.red,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                elevation: 8),
            onPressed: () {},
            child: const Text("Let's Start", style: TextStyle(fontSize: 20)),
          ),
        ),
        image: Center(
          child:  Image.network('https://img.freepik.com/free-vector/recruiting-professionals-studying-candidate-profiles_1262-21404.jpg?t=st=1649585335~exp=1649585935~hmac=2d5bad7c01f5f27e7277706c2899fa9ce271537f01ed5fbf80588553084ea556&w=826'),
        ),
        decoration: const PageDecoration(
            titleTextStyle: TextStyle(
          fontSize: 25.0,
          fontWeight: FontWeight.bold,
        ))),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter on Boarding UI'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(12, 80, 12, 12),
        child: IntroductionScreen(
          pages: pages,
          dotsDecorator: const DotsDecorator(
            size: Size(15, 15),
            color: Colors.blue,
            activeSize: Size.square(20),
            activeColor: Colors.red,
          ),
          showDoneButton: true,
          done: const Text(
            'Done',
            style: TextStyle(fontSize: 20),
          ),
          showSkipButton: true,
          skip: const Text(
            'Skip',
            style: TextStyle(fontSize: 20),
          ),
          showNextButton: true,
          next: const Icon(
            Icons.arrow_forward,
            size: 25,
          ),
          onDone: () => onDone(context),
          curve: Curves.bounceOut,
        ),
      ),
    );
  }

  void onDone(context) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('ON_BOARDING', false);
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const HomeScreen()));
  }
}
