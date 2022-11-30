import 'package:flutter/material.dart';
import 'package:movieapp/feauters/login/repository/login_repository.dart';
import 'package:movieapp/feauters/login/screens.dart/sigin_screen.dart';
import 'package:movieapp/feauters/login/widgets/custom_buttom.dart';
import 'package:movieapp/feauters/login/widgets/textform.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = "login-screen";
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isvisiable = true;
  final TextEditingController namecontroller = TextEditingController();
  final TextEditingController passwordcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 70,
            ),
            const Text(
              "Welcome To MovieApp",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 26,
                  color: Colors.white),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.26,
            ),
            CustomFormField(
                textInputAction: TextInputAction.next,
                controller: namecontroller,
                inputType: TextInputType.emailAddress,
                icon: const Icon(Icons.email),
                hinttext: "Enter your email"),
            const SizedBox(
              height: 10,
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(10)),
              width: MediaQuery.of(context).size.width * 0.9,
              child: TextFormField(
                controller: passwordcontroller,
                obscureText: isvisiable,
                decoration: InputDecoration(
                    hintText: "Enter password",
                    prefixIcon: const Icon(Icons.lock),
                    suffixIcon: IconButton(
                        onPressed: () {
                          isvisiable = !isvisiable;
                          setState(() {});
                        },
                        icon: isvisiable
                            ? const Icon(Icons.visibility)
                            : const Icon(Icons.visibility_off)),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            InkWell(
                onTap: () {
                  Provider.of<LoginRepsitory>(context, listen: false).loginuser(
                      password: passwordcontroller.text.trim(),
                      email: namecontroller.text.trim(),
                      context: context);
                },
                child: const CustomButton(text: "Login")),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Don't have an account?",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w500),
                ),
                TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, SiginScreen.routeName);
                    },
                    child: const Text("SigIn"))
              ],
            )
          ],
        ),
      ),
    );
  }
}
