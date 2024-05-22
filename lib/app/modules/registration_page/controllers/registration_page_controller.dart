import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:ttt/app/routes/app_pages.dart';

class FirestoreServices {
  static saveUser(String name, email, uid) async {
    await FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .set({'email': email, 'name': name, 'played': 0, 'won': 0});
  }
}

class RegistrationPageController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController username = TextEditingController();

  void register() {
    FirebaseAuth.instance
        .createUserWithEmailAndPassword(
      email: emailController.text,
      password: passController.text,
    )
        .then(
      (UserCredential cred) {
        FirestoreServices.saveUser(
          username.text,
          emailController.text,
          cred.user?.uid,
        );
        Get.offAllNamed(Routes.MAIN_PAGE);
      },
    );
  }
}
