import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notes_app/screens/login_page.dart';

class WelcomePage extends StatelessWidget {
  final String email;

  WelcomePage({required this.email});
  // const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    List image = ["g.png", "t.png", "f.png"];

    return Scaffold(
      body: Column(
        children: [
          Container(
            width: w,
            height: h * 0.3,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("img/signup.png"), fit: BoxFit.cover),
            ),
            child: Column(
              children: [
                SizedBox(
                  height: h * 0.2,
                ),
                CircleAvatar(
                  backgroundColor: Colors.white70,
                  radius: 40.0,
                  backgroundImage: AssetImage("img/profile1.png"),
                )
              ],
            ),
          ),
          Container(
            width: w,
            margin: EdgeInsets.only(left: 20.0, right: 15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: 40,
                ),
                Container(
                    width: w,
                    margin: EdgeInsets.all(10),
                    child: Column(children: [
                      Text(
                        "Welcome",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: h * 0.05,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "$email",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: h * 0.02,
                            fontWeight: FontWeight.bold),
                      ),
                    ])),
              ],
            ),
          ),
          SizedBox(
            height: 30,
          ),
          InkWell(
            onTap: () {
              Get.off(() => LoginPage());
            },
            child: Container(
              width: w * 0.5,
              height: h * 0.08,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                image: DecorationImage(
                    image: AssetImage("img/loginbtn.png"), fit: BoxFit.cover),
              ),
              child: Center(
                child: Text('Sign Out',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 36.0,
                        fontWeight: FontWeight.bold)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
