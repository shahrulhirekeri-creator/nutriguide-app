import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final mobileController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  bool hidePassword = true;
  bool hideConfirmPassword = true;

  void registerUser() {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Registration Successful")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("NutriGuide"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 24),

            /// LOGO
            Image.asset(
              "assets/images/logo.png",
              height: 70,
            ),

            const SizedBox(height: 14),

            /// TITLE
            const Text(
              "Create Account",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w600,
              ),
            ),

            const SizedBox(height: 24),

            /// SHORT FORM
            Center(
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.75, // 🔑 SHORT WIDTH
                child: Card(
                  elevation: 6,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 18, vertical: 22),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          /// NAME
                          TextFormField(
                            controller: nameController,
                            decoration: const InputDecoration(
                              labelText: "Full Name",
                              suffixIcon: Icon(Icons.person),
                            ),
                            validator: (v) =>
                                v == null || v.isEmpty ? "Required" : null,
                          ),
                          const SizedBox(height: 14),

                          /// EMAIL
                          TextFormField(
                            controller: emailController,
                            decoration: const InputDecoration(
                              labelText: "Email",
                              suffixIcon: Icon(Icons.email),
                            ),
                            validator: (v) {
                              if (v == null || v.isEmpty) return "Required";
                              if (!v.contains('@')) return "Invalid email";
                              return null;
                            },
                          ),
                          const SizedBox(height: 14),

                          /// MOBILE
                          TextFormField(
                            controller: mobileController,
                            keyboardType: TextInputType.phone,
                            decoration: const InputDecoration(
                              labelText: "Mobile",
                              suffixIcon: Icon(Icons.phone),
                            ),
                            validator: (v) {
                              if (v == null || v.isEmpty) return "Required";
                              if (v.length != 10) return "10 digits only";
                              return null;
                            },
                          ),
                          const SizedBox(height: 14),

                          /// PASSWORD
                          TextFormField(
                            controller: passwordController,
                            obscureText: hidePassword,
                            decoration: InputDecoration(
                              labelText: "Password",
                              suffixIcon: IconButton(
                                icon: Icon(
                                  hidePassword
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                ),
                                onPressed: () {
                                  setState(() {
                                    hidePassword = !hidePassword;
                                  });
                                },
                              ),
                            ),
                            validator: (v) {
                              if (v == null || v.isEmpty) return "Required";
                              if (v.length < 6) return "Min 6 characters";
                              return null;
                            },
                          ),
                          const SizedBox(height: 14),

                          /// CONFIRM PASSWORD
                          TextFormField(
                            controller: confirmPasswordController,
                            obscureText: hideConfirmPassword,
                            decoration: InputDecoration(
                              labelText: "Confirm Password",
                              suffixIcon: IconButton(
                                icon: Icon(
                                  hideConfirmPassword
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                ),
                                onPressed: () {
                                  setState(() {
                                    hideConfirmPassword =
                                        !hideConfirmPassword;
                                  });
                                },
                              ),
                            ),
                            validator: (v) {
                              if (v == null || v.isEmpty) return "Required";
                              if (v != passwordController.text) {
                                return "Passwords do not match";
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 22),

                          /// REGISTER BUTTON
                          SizedBox(
                            width: double.infinity,
                            height: 42,
                            child: ElevatedButton(
                              onPressed: registerUser,
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                              child: const Text("Register"),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 18),

            /// LOGIN LINK
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Already registered? "),
                TextButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, '/login');
                  },
                  child: const Text("Login"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}









