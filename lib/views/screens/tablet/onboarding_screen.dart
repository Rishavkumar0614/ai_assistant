import 'package:flutter/material.dart';
import 'package:ai_assistant/commons.dart';
import 'package:ai_assistant/utils/snack_bar.dart';
import 'package:ai_assistant/views/widgets/button.dart';
import 'package:ai_assistant/views/widgets/text_box.dart';
import 'package:ai_assistant/views/screens/tablet/home_screen.dart';

enum _OnboardingScreens { login, signup, forgotPassword }

class TabletOnBoardingScreen extends StatefulWidget {
  const TabletOnBoardingScreen({super.key});

  @override
  State<TabletOnBoardingScreen> createState() => _TabletOnBoardingScreenState();
}

class _TabletOnBoardingScreenState extends State<TabletOnBoardingScreen> {
  final TextEditingController _name = TextEditingController();
  _OnboardingScreens _currentScreen = _OnboardingScreens.login;
  final TextEditingController _username = TextEditingController();
  final TextEditingController _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    currentScreenContext = context;
    return Scaffold(
      body: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(maxHeight: 600),
          child: Container(
            width: 500,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey[400]!,
                  spreadRadius: 2,
                  blurRadius: 4,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 100,
                  child: Image(
                      image: AssetImage('assets/services logo/Gemini.png')),
                ),
                SizedBox(height: 20),
                if (_currentScreen == _OnboardingScreens.login)
                  Column(
                    children: [
                      Text(
                        'Login to AI Assistant',
                        style: TextStyle(fontSize: 20),
                      ),
                      SizedBox(height: 20),
                      TextBox(
                        controller: _username,
                        labelText: 'Username',
                        icon: Icons.person_outlined,
                      ),
                      TextBox(
                        isObscure: true,
                        controller: _password,
                        labelText: 'Password',
                        icon: Icons.password_outlined,
                      ),
                      Button(
                          text: 'Login',
                          onTap: () async {
                            String response = await authController.loginUser(
                                _username.text, _password.text);
                            switch (response) {
                              case 'SUCCESS':
                                showSnackBar(
                                    'Login Successfull, Redirecting to Home Screen..',
                                    2);
                                Navigator.pushReplacement(
                                  currentScreenContext!,
                                  MaterialPageRoute(
                                      builder: (currentScreenContext) =>
                                          const TabletHomeScreen()),
                                );
                                break;
                              case 'SOMETHING WENT WRONG AT OUR END':
                                showSnackBar(
                                    'Something went wrong at our end. Please Try again after some time.',
                                    2);
                                break;
                              case 'USER DOES NOT EXISTS':
                                showSnackBar(
                                    'No User Found with this Username.', 2);
                                break;
                              case 'WRONG PASSWORD':
                                showSnackBar(
                                    'Password Entered is Incorrect.', 2);
                                break;
                              case 'INVALID RESPONSE':
                                showSnackBar(
                                    'Invalid Response, Try again after some time.',
                                    2);
                                break;
                              case 'PLEASE FILL ALL THE FIELDS':
                                showSnackBar('Please Fill All the Fields.', 2);
                                break;
                              default:
                                showSnackBar(
                                    'Something Went Wrong: $response', 2);
                            }
                          }),
                      InkWell(
                        onTap: () {
                          setState(() {
                            _currentScreen = _OnboardingScreens.forgotPassword;
                          });
                        },
                        child: Text(
                          'Forgot Password?',
                          style: TextStyle(
                            color: Colors.blue,
                            fontSize: 16,
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Divider(
                        color: Colors.grey[400],
                        thickness: 1,
                        indent: 20,
                        endIndent: 20,
                      ),
                      SizedBox(height: 20),
                      Button(
                        text: 'Create new account',
                        onTap: () {
                          setState(() {
                            _currentScreen = _OnboardingScreens.signup;
                          });
                        },
                        backgroundColor: Colors.green,
                      ),
                    ],
                  ),
                if (_currentScreen == _OnboardingScreens.signup)
                  Column(
                    children: [
                      Text(
                        'Signup to AI Assistant',
                        style: TextStyle(fontSize: 20),
                      ),
                      SizedBox(height: 20),
                      TextBox(
                        controller: _name,
                        labelText: 'Name',
                      ),
                      TextBox(
                        controller: _username,
                        labelText: 'Username',
                        icon: Icons.person_outlined,
                      ),
                      TextBox(
                        isObscure: true,
                        controller: _password,
                        labelText: 'Password',
                        icon: Icons.password_outlined,
                      ),
                      Button(
                          text: 'Signup',
                          onTap: () async {
                            String response = await authController.createUser(
                                _name.text, _username.text, _password.text);
                            switch (response) {
                              case 'SUCCESS':
                                showSnackBar(
                                    'Signup Successfull, Redirecting to Home Screen..',
                                    2);
                                Navigator.pushReplacement(
                                  currentScreenContext!,
                                  MaterialPageRoute(
                                      builder: (currentScreenContext) =>
                                          const TabletHomeScreen()),
                                );
                                break;
                              case 'SOMETHING WENT WRONG AT OUR END':
                                showSnackBar(
                                    'Something went wrong at our end. Please Try again after some time.',
                                    2);
                                break;
                              case 'USER ALREADY EXISTS':
                                showSnackBar('This Username is Taken.', 2);
                                break;
                              case 'INVALID RESPONSE':
                                showSnackBar(
                                    'Invalid Response, Try again after some time.',
                                    2);
                                break;
                              case 'PLEASE FILL ALL THE FIELDS':
                                showSnackBar('Please Fill All the Fields.', 2);
                                break;
                              default:
                                showSnackBar(
                                    'Something Went Wrong: $response', 2);
                            }
                          }),
                      SizedBox(height: 10),
                      Divider(
                        color: Colors.grey[400],
                        thickness: 1,
                        indent: 20,
                        endIndent: 20,
                      ),
                      SizedBox(height: 20),
                      Button(
                        text: 'Already have a account? Login',
                        onTap: () {
                          setState(() {
                            _currentScreen = _OnboardingScreens.login;
                          });
                        },
                        backgroundColor: Colors.green,
                      ),
                    ],
                  ),
                if (_currentScreen == _OnboardingScreens.forgotPassword)
                  Column(
                    children: [],
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
