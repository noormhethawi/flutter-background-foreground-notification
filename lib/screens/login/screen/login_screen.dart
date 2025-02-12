import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/core/constData/app_colors.dart';
import '/screens/login/controller/login_controller.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPallete.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
            top: 80,
            left: 20,
            right: 20,
          ),
          child: Center(
            child: Column(
              children: [
                const Text(
                  "Login",
                  style: TextStyle(
                    color: ColorPallete.teal,
                    fontWeight: FontWeight.bold,
                    fontSize: 33,
                  ),
                ),
                const SizedBox(
                  height: 18,
                ),
                const Text(
                  "login to receive notifications",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: ColorPallete.deepOrange,
                    fontSize: 22,
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                GetBuilder(
                    init: LoginController(),
                    builder: (controller) {
                      return Form(
                        key: controller.formState,
                        child: Column(
                          children: [
                            TextFormField(
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                prefixIcon: Icon(
                                  Icons.email,
                                  color: ColorPallete.teal,
                                ),
                                labelText: "Email",
                                hintText: "Enter email",
                              ),
                              keyboardType: TextInputType.emailAddress,
                              onSaved: (value) =>
                                  controller.emailController.text = value!,
                              controller: controller.emailController,
                              validator: controller.validateEmail,
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            TextFormField(
                              decoration: InputDecoration(
                                border: const OutlineInputBorder(),
                                prefixIcon: IconButton(
                                  color: ColorPallete.teal,
                                  onPressed: () => controller.obscureFunc(),
                                  icon: Icon(controller.obscure
                                      ? Icons.visibility_off
                                      : Icons.visibility),
                                ),
                                labelText: "Password",
                                hintText: "Enter your password",
                              ),
                              obscureText: controller.obscure,
                              onSaved: (value) =>
                                  controller.passwordController.text = value!,
                              validator: controller.validatePassword,
                              controller: controller.passwordController,
                            ),
                            const SizedBox(
                              height: 50,
                            ),
                            InkWell(
                              onTap: () {
                                controller.signIn();
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  color: ColorPallete.btnColor,
                                  border: Border.all(),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                width: double.infinity,
                                height: 50,
                                child: Center(
                                  child: controller.isLoading
                                      ? const CircularProgressIndicator()
                                      : const Text(
                                          "LogIn",
                                          style: TextStyle(
                                            fontSize: 20,
                                            color: ColorPallete.teal,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
