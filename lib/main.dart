import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

TextEditingController controllerLogin = TextEditingController();
TextEditingController controllerPasword = TextEditingController();

String name = "........";

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: const Text('Авторизация'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 80),
                child: Container(
                  height: 500,
                  padding: const EdgeInsets.all(15),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(15),
                        bottomRight: Radius.circular(15)),
                    color: Colors.white,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 310),
                        child: const Text(
                          "Email",
                          style: TextStyle(
                              fontWeight: (FontWeight.bold), fontSize: 20),
                        ),
                      ),
                      const SizedBox(height: 10),
                      NewWidget(
                        controller: controllerLogin,
                        maxLength: 10,
                      ),
                      Row(
                        children: [
                          Text("Password",
                              style: TextStyle(
                                  fontWeight: (FontWeight.bold), fontSize: 20)),
                          Padding(
                            padding: const EdgeInsets.only(left: 160),
                            child: Text(
                              "Forgot password?",
                              style: TextStyle(
                                color: Colors.blue,
                                fontWeight: (FontWeight.bold),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      NewWidget(
                        controller: controllerPasword,
                        maxLength: 10,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      ElevatedButton(
                          onPressed: () {
                            name =
                                "Email: ${controllerLogin.text} Password: ${controllerPasword.text}";
                            setState(() {});
                          },
                          child: SizedBox(
                              width: double.infinity,
                              child: Center(child: Text('Login in')))),
                      Text(name),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 80, left: 100),
              child: Row(
                children: [
                  Text("Don't have an account?",
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  SizedBox(width: 10),
                  Text(
                    "Sign up",
                    style: TextStyle(
                        color: Colors.blue, fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }
}

class NewWidget extends StatelessWidget {
  const NewWidget({
    Key? key,
    required this.controller,
    required this.maxLength,
  }) : super(key: key);

  final TextEditingController controller;
  final int maxLength;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      maxLength: maxLength,
      decoration: const InputDecoration(
        border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(5.0))),
        labelStyle: TextStyle(fontSize: 22),
      ),
    );
  }
}
