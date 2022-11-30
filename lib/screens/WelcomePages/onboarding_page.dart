// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:jobsgo/screens/Auth/register.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({Key? key}) : super(key: key);

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  int currentIndex = 0;
  PageController? _controller;

  @override
  void initState() {
    _controller = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _controller,
              itemCount: data.length,
              onPageChanged: (int index) {
                setState(() {
                  currentIndex = index;
                });
              },
              itemBuilder: (_,i) {
                  return Container(
                    padding: const EdgeInsets.all(40),
                    child: Column(
                      children: [
                        Image.asset(data[i].image),
                        const SizedBox(height: 30),
                        Text(
                          data[i].title,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: Color(0xff2369F9),
                            inherit: false,
                            fontSize: 38,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 30,),
                        Text(
                          data[i].description,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: Colors.black,
                            inherit: false,
                            fontSize: 18,
                            //fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  );
                },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              data.length,
              (index) => buildDot(index, context),
            ),
          ),
          const SizedBox(height: 35),
          SizedBox(
            height: 60,
            width: 340,
            child: TextButton(
              onPressed: () {
                if (currentIndex == data.length - 1) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => const Register()
                      ));
                }
                _controller?.nextPage(
                    duration: const Duration(milliseconds: 100),
                    curve: Curves.bounceIn);
              },
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(const Color(0xff176DC2)),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ))
              ),
              child: Text(
                currentIndex == data.length - 1 ? "Get Started" : "Next",
                style: const TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }

  Container buildDot(int index, BuildContext context) {
    return Container(
      height: 8,
      width: currentIndex == index ? 30 : 8,
      margin: const EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: const Color(0xff176DC2),
      ),
    );
  }
}

class Onboard {
  final String image, title, description;

  Onboard({
    required this.image,
    required this.title,
    required this.description,
    //required this.button,
  });
}
final List<Onboard> data = [
  Onboard(
    image: "assets/images/welcome_page1.png",
    title: "We are the best job portal platform",
    description: "Choose a job you love, and you will never have to work a day in your life",
    //button: "Next",
  ),
  Onboard(
    image: "assets/images/welcome_page2.png",
    title: "The place where work finds you",
    description: "Choose a job you love, and you will never have to work a day in your life",
    //button: "Next",
  ),
  Onboard(
    image: "assets/images/welcome_page3.png",
    title: "Let's start your career with us now",
    description: "Choose a job you love, and you will never have to work a day in your life",
    //button: "Get Started",
  ),
];
