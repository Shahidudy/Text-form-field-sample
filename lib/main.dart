import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TextField Sample',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final TextEditingController emailContrller = TextEditingController();
  final TextEditingController passwordContrller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.red,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('LOGIN'),
            ),
            Container(
              padding: EdgeInsets.only(left: 20),
              margin: EdgeInsets.only(left: 20, right: 20),
              decoration: BoxDecoration(
                  color: Colors.grey, borderRadius: BorderRadius.circular(30)),
              child: TextFormField(
                controller: emailContrller,
                decoration: InputDecoration(
                    border: InputBorder.none, hintText: 'Enter your Email'),
              ),
            ),
            Container(
              padding: EdgeInsets.only(
                left: 20,
              ),
              margin: EdgeInsets.only(left: 20, right: 20, top: 20),
              decoration: BoxDecoration(
                  color: Colors.grey, borderRadius: BorderRadius.circular(30)),
              child: TextFormField(
                controller: passwordContrller,
                decoration: InputDecoration(
                    border: InputBorder.none, hintText: 'Enter your password'),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  login(context);
                },
                child: Text('Login'))
          ],
        ),
      ),
    );
  }

  void login(context) {
    String email = emailContrller.text;
    String password = passwordContrller.text;

    if (email.isNotEmpty || password.isNotEmpty) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (ctx) => HomePage(),
        ),
      );
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Fill the form')));
    }
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [Center(child: Text('You successfully Logged in'))],
      )),
    );
  }
}
