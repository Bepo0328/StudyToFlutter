import 'package:flutter/material.dart';
import 'package:flutter_chatting/config/palette.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_chatting/screens/chat_screen.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class LoginSignUpScreen extends StatefulWidget {
  const LoginSignUpScreen({Key? key}) : super(key: key);

  @override
  _LoginSignUpScreenState createState() => _LoginSignUpScreenState();
}

class _LoginSignUpScreenState extends State<LoginSignUpScreen> {
  final _authentication = FirebaseAuth.instance;
  bool isSignUpScreen = true;
  bool _isObscure = true;
  bool showSpinner = false;
  final _formKey = GlobalKey<FormState>();
  String userName = '';
  String userEmail = '';
  String userPassword = '';

  void _tryValidation() {
    final isValid = _formKey.currentState!.validate();
    if (isValid) {
      _formKey.currentState!.save();
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: Palette.backgroundColor,
        body: ModalProgressHUD(
          inAsyncCall: showSpinner,
          child: Stack(
            children: [
              Positioned(
                top: 0,
                right: 0,
                left: 0,
                child: Container(
                  height: 300.0,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(
                          'images/red_yellow_gradient.jpg',
                        ),
                        fit: BoxFit.fill),
                  ),
                  child: Container(
                    padding: const EdgeInsets.only(
                      top: 90.0,
                      left: 20.0,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RichText(
                          text: TextSpan(
                            text: 'Welcome',
                            style: const TextStyle(
                              letterSpacing: 1.0,
                              fontSize: 25.0,
                              color: Colors.white,
                            ),
                            children: [
                              TextSpan(
                                text: isSignUpScreen
                                    ? ' to Yummy Chat!'
                                    : ' back',
                                style: const TextStyle(
                                  letterSpacing: 1.0,
                                  fontSize: 25.0,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 5.0,
                        ),
                        Text(
                          isSignUpScreen
                              ? 'Sign Up to continue'
                              : 'Sign In to continue',
                          style: const TextStyle(
                            letterSpacing: 1.0,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              // 배경
              AnimatedPositioned(
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeIn,
                top: 180.0,
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeIn,
                  padding: const EdgeInsets.all(20.0),
                  height: isSignUpScreen ? 280.0 : 250.0,
                  width: MediaQuery.of(context).size.width - 40.0,
                  margin: const EdgeInsets.symmetric(horizontal: 20.0),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.3),
                          blurRadius: 15.0,
                          spreadRadius: 5.0,
                        ),
                      ]),
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.only(bottom: 20.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  isSignUpScreen = false;
                                });
                              },
                              child: Column(
                                children: [
                                  Text(
                                    'LOGIN',
                                    style: TextStyle(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.bold,
                                      color: !isSignUpScreen
                                          ? Palette.activeColor
                                          : Palette.textColor1,
                                    ),
                                  ),
                                  if (!isSignUpScreen)
                                    Container(
                                      margin: const EdgeInsets.only(top: 3.0),
                                      height: 2.0,
                                      width: 55.0,
                                      color: Colors.orange,
                                    ),
                                ],
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  isSignUpScreen = true;
                                });
                              },
                              child: Column(
                                children: [
                                  Text(
                                    'SIGNUP',
                                    style: TextStyle(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.bold,
                                      color: isSignUpScreen
                                          ? Palette.activeColor
                                          : Palette.textColor1,
                                    ),
                                  ),
                                  if (isSignUpScreen)
                                    Container(
                                      margin: const EdgeInsets.only(top: 3.0),
                                      height: 2.0,
                                      width: 55.0,
                                      color: Colors.orange,
                                    ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        if (isSignUpScreen)
                          Container(
                            margin: const EdgeInsets.only(top: 20.0),
                            child: Form(
                              key: _formKey,
                              child: Column(
                                children: [
                                  TextFormField(
                                    key: const ValueKey(1),
                                    validator: (value) {
                                      if (value!.isEmpty || value.length < 4) {
                                        return 'Please enter at least 4 characters';
                                      } else {
                                        return null;
                                      }
                                    },
                                    onSaved: (value) {
                                      userName = value!;
                                    },
                                    onChanged: (value) {
                                      userName = value;
                                    },
                                    decoration: const InputDecoration(
                                      prefixIcon: Icon(
                                        Icons.account_circle,
                                        color: Palette.iconColor,
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Palette.textColor1,
                                        ),
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(35.0),
                                        ),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Palette.textColor1,
                                        ),
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(35.0),
                                        ),
                                      ),
                                      hintText: 'User name',
                                      hintStyle: TextStyle(
                                        fontSize: 14.0,
                                        color: Palette.textColor1,
                                      ),
                                      contentPadding: EdgeInsets.all(10.0),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 8.0,
                                  ),
                                  TextFormField(
                                    keyboardType: TextInputType.emailAddress,
                                    key: const ValueKey(2),
                                    validator: (value) {
                                      if (value!.isEmpty ||
                                          !value.contains('@')) {
                                        return 'Please enter a valid email address.';
                                      } else {
                                        return null;
                                      }
                                    },
                                    onSaved: (value) {
                                      userEmail = value!;
                                    },
                                    onChanged: (value) {
                                      userEmail = value;
                                    },
                                    decoration: const InputDecoration(
                                      prefixIcon: Icon(
                                        Icons.email,
                                        color: Palette.iconColor,
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Palette.textColor1,
                                        ),
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(35.0),
                                        ),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Palette.textColor1,
                                        ),
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(35.0),
                                        ),
                                      ),
                                      hintText: 'Email',
                                      hintStyle: TextStyle(
                                        fontSize: 14.0,
                                        color: Palette.textColor1,
                                      ),
                                      contentPadding: EdgeInsets.all(10.0),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 8.0,
                                  ),
                                  TextFormField(
                                    key: const ValueKey(3),
                                    validator: (value) {
                                      if (value!.isEmpty || value.length < 7) {
                                        return 'Please must be at least 7 characters long.';
                                      } else {
                                        return null;
                                      }
                                    },
                                    onSaved: (value) {
                                      userPassword = value!;
                                    },
                                    onChanged: (value) {
                                      userPassword = value;
                                    },
                                    obscureText: _isObscure,
                                    decoration: InputDecoration(
                                      prefixIcon: const Icon(
                                        Icons.lock,
                                        color: Palette.iconColor,
                                      ),
                                      suffixIcon: IconButton(
                                        onPressed: () {
                                          setState(() {
                                            _isObscure = !_isObscure;
                                          });
                                        },
                                        icon: Icon(
                                          _isObscure
                                              ? Icons.visibility
                                              : Icons.visibility_off,
                                          color: Palette.iconColor,
                                        ),
                                      ),
                                      enabledBorder: const OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Palette.textColor1,
                                        ),
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(35.0),
                                        ),
                                      ),
                                      focusedBorder: const OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Palette.textColor1,
                                        ),
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(35.0),
                                        ),
                                      ),
                                      hintText: 'Password',
                                      hintStyle: const TextStyle(
                                        fontSize: 14.0,
                                        color: Palette.textColor1,
                                      ),
                                      contentPadding:
                                          const EdgeInsets.all(10.0),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        if (!isSignUpScreen)
                          Container(
                            margin: const EdgeInsets.only(top: 20.0),
                            child: Form(
                              key: _formKey,
                              child: Column(
                                children: [
                                  TextFormField(
                                    keyboardType: TextInputType.emailAddress,
                                    key: const ValueKey(4),
                                    validator: (value) {
                                      if (value!.isEmpty ||
                                          !value.contains('@')) {
                                        return 'Please enter a valid email address.';
                                      } else {
                                        return null;
                                      }
                                    },
                                    onSaved: (value) {
                                      userEmail = value!;
                                    },
                                    onChanged: (value) {
                                      userEmail = value;
                                    },
                                    decoration: const InputDecoration(
                                      prefixIcon: Icon(
                                        Icons.email,
                                        color: Palette.iconColor,
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Palette.textColor1,
                                        ),
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(35.0),
                                        ),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Palette.textColor1,
                                        ),
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(35.0),
                                        ),
                                      ),
                                      hintText: 'Email',
                                      hintStyle: TextStyle(
                                        fontSize: 14.0,
                                        color: Palette.textColor1,
                                      ),
                                      contentPadding: EdgeInsets.all(10.0),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 8.0,
                                  ),
                                  TextFormField(
                                    key: const ValueKey(5),
                                    validator: (value) {
                                      if (value!.isEmpty || value.length < 7) {
                                        return 'Please must be at least 7 characters long.';
                                      } else {
                                        return null;
                                      }
                                    },
                                    onSaved: (value) {
                                      userPassword = value!;
                                    },
                                    onChanged: (value) {
                                      userPassword = value;
                                    },
                                    obscureText: _isObscure,
                                    decoration: InputDecoration(
                                      prefixIcon: const Icon(
                                        Icons.lock,
                                        color: Palette.iconColor,
                                      ),
                                      suffixIcon: IconButton(
                                        onPressed: () {
                                          setState(() {
                                            _isObscure = !_isObscure;
                                          });
                                        },
                                        icon: Icon(
                                          _isObscure
                                              ? Icons.visibility
                                              : Icons.visibility_off,
                                          color: Palette.iconColor,
                                        ),
                                      ),
                                      enabledBorder: const OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Palette.textColor1,
                                        ),
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(35.0),
                                        ),
                                      ),
                                      focusedBorder: const OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Palette.textColor1,
                                        ),
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(35.0),
                                        ),
                                      ),
                                      hintText: 'Password',
                                      hintStyle: const TextStyle(
                                        fontSize: 14.0,
                                        color: Palette.textColor1,
                                      ),
                                      contentPadding:
                                          const EdgeInsets.all(10.0),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
              ),
              // 텍스트 폼 필드
              AnimatedPositioned(
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeIn,
                top: isSignUpScreen ? 430.0 : 400.0,
                right: 0.0,
                left: 0.0,
                child: Center(
                  child: Container(
                    padding: const EdgeInsets.all(15.0),
                    height: 90.0,
                    width: 90.0,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                    child: GestureDetector(
                      onTap: () async {
                        setState(() {
                          showSpinner = true;
                        });
                        _tryValidation();
                        if (isSignUpScreen) {
                          try {
                            final newUser = await _authentication
                                .createUserWithEmailAndPassword(
                              email: userEmail,
                              password: userPassword,
                            );

                            await FirebaseFirestore.instance
                                .collection('user')
                                .doc(newUser.user!.uid)
                                .set(
                                    {'userName': userName, 'email': userEmail});

                            if (newUser.user != null) {
                              // Navigator.push(
                              //   context,
                              //   MaterialPageRoute(builder: (context) {
                              //     return const ChatScreen();
                              //   }),
                              // );
                            }
                          } catch (e) {
                            print(e);
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text(
                                    'Please check your email and password'),
                                backgroundColor: Colors.blue,
                              ),
                            );
                          }
                        } else {
                          try {
                            final newUser = await _authentication
                                .signInWithEmailAndPassword(
                              email: userEmail,
                              password: userPassword,
                            );

                            if (newUser.user != null) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) {
                                  return const ChatScreen();
                                }),
                              );
                            }
                          } catch (e) {
                            print(e);
                          }
                          setState(() {
                            showSpinner = false;
                          });
                        }
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            colors: [
                              Colors.orange,
                              Colors.red,
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          borderRadius: BorderRadius.circular(30.0),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.3),
                              spreadRadius: 1.0,
                              blurRadius: 1.0,
                              offset: const Offset(0.0, 1.0),
                            ),
                          ],
                        ),
                        child: const Icon(
                          Icons.arrow_forward,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              // 전송 버튼
              AnimatedPositioned(
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeIn,
                top: isSignUpScreen
                    ? MediaQuery.of(context).size.height - 125.0
                    : MediaQuery.of(context).size.height - 165.0,
                right: 0.0,
                left: 0.0,
                child: Column(
                  children: [
                    Text(
                        isSignUpScreen ? 'or Sign Up with' : 'or Sign In with'),
                    const SizedBox(
                      height: 10.0,
                    ),
                    TextButton.icon(
                      onPressed: () {},
                      style: TextButton.styleFrom(
                        primary: Colors.white,
                        minimumSize: const Size(155.0, 40.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        backgroundColor: Palette.googleColor,
                      ),
                      icon: const Icon(Icons.add),
                      label: const Text('Google'),
                    ),
                  ],
                ),
              ),
              // Google 로그인
            ],
          ),
        ),
      ),
    );
  }
}
