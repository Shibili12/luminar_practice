import 'package:flutter/material.dart';

class Loginscreen extends StatefulWidget {
  const Loginscreen({super.key});

  @override
  State<Loginscreen> createState() => _LoginscreenState();
}

class _LoginscreenState extends State<Loginscreen> {
  bool nopasswordvisiblity = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
          child: Center(
        child: Padding(
          padding: const EdgeInsets.all(11),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 200,
              ),
              Image.asset(
                "assets/images/instagram2.png",
                width: 200,
              ),
              SizedBox(
                height: 50,
              ),
              TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Phone number,Email or Username",
                ),
              ),
              SizedBox(
                height: 7,
              ),
              TextFormField(
                obscureText: nopasswordvisiblity,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "password",
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        if (nopasswordvisiblity == true) {
                          nopasswordvisiblity = false;
                        } else {
                          nopasswordvisiblity = true;
                        }
                      });
                    },
                    icon: Icon(nopasswordvisiblity == true
                        ? Icons.visibility_off
                        : Icons.visibility),
                  ),
                ),
              ),
              SizedBox(
                height: 7,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(minimumSize: Size(400, 50)),
                onPressed: () {},
                child: Text(
                  "Login",
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  "Do you haven't account? Sign up",
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ),
              Text(
                "OR",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              TextButton(
                  onPressed: () {},
                  child: Text(
                    "Login with the Facebook",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )),
            ],
          ),
        ),
      )),
    );
  }
}
