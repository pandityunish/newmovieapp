import 'package:flutter/material.dart';
import 'package:movieapp/feauters/login/repository/login_repository.dart';
import 'package:movieapp/feauters/login/widgets/custom_buttom.dart';
import 'package:movieapp/feauters/login/widgets/textform.dart';
import 'package:provider/provider.dart';

class SiginScreen extends StatefulWidget {
  static const String routeName = "sigin-screen";
  const SiginScreen({super.key});

  @override
  State<SiginScreen> createState() => _SiginScreenState();
}

class _SiginScreenState extends State<SiginScreen> {
  bool isvisiable = false;
  final TextEditingController namecontroller = TextEditingController();
  final TextEditingController emailcontroller = TextEditingController();
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
              "Create Account",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 26,
                  color: Colors.white),
            ),
            const SizedBox(
              height: 80,
            ),
            CustomFormField(
                textInputAction: TextInputAction.next,
                inputType: TextInputType.name,
                controller: namecontroller,
                icon: const Icon(Icons.person),
                hinttext: "Enter your name"),
            const SizedBox(
              height: 10,
            ),
            CustomFormField(
                textInputAction: TextInputAction.next,
                inputType: TextInputType.emailAddress,
                controller: emailcontroller,
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
                  Provider.of<LoginRepsitory>(context, listen: false).siginuser(
                      email: emailcontroller.text.trim(),
                      context: context,
                      name: namecontroller.text.trim(),
                      password: emailcontroller.text.trim());
                },
                child: const CustomButton(text: "SigIn")),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Already have an account?",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w500),
                ),
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
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
