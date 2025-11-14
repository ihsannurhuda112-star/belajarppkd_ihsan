import 'package:belajarppkd_ihsan/day%2015/home_screen.dart';
import 'package:belajarppkd_ihsan/day_33/models/login.dart';
import 'package:belajarppkd_ihsan/day_33/service/api.dart';
import 'package:belajarppkd_ihsan/day_33/views/home_screen33.dart';
import 'package:belajarppkd_ihsan/day_33/views/register_screen.dart';
import 'package:belajarppkd_ihsan/preferences/preference_handler.dart';
import 'package:belajarppkd_ihsan/widgets/login_button2.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginScreen33 extends StatefulWidget {
  const LoginScreen33({super.key});
  static const id = "/login_day33";

  @override
  State<LoginScreen33> createState() => _LoginScreen33State();
}

class _LoginScreen33State extends State<LoginScreen33> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool isVisibility = false;
  bool isLoading = false;
  LoginModel33? loginResult;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Stack(children: [buildBackground(), buildLayer()]));
  }

  SafeArea buildLayer() {
    return SafeArea(
      child: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Text(
                    "Welcome Back",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  height(12),
                  Text("Login to access your account"),
                  height(24),

                  // EMAIL
                  buildTextField(
                    hintText: "Enter your email",
                    controller: emailController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Email tidak boleh kosong";
                      }
                      if (!value.contains("@")) {
                        return "Email tidak valid";
                      }
                      return null;
                    },
                  ),

                  height(16),

                  // PASSWORD
                  buildTextField(
                    hintText: "Enter your password",
                    isPassword: true,
                    controller: passwordController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Password tidak boleh kosong";
                      }
                      if (value.length < 6) {
                        return "Password minimal 6 karakter";
                      }
                      return null;
                    },
                  ),

                  height(24),

                  // LOGIN BUTTON
                  LoginButton(
                    text: "Login",
                    isLoading: isLoading,
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        setState(() => isLoading = true);

                        try {
                          final result = await AuthAPI.loginUser(
                            email: emailController.text,
                            password: passwordController.text,
                          );

                          setState(() => loginResult = result);

                          // simpan token
                          PreferenceHandler.saveToken(result.data!.token!);

                          Fluttertoast.showToast(msg: "Login Berhasil");

                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (_) => HomeScreen33Widget(),
                            ),
                          );
                        } catch (e) {
                          Fluttertoast.showToast(msg: e.toString());
                        }

                        setState(() => isLoading = false);
                      }
                    },
                  ),

                  height(16),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Don't have an account?"),
                      TextButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => RegisterScreenDay33(),
                            ),
                          );
                        },
                        child: Text(
                          "Sign Up",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Container buildBackground() {
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/putihbunga.jpg"),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  TextFormField buildTextField({
    String? hintText,
    bool isPassword = false,
    TextEditingController? controller,
    String? Function(String?)? validator,
  }) {
    return TextFormField(
      validator: validator,
      controller: controller,
      obscureText: isPassword ? !isVisibility : false,
      decoration: InputDecoration(
        hintText: hintText,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32)),
        suffixIcon: isPassword
            ? IconButton(
                icon: Icon(
                  isVisibility ? Icons.visibility : Icons.visibility_off,
                ),
                onPressed: () {
                  setState(() => isVisibility = !isVisibility);
                },
              )
            : null,
      ),
    );
  }

  SizedBox height(double value) => SizedBox(height: value);
}
