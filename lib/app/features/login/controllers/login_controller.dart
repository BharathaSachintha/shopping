import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:shopping/app/config/routes/app_pages.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginController extends GetxController {
  final _auth = FirebaseAuth.instance;
  final _googleSignIn = GoogleSignIn();
  final isLoading = false.obs;

  Future login() async {
    final user = await _googleSignIn.signIn();
    isLoading.value = true;

    if (user != null) {
      final googleAuth = await user.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      await _auth.signInWithCredential(credential);
      await FirebaseFirestore.instance.collection("users").doc(_auth.currentUser!.uid).set({
        "uid": _auth.currentUser!.uid.toString(),
        "username": _auth.currentUser!.displayName.toString(),
        "email": _auth.currentUser!.email.toString(),
        "profile": _auth.currentUser!.photoURL.toString(),
        "cart_total": "0"
      });
    }

    if (_auth.currentUser != null) {
      Get.offNamed(Routes.home);
    } else {
      Get.snackbar("Error", "Sign In Failed");
    }

    isLoading.value = false;
  }
}
