import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onlinetest/screens/register_page.dart';

import '../bloc/login_bloc.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return
      MultiBlocProvider(
        providers: [BlocProvider(create: (context) => LoginBloc())],
        child: Scaffold(backgroundColor: Colors.white, body: LoginForm())
      );
  }
}

class LoginForm extends StatelessWidget {
  LoginForm({Key? key}) : super(key: key);

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state is LoginSuccess) {
          ScaffoldMessenger.of(context)
              .showSnackBar(const SnackBar(content: Text('Login Success')));
        }
        if (state is LoginFailed) {
          ScaffoldMessenger.of(context)
              .showSnackBar(const SnackBar(content: Text('Login Failed')));
        }
      },
      child: Center(
          child: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "LOGIN",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30.0),
            ),
            SizedBox(height: 50),
            usernameField(),
            SizedBox(height: 20),
            passwordField(),
            SizedBox(height: 20),
            loginButton(context),
            SizedBox(height: 30),
            textButton(context),
          ],
        ),
      )),
    );
  }

  Widget loginButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        context.read<LoginBloc>().add(
              LoginSubmit(
                  username: usernameController.text,
                  password: passwordController.text),
            );
      },
      child: Text(
        "LOGIN",
        style: TextStyle(color: Colors.white),
      ),
      style: ElevatedButton.styleFrom(
        minimumSize: const Size.fromHeight(50),
        primary: Colors.amber,
      ),
    );
  }

  Widget textButton(BuildContext context) {
    return TextButton(
      onPressed: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => RegisterPage()));
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "Don't have an account? ",
            style: TextStyle(color: Colors.black),
          ),
          Text(
            "Register here",
            style: TextStyle(color: Colors.amber),
          )
        ],
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
