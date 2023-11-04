import 'package:flutter/material.dart';
import 'package:login/main.dart';
import './service.dart';

void main() => runApp(Sing());

class Sing extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SignupScreen(),
    );
  }
}

class SignupScreen extends StatefulWidget {
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController name = TextEditingController();
  final TextEditingController address = TextEditingController();
  final TextEditingController age = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  Servicel service = Servicel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Sign Up'),
          backgroundColor: Colors.black87,
          leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) {
                      return HomePage();
                    },
                  ),
                );
              })),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextField(
                controller: name,
                decoration: InputDecoration(
                  labelText: 'Name',
                ),
              ),
              SizedBox(height: 16.0),
              TextField(
                controller: age,
                decoration: InputDecoration(
                  labelText: 'Age',
                ),
              ),
              TextField(
                controller: address,
                decoration: InputDecoration(
                  labelText: 'Address',
                ),
              ),
              SizedBox(height: 16.0),
              TextField(
                controller: email,
                decoration: InputDecoration(
                  labelText: 'Email',
                ),
              ),
              SizedBox(height: 16.0),
              TextField(
                controller: password,
                decoration: InputDecoration(
                  labelText: 'Password',
                ),
                obscureText: true,
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  service
                      .saveUser(name.text, address.text, age.text, email.text,
                          password.text)
                      .then((response) {
                    if (response.statusCode == 200) {
                      // หากลงทะเบียนเรียบร้อย
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomePage(),
                        ),
                      );
                    } else {
                      // หากมีข้อผิดพลาดในการลงทะเบียน
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text("Registration Failed"),
                            content:
                                Text("Failed to register. Please try again."),
                            actions: [
                              TextButton(
                                child: Text("OK"),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                            ],
                          );
                        },
                      );
                    }
                  });
                },
                child: Text('Sign Up'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
