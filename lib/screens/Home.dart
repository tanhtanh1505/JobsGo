import 'package:flutter/material.dart';
import 'package:jobsgo/screens/Profile.dart';
import '../component/AvatarWidget.dart';
import '../component/SearchBar.dart';
import '../component/TitleText.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Container(
            alignment: Alignment.center,
            child: Row(
              children: <Widget>[
                //avatar
                Padding(
                  padding: const EdgeInsets.only(left: 0),
                  child: GestureDetector(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Profile(),
                      ),
                    ),
                    child: const AvatarWidget(
                      height: 58,
                      width: 60,
                      urlImage: 'assets/images/helloworld.png',
                      radius: 45,
                    ),
                  ),
                ),

                //name
                Padding(
                  padding: EdgeInsets.only(left: 18),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(left: 0),
                            child: Text(
                              "Good Morning",
                              style: TextStyle(
                                fontFamily: 'Nunito Sans',
                                fontSize: 18,
                                fontWeight: FontWeight.normal,
                                color: Color.fromARGB(255, 37, 49, 65),
                              ),
                            ),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.waving_hand_rounded),
                            color: Color.fromARGB(255, 224, 159, 31),
                            tooltip: 'Profile',
                          ),
                        ],
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 0),
                        child: Text(
                          "Andrew Ainsley",
                          style: TextStyle(
                            fontFamily: 'Nunito Sans',
                            fontSize: 19,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 37, 49, 65),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          backgroundColor: Colors.transparent,
          toolbarHeight: 110,
          elevation: 0.0,
        ),
        body: ListView(
          children: const <Widget>[
            Center(
              child: Padding(
                padding: EdgeInsets.only(top: 5),
                child: SearchBar(text: 'Search for a job or company'),
              ),
            ),
          ],
        ),
      );
}
