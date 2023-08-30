import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Model/user_model.dart';
import '../../../Network/api_services.dart';
import '../../HomeModule/View/home_view.dart';

class LoginViewModel extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  RxBool isObsecure = true.obs;
  final UserModel model = UserModel();
  final shouldShowSnackbar = true.obs;
  void handleSignIn(String email, String password, BuildContext context) async {
    final response = await ApiService().signIn();
    List<UserModel> userList = (json.decode(response.body) as List)
        .map((json) => UserModel.fromJson(json))
        .toList();
    // parsedData.map((userJson) => UserModel.fromJson(userJson)).toList();
    for (UserModel user in userList) {
      if (user.username == email && user.username == password) {
     
   
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) =>  HomeView(id: user.id!,address: user.street!, name: user.name!, username: user.username!, zipCode: user.zipcode!,),
            ));
      } else {
        if (shouldShowSnackbar.value) {
          Get.showSnackbar(
            GetBar(
              message: 'Something went Wrong..',
              duration: Duration(seconds: 3),
              isDismissible: true,
            ),
          );
          shouldShowSnackbar.value = false;
        }
      }
    }
  }
}
