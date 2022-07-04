import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:medicine_app/screens/auth_page.dart';

import '../theme.dart';
import '../widgets/general_logo_space.dart';
import '../widgets/button_primary.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailTextController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  void _trySubmit() async {
    try {
      final isValid = _formKey.currentState!.validate();
      // // Close the keyboard if open
      FocusScope.of(context).unfocus();
      _formKey.currentState!.save();
      print(_emailTextController.text);
      await _auth.sendPasswordResetEmail(email: _emailTextController.text);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.amber,
          content: Text(
            'Password reset email has been sent!',
            style: regularTextStyle.copyWith(fontSize: 18),
          ),
        ),
      );
    } on FirebaseAuthException catch (error) {
      Fluttertoast.showToast(
        msg: error.toString(),
      );
    }
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (_) => RegisterPages(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const GeneralLogoSpace(),
                    const SizedBox(
                      height: 60,
                    ),
                    Text(
                      'Forget Password',
                      style: regularTextStyle.copyWith(fontSize: 25),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
                Container(
                  padding: const EdgeInsets.only(top: 200),
                  child: Form(
                    key: _formKey,
                    child: Container(
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
                        controller: _emailTextController,
                        obscureText: false,
                        key: const ValueKey('email'),
                        decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.email),
                          border: InputBorder.none,
                          hintText: 'Enter your email',
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
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                ButtonPrimary(
                  text: 'OK',
                  onTap: _trySubmit,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
