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
    UserModel? matchingEmail = userList.firstWhere(
      (element) => element.email == email && element.username == password,
    );
    if (matchingEmail != null) {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => HomeView(
              id: matchingEmail.id!,
              address: "${matchingEmail.street!} ${matchingEmail.suite}\n${matchingEmail.city}",
              name: matchingEmail.name!,
              username: matchingEmail.username!,
              zipCode: matchingEmail.zipcode!,
            ),
          ));
    } else {
      return;
    }
  }
}
