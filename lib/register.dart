import 'package:flutter/material.dart';
import 'package:register/login.dart';
import 'package:register/home.dart';

class Register extends StatelessWidget {
  final _form = GlobalKey<FormState>();

  final snackBar = SnackBar(
    content: const Text('Yay! A SnackBar!'),
    action: SnackBarAction(
      label: 'Undo',
      onPressed: () {},
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber.shade100,
      body: Container(
        child: Center(
          child: Container(
            width: 400,
            height: 450,
            padding: EdgeInsets.all(30),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.white,
            ),
            child: Center(
                child: Form(
                    key: _form,
                    child: ListView(
                      children: [
                        TextFormField(
                          decoration: const InputDecoration(
                              icon: Icon(Icons.person),
                              hintText: 'Enter Your Full Name',
                              labelText: 'Full Name'),
                          validator: (text) {
                            if (text == null ||
                                !(text.length <= 5) ||
                                text.isEmpty) {
                              return "Enter full name";
                            }
                            return null;
                          },
                        ),
                        TextFormField(
                          decoration: const InputDecoration(
                              icon: Icon(Icons.mail),
                              hintText: 'Enter Your Mail Id',
                              labelText: 'Mail'),
                          validator: (text) {
                            if (text == null ||
                                !(text.length <= 5) ||
                                text.isEmpty) {
                              return "Enter valid Email";
                            }
                            return null;
                          },
                        ),
                        TextFormField(
                          obscureText: true,
                          obscuringCharacter: "*",
                          decoration: const InputDecoration(
                              icon: Icon(Icons.password),
                              suffix: Icon(Icons.remove_red_eye_rounded),
                              hintText: 'Enter Your Password',
                              labelText: 'Password'),
                          validator: (text) {
                            if (text == null ||
                                !(text.length <= 5) ||
                                text.isEmpty) {
                              return "Enter valid password atmost 5 characters!";
                            }
                            return null;
                          },
                        ),
                        TextFormField(
                          obscureText: true,
                          obscuringCharacter: "*",
                          decoration: const InputDecoration(
                              icon: Icon(Icons.password),
                              suffix: Icon(Icons.remove_red_eye_rounded),
                              hintText: 'Confirm Your Password',
                              labelText: 'Confirm Password'),
                          validator: (text) {
                            if (text == null ||
                                !(text.length <= 5) ||
                                text.isEmpty) {
                              return "Enter valid password atmost 5 characters!";
                            }
                            return null;
                          },
                        ),
                        Container(
                          padding: EdgeInsets.all(10),
                          child: Center(
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary:
                                    Colors.black, // background (button) color

                                onPrimary:
                                    Colors.white, // foreground (text) color
                              ),
                              onPressed: () {
                                final isValid = _form.currentState!.validate();
                                if (isValid) {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Homepage()));
                                } else {
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(snackBar);
                                }
                              },
                              child: Text('Register'),
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Already Register?",
                              style:
                                  TextStyle(color: Colors.black, fontSize: 12),
                            ),
                            new GestureDetector(
                              onTap: () {
                                print("clicked");
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Loginvalidation()),
                                );
                              },
                              child: Text(
                                " Login",
                                style: TextStyle(
                                    color: Colors.red,
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        )
                      ],
                    ))),
          ),
        ),
      ),
    );
  }
}
