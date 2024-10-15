// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:pinput/pinput.dart';
// import 'package:firebase_auth/firebase_auth.dart';
//
// class OtpScrren extends StatefulWidget {
//   final String verificationId; // Pass verification ID from previous screen
//
//   const OtpScrren({super.key, required this.verificationId});
//
//   @override
//   State<OtpScrren> createState() => _OtpScrrenState();
// }
//
// class _OtpScrrenState extends State<OtpScrren> {
//   final TextEditingController otpController = TextEditingController();
//   bool isLoading = false;
//
//   Future<void> verifyOtp() async {
//     setState(() {
//       isLoading = true;
//     });
//     try {
//       final credential = PhoneAuthProvider.credential(
//         verificationId: widget.verificationId,
//         smsCode: otpController.text.trim(),
//       );
//       await FirebaseAuth.instance.signInWithCredential(credential);
//       // Navigate to the next screen after successful verification
//     } catch (e) {
//       // Handle verification failure (show error message)
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text("Invalid OTP, please try again")),
//       );
//     } finally {
//       setState(() {
//         isLoading = false;
//       });
//     }
//   }
//
//   void resendOtp() {
//     // Logic to resend the OTP
//     // This can involve calling a method to send the OTP again
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(content: Text("OTP resent!")),
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final height = MediaQuery.of(context).size.height;
//     final width = MediaQuery.of(context).size.width;
//
//     return Scaffold(
//       body: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 40),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             SizedBox(height: height * .2),
//             Center(
//               child: Text(
//                 "Verification",
//                 style: TextStyle(
//                     color: Colors.teal, fontSize: 17, fontWeight: FontWeight.w600),
//               ),
//             ),
//             SizedBox(height: height * .01),
//             Center(
//               child: Text(
//                 "Enter the code sent to your number",
//                 style: TextStyle(
//                   color: Colors.teal, fontSize: 17,
//                 ),
//               ),
//             ),
//             SizedBox(height: height * .1),
//             Center(
//               child: Pinput(
//                 controller: otpController,
//                 defaultPinTheme: PinTheme(
//                   width: 56,
//                   height: 56,
//                   textStyle: TextStyle(
//                       fontSize: 20,
//                       color: Colors.black,
//                       fontWeight: FontWeight.w600),
//                   decoration: BoxDecoration(
//                     border: Border.all(
//                       color: Colors.teal,
//                     ),
//                     borderRadius: BorderRadius.circular(20),
//                   ),
//                 ),
//               ),
//             ),
//             SizedBox(height: height * .05),
//             Center(
//               child: Text(
//                 "Didn't receive code?",
//                 style: TextStyle(color: Colors.teal, fontSize: 17),
//               ),
//             ),
//             SizedBox(height: height * .02),
//             GestureDetector(
//               onTap: resendOtp,
//               child: Center(
//                 child: Text(
//                   "Resend",
//                   style: TextStyle(
//                     decoration: TextDecoration.underline,
//                     color: Colors.teal, fontSize: 17,
//                   ),
//                 ),
//               ),
//             ),
//             SizedBox(height: height * .05),
//             isLoading
//                 ? CircularProgressIndicator()
//                 : ElevatedButton(
//               onPressed: verifyOtp,
//               child: Text("Verify OTP"),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
