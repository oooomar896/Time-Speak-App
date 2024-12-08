import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:auctions_mulhmah/core/constant/color.dart';
import 'package:auctions_mulhmah/core/constant/routes.dart';
import 'package:auctions_mulhmah/core/services/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:path/path.dart' as path;

abstract class SinUpController extends GetxController {
  signUpValid();
  goToLogin();
  goToHome();
  void setImageFile(File? file);  // Add this method to the abstract class
}

class SinUpControllerImp extends SinUpController {
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  late TextEditingController email;
  late TextEditingController username;
  late TextEditingController phone;
  late TextEditingController numberCity;
  late TextEditingController password;
  bool isShowPassword = true;
  File? _imageFile;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  void setImageFile(File? file) {
    _imageFile = file;  // Define the setter method
  }

  showPassword() {
    isShowPassword = !isShowPassword;
    update();
  }

  Future<String?> uploadImage(File image) async {
    try {
      final storageReference = FirebaseStorage.instance
          .ref()
          .child('user_images/${path.basename(image.path)}');
      final uploadTask = storageReference.putFile(image);
      final snapshot = await uploadTask.whenComplete(() => {});
      final downloadUrl = await snapshot.ref.getDownloadURL();
      return downloadUrl;
    } catch (e) {
      Get.snackbar('Error', 'Failed to upload image: $e');
      return null;
    }
  }

  @override
  signUpValid() async {
    var formdata = formState.currentState;
    if (formdata!.validate()) {
      try {
        // Create a new user with Firebase Auth
        UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
          email: email.text,
          password: password.text,
        );

        // Save additional user info to Firestore
        User? user = userCredential.user;
        if (user != null) {
          String? imageUrl;
          if (_imageFile != null) {
            imageUrl = await uploadImage(_imageFile!);
          }
          await FirebaseFirestore.instance.collection('users').doc(user.uid).set({
            'username': username.text,
            'phone': phone.text,
            'email': email.text,
            'numberCity': numberCity.text,
            'profileImage': imageUrl,  // Save the image URL in Firestore
          });
        }

        Get.offNamed(AppRoute.success_signUp);
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          Get.snackbar('Error', 'The password provided is too weak.');
        } else if (e.code == 'email-already-in-use') {
          Get.snackbar('Error', 'An account already exists for that email.');
        }
      } catch (e) {
        Get.snackbar('Error', 'Failed to sign up. Please try again.');
      }
    } else {
      print("=======================not valid");
    }
  }

  @override
  goToLogin() {
    Get.offNamed(AppRoute.login);
  }

  @override
  void onInit() {
    email = TextEditingController();
    password = TextEditingController();
    username = TextEditingController();
    phone = TextEditingController();
    numberCity = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    username.dispose();
    phone.dispose();
    numberCity.dispose();
    super.dispose();
  }

  final MyServices services = Get.find();

  @override
  goToHome() async {
    Get.offAndToNamed(AppRoute.home);
    Get.snackbar(
      padding: const EdgeInsets.all(30),
      'Hi Brother',
      'Welcome in Auction Live',
      icon: const Icon(
        Icons.workspaces,
        color: AppColor.primaryOne,
      ),
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  successo() async {
    Get.offAndToNamed(AppRoute.success_signUp);
  }
}
