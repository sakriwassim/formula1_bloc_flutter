import 'package:block_breakingbad_flutter/constants/my_colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../constants/small_button_style.dart';
import '../controllers/auth_controller.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool _passwordVisible = false;
  bool _confirmPasswordVisible = false;
  final _formKey = GlobalKey<FormState>();
  String? errorMessage = '';
  bool isAdmin = false;
  String email = '';
  String username = '';
  String password = '';

  bool isLogin = true;

  Future<void> signIn() async {
    try {
      await Auth().signIn(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      setState(() {
        errorMessage = e.message;
      });
    }
  }

  Future<void> signUp() async {
    try {
      await Auth().signUp(
          email: email, password: password, name: username, isAdmin: isAdmin);
    } on FirebaseAuthException catch (e) {
      setState(() {
        errorMessage = e.message;
      });
    }
  }

  Widget _errorMessage() {
    return errorMessage == ''
        ? const SizedBox(height: 8)
        : Column(
            children: [
              Text(
                errorMessage == '' ? '' : '$errorMessage',
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.red),
              ),
              const SizedBox(height: 8),
            ],
          );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
                flex: 2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset("assets/icons/logo.svg"),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text("let's Get Familiar"),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text("introduce Yourself")
                  ],
                )),
            Expanded(
              flex: 5,
              child: Container(
                decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 255, 255, 255),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    )),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 30,
                      right: 30,
                      top: 15,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              !isLogin
                                  ? Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: const [
                                            Text("Username"),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        TextFormField(
                                          textInputAction: TextInputAction.next,
                                          decoration: decoration("Username"),
                                          onChanged: (val) => setState(() {
                                            username = val;
                                          }),
                                          validator: (value) {
                                            if (value == null ||
                                                value.isEmpty) {
                                              return "Username shouldn't be empty";
                                            }
                                            return null;
                                          },
                                        ),
                                      ],
                                    )
                                  : const SizedBox(),
                              const SizedBox(
                                height: 10,
                              ),
                              Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: const [
                                      Text("Email"),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  TextFormField(
                                    decoration: decoration("Email"),
                                    textInputAction: TextInputAction.next,
                                    keyboardType: TextInputType.emailAddress,
                                    onChanged: (val) => setState(() {
                                      email = val;
                                    }),
                                    validator: (value) {
                                      final emailRegExp = RegExp(
                                          r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
                                      if (value == null ||
                                          value.isEmpty ||
                                          !emailRegExp.hasMatch(value)) {
                                        return "Enter a valid email address";
                                      }
                                      return null;
                                    },
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: const [
                                      Text("Password"),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  TextFormField(
                                    decoration: InputDecoration(
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        borderSide: const BorderSide(
                                          width: 3,
                                          color: Colors.greenAccent,
                                        ),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        borderSide: const BorderSide(
                                            width: 3,
                                            color: Color.fromARGB(31, 0, 0, 0)),
                                      ),
                                      labelText: "Password",
                                      suffixIcon: IconButton(
                                        icon: Icon(_passwordVisible
                                            ? Icons.visibility
                                            : Icons.visibility_off),
                                        onPressed: () {
                                          setState(() {
                                            _passwordVisible =
                                                !_passwordVisible;
                                          });
                                        },
                                      ),
                                    ),
                                    textInputAction: isLogin
                                        ? TextInputAction.done
                                        : TextInputAction.next,
                                    keyboardType: TextInputType.visiblePassword,
                                    obscureText: !_passwordVisible,
                                    onChanged: (val) => setState(() {
                                      password = val;
                                    }),
                                    validator: (value) {
                                      if (value == null ||
                                          value.isEmpty ||
                                          value.length < 6) {
                                        return "Password should be at least 6 characters";
                                      }
                                      return null;
                                    },
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              !isLogin
                                  ? Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: const [
                                            Text("Confirm password"),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        TextFormField(
                                          textInputAction: isAdmin
                                              ? TextInputAction.next
                                              : TextInputAction.done,
                                          keyboardType:
                                              TextInputType.visiblePassword,
                                          obscureText: !_confirmPasswordVisible,
                                          decoration: InputDecoration(
                                            focusedBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                              borderSide: const BorderSide(
                                                width: 3,
                                                color: Colors.greenAccent,
                                              ),
                                            ),
                                            enabledBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                              borderSide: const BorderSide(
                                                  width: 3,
                                                  color: Color.fromARGB(
                                                      31, 0, 0, 0)),
                                            ),
                                            labelText: "Confirm password",
                                            suffixIcon: IconButton(
                                              icon: Icon(_confirmPasswordVisible
                                                  ? Icons.visibility
                                                  : Icons.visibility_off),
                                              onPressed: () {
                                                setState(() {
                                                  _confirmPasswordVisible =
                                                      !_confirmPasswordVisible;
                                                });
                                              },
                                            ),
                                          ),
                                          validator: (value) {
                                            if (value == null ||
                                                value.isEmpty ||
                                                value.length < 6 ||
                                                value != password) {
                                              return "Password doesn't match";
                                            }
                                            return null;
                                          },
                                        ),
                                      ],
                                    )
                                  : const SizedBox(),
                            ],
                          ),
                        ),
                        _errorMessage(),
                        Row(
                          children: [
                            Expanded(
                              child: Button(
                                gradientbackground: gradientbackground,
                                fontSize: 25,
                                fontWeight: FontWeight.w400,
                                height: 50,
                                text: 'Next',
                                textcolor: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        GestureDetector(
                          onTap: (() => setState(() {
                                isLogin = !isLogin;
                              })),
                          child: RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                    style: const TextStyle(color: Colors.grey),
                                    text: isLogin
                                        ? "New user? "
                                        : "You have an account? "),
                                TextSpan(
                                    style: const TextStyle(
                                        fontSize: 16,
                                        color: MyColors.myGrey,
                                        fontWeight: FontWeight.bold,
                                        decoration: TextDecoration.underline),
                                    text: isLogin ? "Sign up" : "Login")
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  InputDecoration decoration(String text) {
    return InputDecoration(
      labelText: text,
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
        borderSide: const BorderSide(
          width: 3,
          color: Colors.greenAccent,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
        borderSide:
            const BorderSide(width: 3, color: Color.fromARGB(31, 0, 0, 0)),
      ),
    );
  }
}
