import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../utils.dart';
import 'Forget.dart';
import 'Users.dart';

class Login extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<Login> {
  bool userIsWrong = false;
  var userController = TextEditingController();

  var passwordController = TextEditingController();

  String user = "Ali";
  String pass = "123456";

  checkUser(BuildContext context) {
    if (userController.text == user && passwordController.text == pass) {
      userIsWrong = false;
      go(context, UsersScreen());
    } else {
      userIsWrong = true;
      setState(() {});
    }
    userController.clear();
    passwordController.clear();
    FocusScope.of(context).unfocus();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Log In',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Facebook'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Center(
            child: ListView(
              children: <Widget>[
                TextField(
                  onSubmitted: (txt) {
                    checkUser(context);
                  },
                  controller: userController,
                  decoration:
                      InputDecoration(labelText: 'Email or Phone number'),
                ),
                Padding(padding: EdgeInsets.all(10)),
                TextField(
                  onSubmitted: (txt) {
                    checkUser(context);
                  },
                  decoration: InputDecoration(labelText: 'Password'),
                  obscureText: true,
                  controller: passwordController,
                ),
                Padding(padding: EdgeInsets.all(15)),
                ElevatedButton(
                    child: Text('Login'),
                    onPressed: () {
                      checkUser(context);
                    }),
                Padding(padding: EdgeInsets.all(10)),
                TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                ForgetScreen(userController.text)),
                      );
                    },
                    child: Text('Forget Password?')),
                Padding(padding: EdgeInsets.all(10)),
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        userIsWrong ? 'Wrong email or password' : '',
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                ), //place for incorrect email announce
              ],
            ),
          ),
        ),
      ),
    );
  }
}
