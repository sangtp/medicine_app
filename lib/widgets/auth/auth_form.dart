import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../theme.dart';
import '../button_primary.dart';
import '../general_logo_space.dart';

class AuthForm extends StatefulWidget {
  final Future<void> Function(
    String email,
    String password,
    String username,
    bool isLogin,
  )? submitFn;
  final bool? isLoading;
  const AuthForm(this.submitFn, {Key? key, this.isLoading}) : super(key: key);

  @override
  State<AuthForm> createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  bool _secureText = true;
  final _formKey = GlobalKey<FormState>();
  var _isLogin = true;
  var _userName = '';
  var _userEmail = '';
  var _userPassword = '';
  var _showSpinner = false;

  void showHide() {
    setState(() {
      _secureText = !_secureText;
    });
  }

  void _trySubmit() async {
    final isValid = _formKey.currentState!.validate();
    // Close the keyboard if open
    FocusScope.of(context).unfocus();
    if (isValid) {
      _formKey.currentState!.save();
      if (mounted) {
        setState(() {
          _showSpinner = true;
        });
      }
      await widget.submitFn!(
        _userEmail,
        _userPassword,
        _userName,
        _isLogin,
      );
      if (mounted) {
        setState(() {
          _showSpinner = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const GeneralLogoSpace(),
            const SizedBox(
              height: 20,
            ),
            Text(
              _isLogin ? 'Log In' : 'Sign Up',
              style: regularTextStyle.copyWith(fontSize: 25),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              _isLogin ? 'Log in your account!' : 'Register new your account!',
              style: regularTextStyle.copyWith(
                fontSize: 15,
                color: greyLightColor,
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  //TextFormField Full Name
                  if (!_isLogin)
                    Container(
                      padding: const EdgeInsets.only(left: 16),
                      height: 50,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: const [
                          BoxShadow(
                              color: Color(0x40000000),
                              offset: Offset(0, 1),
                              blurRadius: 4,
                              spreadRadius: 0),
                        ],
                        color: whiteColor,
                      ),
                      child: TextFormField(
                        key: const ValueKey('fullName'),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Full Name',
                          hintStyle: lightTextStyle.copyWith(
                            fontSize: 15,
                            color: greyLightColor,
                          ),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter a valid name';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          _userName = value!;
                        },
                      ),
                    ),
                  const SizedBox(
                    height: 20,
                  ),
                  //Text Field: Email Address
                  Container(
                    padding: const EdgeInsets.only(left: 16),
                    height: 50,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: const [
                        BoxShadow(
                            color: Color(0x40000000),
                            offset: Offset(0, 1),
                            blurRadius: 4,
                            spreadRadius: 0),
                      ],
                      color: whiteColor,
                    ),
                    child: TextFormField(
                      key: const ValueKey('email'),
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Email Address',
                        hintStyle: lightTextStyle.copyWith(
                          fontSize: 15,
                          color: greyLightColor,
                        ),
                      ),
                      validator: (value) {
                        if (value!.isEmpty || !value.contains('@')) {
                          return 'Please enter a valid email address.';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        _userEmail = value!;
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),

                  //Text Field: Password
                  Container(
                    padding: const EdgeInsets.only(left: 16),
                    height: 50,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: const [
                        BoxShadow(
                            color: Color(0x40000000),
                            offset: Offset(0, 1),
                            blurRadius: 4,
                            spreadRadius: 0),
                      ],
                      color: whiteColor,
                    ),
                    child: TextFormField(
                      key: const ValueKey('password'),
                      obscureText: _secureText,
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                          icon: _secureText
                              ? const Icon(Icons.visibility_off)
                              : const Icon(
                                  Icons.visibility,
                                  color: greenColor,
                                ),
                          onPressed: showHide,
                        ),
                        border: InputBorder.none,
                        hintText: 'Password',
                        hintStyle: lightTextStyle.copyWith(
                          fontSize: 15,
                          color: greyLightColor,
                        ),
                      ),
                      validator: (value) {
                        if (value!.isEmpty || value.length < 7) {
                          return 'Password must be at least 7 characters long.';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        _userPassword = value!;
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 100,
                  ),
                ],
              ),
            ),
            if (_showSpinner)
              const Center(
                child: CircularProgressIndicator(),
              ),
            if (!_showSpinner)
              Container(
                width: MediaQuery.of(context).size.width,
                child: ButtonPrimary(
                  text: _isLogin ? 'LOGIN' : 'REGISTER',
                  onTap: _trySubmit,
                ),
              ),
            const SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  _isLogin ? 'Create new account?' : 'Already have an account?',
                  style: lightTextStyle.copyWith(
                      color: greyLightColor, fontSize: 16),
                ),
                TextButton(
                    child: Text(
                      _isLogin ? 'Sign Up' : 'Log In',
                      style: boldTextStyle.copyWith(
                        color: greenColor,
                      ),
                    ),
                    onPressed: () {
                      setState(() {
                        _isLogin = !_isLogin;
                      });
                    }),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
