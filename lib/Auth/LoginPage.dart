import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tajakhabar/Auth/OTPscrren.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

TextEditingController numberController = TextEditingController();

class _LoginPageState extends State<LoginPage> {
  String? verificationId; // To store the verification ID for OTP

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 18),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: Image.asset(
                  "assets/login.png",
                  height: height * .5,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Center(
                child: Text(
                  "Login With Number:",
                  style: TextStyle(
                      color: Colors.teal,
                      fontSize: 17,
                      fontWeight: FontWeight.w600),
                ),
              ),
              SizedBox(height: height * .04),
              TextFormField(
                keyboardType: TextInputType.phone,
                controller: numberController,
                onTapOutside: (PointerDownEvent event) {
                  FocusManager.instance.primaryFocus?.unfocus();
                },
                decoration: InputDecoration(
                  hintText: "Enter Your Number",
                  label: const Text("Number"),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
              SizedBox(height: height * .04),
              Center(
                child: Container(
                  height: height * .06,
                  width: width * .5,
                  decoration: BoxDecoration(
                      color: Colors.teal,
                      borderRadius: BorderRadius.circular(16)),
                  child: Center(
                    child: TextButton(
                      onPressed: () async {
                        String phoneNumber = numberController.text.trim();
                        if (phoneNumber.isEmpty) {
                          // Show an error
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text("Please enter a valid number")),
                          );
                          return;
                        }
                        await FirebaseAuth.instance.verifyPhoneNumber(
                          phoneNumber: phoneNumber,
                          verificationCompleted: (PhoneAuthCredential credential) {
                            // Automatically sign in the user if verification is complete
                            FirebaseAuth.instance.signInWithCredential(credential).then((_) {
                              // Navigate to the main app screen or wherever appropriate
                            });
                          },
                          verificationFailed: (FirebaseAuthException e) {
                            // Show an error
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text("Verification Failed: ${e.message}")),
                            );
                          },
                          codeSent: (String verificationId, int? resendToken) {
                            this.verificationId = verificationId; // Save verification ID
                            // Navigate to OTP screen with the verification ID
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => OtpScrren(verificationId: verificationId),
                              ),
                            );
                          },
                          codeAutoRetrievalTimeout: (String verificationId) {
                            this.verificationId = verificationId; // Save verification ID
                          },
                        );
                      },
                      child: Text(
                        "Login",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// keytool -list -v -keystore "C:\Users\<YourUsername>\.android\debug.keystore" -alias androiddebugkey -storepass android -keypass android
