import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:ttt/app/routes/app_pages.dart';

class LogInPageController extends GetxController {
  TextEditingController emailController =
      TextEditingController(text: 'hello@hello.com');
  TextEditingController passController =
      TextEditingController(text: 'hellohello');

  void login() {
    FirebaseAuth.instance
        .signInWithEmailAndPassword(
          email: emailController.text,
          password: passController.text,
        )
        .then(
          (UserCredential cred) => Get.offAllNamed(Routes.MAIN_PAGE),
        );
  }
}
