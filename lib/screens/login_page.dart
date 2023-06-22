import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notes_app/providers/auth_provider.dart';
import 'package:notes_app/screens/home_page.dart';
import 'package:notes_app/screens/signup_page.dart';
import 'package:notes_app/screens/welcome_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: w,
              height: h * 0.3,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("img/loginimg.png"), fit: BoxFit.cover),
              ),
            ),
            Container(
              width: w,
              height: h * 0.4,
              margin: EdgeInsets.only(left: 20.0, right: 15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Hello",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 70.0),
                  ),
                  Text(
                    "Sign into your account",
                    style: TextStyle(
                      color: Colors.blueAccent,
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30.0),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 10.0,
                            spreadRadius: 5.0,
                            offset: Offset(1, 1),
                            color: Colors.grey.withOpacity(0.8),
                          ),
                        ]),
                    child: TextField(
                      controller: emailController,
                      decoration: InputDecoration(
                        hintText: "Your Email",
                        prefixIcon:
                            Icon(Icons.email, color: Colors.deepOrangeAccent),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30.0),
                            borderSide: BorderSide(
                              color: Colors.white,
                              width: 1.0,
                            )),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0),
                          borderSide:
                              BorderSide(color: Colors.white, width: 1.0),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30.0),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 10.0,
                            spreadRadius: 5.0,
                            offset: Offset(1, 1),
                            color: Colors.grey.withOpacity(0.8),
                          ),
                        ]),
                    child: TextField(
                      controller: passwordController,
                      decoration: InputDecoration(
                        hintText: "Password",
                        prefixIcon: Icon(Icons.password,
                            color: Colors.deepOrangeAccent),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30.0),
                            borderSide: BorderSide(
                              color: Colors.white,
                              width: 1.0,
                            )),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0),
                          borderSide:
                              BorderSide(color: Colors.white, width: 1.0),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Expanded(child: Container()),
                      Text("Forgot your password ?",
                          style: TextStyle(
                            color: Colors.black,
                          )),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            InkWell(
              onTap: () async {
                bool loginSuccess = await authProvider.login(
                  email: emailController.text.toString(),
                  password: passwordController.text.toString(),
                );

                SharedPreferences sp = await SharedPreferences.getInstance();
                sp.setString('emailId', emailController.text.toString());

                print(sp.getString('emailId'));

                if (loginSuccess) {
                  // Route to welcome page upon successful login
                  Get.off(() => HomePage(email: emailController.text));
                }
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
                  child: authProvider.isLoading
                      ? CircularProgressIndicator(
                          color: Colors.blueAccent,
                        )
                      : Text('Sign In',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 36.0,
                              fontWeight: FontWeight.bold)),
                ),
              ),
            ),
            SizedBox(
              height: w * 0.2,
            ),
            RichText(
              text: TextSpan(
                text: "Don\'t have a account?",
                style: TextStyle(color: Colors.grey, fontSize: 20.0),
                children: [
                  TextSpan(
                      text: " Create Now",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Get.to(() => SignupPage());
                          // print("hARRY");
                        }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
