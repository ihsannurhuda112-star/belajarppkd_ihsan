import 'package:belajarppkd_ihsan/day%2015/login_button.dart';
import 'package:belajarppkd_ihsan/day%2017/pendaftaran.dart';
import 'package:flutter/material.dart';

class LoginScreenWidget extends StatefulWidget {
  const LoginScreenWidget({super.key});

  @override
  State<LoginScreenWidget> createState() => _LoginScreenWidgetState();
}

class _LoginScreenWidgetState extends State<LoginScreenWidget> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController domController = TextEditingController();
  final TextEditingController noHp = TextEditingController();
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
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Welcome Back",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: const Color.fromARGB(255, 15, 15, 15),
                      height: (12),
                    ),
                  ),
                  height(5),
                  buildTitle("Nama"),
                  height(5),
                  buildTextField(
                    hintText: "Enter your name",
                    controller: nameController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Nama tidak boleh kosong";
                      }
                      return null;
                    },
                  ),
                  Text(
                    "Login to access your account",
                    style: TextStyle(
                      fontSize: 15,
                      color: const Color.fromARGB(255, 12, 12, 12),
                    ),
                  ),
                  height(5),
                  buildTitle("Email Address"),
                  height(5),
                  buildTextField(
                    hintText: "Enter your email",
                    controller: emailController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Email tidak boleh kosong";
                      } else if (!value.contains('@')) {
                        return "Email tidak valid";
                      } else if (!RegExp(
                        r"^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$",
                      ).hasMatch(value)) {
                        return "Format Email tidak valid";
                      }
                      return null;
                    },
                  ),
                  height(5),
                  buildTitle("Domisili"),
                  height(5),
                  buildTextField(
                    hintText: "Enter your domisili",
                    controller: domController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Domisili tidak boleh kosong";
                      }
                      return null;
                    },
                  ),
                  height(5),
                  buildTitle("Phone"),
                  height(5),
                  buildTextField(hintText: "Enter your phone number"),

                  height(5),
                  LoginButtonWidget(
                    text: "Login",
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        // print(nameController.text);
                        // print(domController.text);
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) => PendaftaranWidget(
                        //       name: nameController.text,
                        //       dom: domController.text,
                        //     ),
                        //   ),
                        // );
                        // SizedBox(height: 50);
                        // ElevatedButton(
                        //   onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: Text("The data true?"),
                                content: Text(
                                  "Nama: ${nameController.text}\n"
                                  "Email: ${emailController.text}\n"
                                  "No.Hp: ${noHp.text}\n"
                                  "Domisili: ${domController.text}",
                                ),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: Text("kembali"),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) {
                                            return PendaftaranWidget(
                                              name: nameController.text,
                                              dom: domController.text,
                                            );
                                          },
                                        ),
                                      );
                                    },
                                    child: Text("proses"),
                                  ),
                                ],
                              );
                            },
                          );
                        }

                        // child: Text("submit"),
                      } else {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: Text("Validasi eror"),
                              content: Text("Isi semuanya lah"),
                              actions: [
                                TextButton(
                                  child: Text("Balik"),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                ),
                              ],
                            );
                          },
                        );
                      }
                    },
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
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/putihbunga.jpg"),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  TextFormField buildTextField({
    String? hintText,
    TextEditingController? controller,
    String? Function(String?)? validator,
    TextInputType? input,
  }) {
    return TextFormField(
      validator: validator,
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(32),
          borderSide: BorderSide(
            color: const Color.fromARGB(255, 10, 10, 10).withOpacity(0.2),
            width: 1.0,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(32),
          borderSide: BorderSide(
            color: const Color.fromARGB(255, 12, 12, 12),
            width: 1.0,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(32),
          borderSide: BorderSide(
            color: const Color.fromARGB(255, 17, 17, 17).withOpacity(0.2),
            width: 1.0,
          ),
        ),
      ),
    );
  }

  SizedBox height(double height) => SizedBox(height: height);
  SizedBox width(double width) => SizedBox(width: width);

  Widget buildTitle(String text) {
    return Row(
      children: [
        // Text(text, style: TextStyle(fontSize: 12, color: AppColor.gray88)),
      ],
    );
  }
}
