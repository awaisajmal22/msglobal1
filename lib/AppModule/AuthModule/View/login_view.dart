import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';

import '../ViewModel/login_view_model.dart';

class LoginView extends StatelessWidget {
  LoginView({super.key});
  final loginVM = Get.put(LoginViewModel());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.all(50),
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.30,
          ),
          Image.asset(
            'assets/leram.png',
            height: 150,
            width: 150,
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            color: Colors.grey.withAlpha(50),
            child: TextField(
              controller: loginVM.emailController,
              style: const TextStyle(
                  color: Colors.black, fontWeight: FontWeight.w500),
              decoration: InputDecoration(
                  hintText: 'Email',
                  hintStyle: const TextStyle(
                      color: Colors.black, fontWeight: FontWeight.w400),
                  border: InputBorder.none,
                  fillColor: Colors.grey.withAlpha(50),
                  filled: true,
                  errorBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  focusedErrorBorder: InputBorder.none),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            color: Colors.grey.withAlpha(50),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    obscureText: loginVM.isObsecure.value,
                    controller: loginVM.passwordController,
                    style: const TextStyle(
                        color: Colors.black, fontWeight: FontWeight.w500),
                    decoration: InputDecoration(
                        hintText: 'Password',
                        hintStyle: const TextStyle(
                            color: Colors.black, fontWeight: FontWeight.w400),
                        border: InputBorder.none,
                        fillColor: Colors.grey.withAlpha(50),
                        filled: true,
                        errorBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                        focusedErrorBorder: InputBorder.none),
                  ),
                ),
                Obx(
                  () => GestureDetector(
                      onTap: () {
                        loginVM.isObsecure.value = !loginVM.isObsecure.value;
                      },
                      child: Icon(loginVM.isObsecure.value
                          ? Icons.visibility
                          : Icons.visibility_off)),
                ),
                const SizedBox(
                  width: 10,
                )
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.all(10),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30))),
              onPressed: () {
                if (loginVM.emailController.text.isNotEmpty &&
                    loginVM.passwordController.text.isNotEmpty) {
                  loginVM.handleSignIn(loginVM.emailController.text,
                      loginVM.passwordController.text, context);
                }
              },
              child: const Center(
                child: Text(
                  'Login',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ))
        ],
      ),
    );
  }
}
