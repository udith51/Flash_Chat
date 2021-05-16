import 'package:flash_chat/Screens/Chat_Screen.dart';
import 'package:flutter/material.dart';
import '../Components/Reusable_TextField.dart';
import '../Components/Rounded_Button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class RegistrationScreen extends StatefulWidget {
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _auth = FirebaseAuth.instance;
  String email;
  String password;
  bool isSpinning = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        inAsyncCall: isSpinning,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Flexible(
                  child: Hero(
                    tag: 'logo',
                    child: Container(
                      height: 200,
                      child: Image(
                        image: AssetImage('images/logo.png'),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 40),
                ReusableTextField(
                  keyBoardType: TextInputType.emailAddress,
                  obscureText: false,
                  hint: 'Enter your Email',
                  onChanged: (value) {
                    email = value;
                  },
                ),
                SizedBox(height: 8),
                ReusableTextField(
                  keyBoardType: TextInputType.text,
                  obscureText: true,
                  hint: 'Enter your Password',
                  onChanged: (value) {
                    password = value;
                  },
                ),
                SizedBox(height: 24),
                RoundedButton(
                  text: 'Register',
                  onPressed: () async {
                    setState(() {
                      isSpinning = true;
                    });
                    try {
                      final newUser =
                          await _auth.createUserWithEmailAndPassword(
                              email: email, password: password);
                      if (newUser != null) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return ChatScreen();
                            },
                          ),
                        );
                      }
                    } catch (e) {
                      print(e);
                    }
                    setState(() {
                      isSpinning = false;
                    });
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
