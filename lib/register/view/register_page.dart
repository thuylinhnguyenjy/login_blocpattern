import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onlinetest/login/view/login_page.dart';
import 'package:onlinetest/register/bloc/register_bloc.dart';

import '../../models/usermodel.dart';
import '../../viewmodels/registerviewmodel.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [BlocProvider(create: (context) => RegisterBloc())],
        child: Scaffold(backgroundColor: Colors.white, body: RegisterForm()));
  }
}

class RegisterForm extends StatelessWidget {
  RegisterForm({Key? key}) : super(key: key);

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterBloc, RegisterState>(
      listener: (context, state) {
        if (state is RegisterSuccess) {
          ScaffoldMessenger.of(context)
              .showSnackBar(const SnackBar(content: Text('Register Success')));
        }
        if (state is RegisterFailed) {
          ScaffoldMessenger.of(context)
              .showSnackBar(const SnackBar(content: Text('Register Failed')));
        }
      },
      child: Center(
          child: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "REGISTER",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30.0),
            ),
            SizedBox(height: 50),
            usernameField(),
            SizedBox(height: 20),
            passwordField(),
            SizedBox(height: 20),
            registerButton(context),
            SizedBox(height: 30),
            TextButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => LoginPage()));
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Have an account? ",
                    style: TextStyle(color: Colors.black),
                  ),
                  Text(
                    "Login here",
                    style: TextStyle(color: Colors.amber),
                  )
                ],
              ),
            )
          ],
        ),
      )),
    );
  }

  Widget registerButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        context.read<RegisterBloc>().add(
          AddUser(
              username: usernameController.text,
              password: passwordController.text),
        );
      },
      child: Text(
        "REGISTER",
        style: TextStyle(color: Colors.white),
      ),
      style: ElevatedButton.styleFrom(
        minimumSize: const Size.fromHeight(50),
        primary: Colors.amber,
      ),
    );
  }

  Widget usernameField() {
    return TextField(
      controller: usernameController,
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(color: Colors.amber),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(color: Colors.amber),
        ),
        prefixIcon: Icon(
          Icons.person,
          color: Colors.amber,
        ),
        hintText: 'Enter username: ',
      ),
    );
  }

  Widget passwordField() {
    return TextField(
      controller: passwordController,
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(color: Colors.amber),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(color: Colors.amber),
        ),
        prefixIcon: Icon(
          Icons.lock,
          color: Colors.amber,
        ),
        hintText: 'Enter password: ',
      ),
    );
  }
}
