import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lawbridge/pages/SignUpScreenForLaywer.dart';
import 'package:lawbridge/pages/SignUpScreenForUser.dart';

class SignUpSelectionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black),
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Sign Up',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'Choose your role to create an account',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[700],
              ),
            ),
            const SizedBox(height: 40),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Add login logic here
                  Get.to(() => SignUpScreenForUser(),
                      transition: Transition.downToUp,
                      duration: const Duration(milliseconds: 800));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFd6a029), // Button color
                  padding:
                      const EdgeInsets.symmetric(horizontal: 100, vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text(
                  'SignUp for User',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Add login logic here
                  Get.to(() => LawyerSignUpScreenForLawyer(),
                      transition: Transition.leftToRight,
                      duration: const Duration(milliseconds: 800));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFd6a029), // Button color
                  padding:
                      const EdgeInsets.symmetric(horizontal: 90, vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text(
                  'SignUp For Laywer',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
