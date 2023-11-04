import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import './service.dart';
import 'package:login/success.dart';
import 'package:login/singup.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    ));

class HomePage extends StatelessWidget {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  Service service = Service();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              children: <Widget>[
                Container(
                  height: 400,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/images/background.png'),
                          fit: BoxFit.fill)),
                  child: Stack(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            height: 50,
                          ),
                          CircleAvatar(
                            radius: 20,
                            backgroundColor: Color(0xff4c505b),
                            child: IconButton(
                                color: Colors.white,
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (BuildContext context) {
                                        return Sing();
                                      },
                                    ),
                                  );
                                },
                                icon: Icon(
                                  Icons.arrow_forward,
                                )),
                          )
                        ],
                      ),
                      Positioned(
                        left: 30,
                        width: 80,
                        height: 200,
                        child: FadeInUp(
                            duration: Duration(seconds: 1),
                            child: Container(
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                          'assets/images/light-1.png'))),
                            )),
                      ),
                      Positioned(
                        left: 140,
                        width: 80,
                        height: 150,
                        child: FadeInUp(
                            duration: Duration(milliseconds: 1200),
                            child: Container(
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                          'assets/images/light-2.png'))),
                            )),
                      ),
                      Positioned(
                        right: 40,
                        top: 40,
                        width: 80,
                        height: 150,
                        child: FadeInUp(
                            duration: Duration(milliseconds: 1300),
                            child: Container(
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                          'assets/images/clock.png'))),
                            )),
                      ),
                      Positioned(
                        child: FadeInUp(
                            duration: Duration(milliseconds: 1600),
                            child: Container(
                              margin: EdgeInsets.only(top: 50),
                              child: Center(
                                child: Text(
                                  "Login",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 40,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            )),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(30.0),
                  child: Column(
                    children: <Widget>[
                      FadeInUp(
                          duration: Duration(milliseconds: 1800),
                          child: Container(
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                    color: Color.fromRGBO(143, 148, 251, 1)),
                                boxShadow: [
                                  BoxShadow(
                                      color: Color.fromRGBO(143, 148, 251, .2),
                                      blurRadius: 20.0,
                                      offset: Offset(0, 10))
                                ]),
                            child: Column(
                              children: <Widget>[
                                Container(
                                  padding: EdgeInsets.all(8.0),
                                  decoration: BoxDecoration(
                                      border: Border(
                                          bottom: BorderSide(
                                              color: Color.fromRGBO(
                                                  143, 148, 251, 1)))),
                                  child: TextField(
                                    controller: emailController,
                                    decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintText: "Email or Phone number",
                                        hintStyle:
                                            TextStyle(color: Colors.grey[700])),
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.all(8.0),
                                  child: TextField(
                                    controller: passwordController,
                                    obscureText: true,
                                    decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintText: "Password",
                                        hintStyle:
                                            TextStyle(color: Colors.grey[700])),
                                  ),
                                )
                              ],
                            ),
                          )),
                      SizedBox(
                        height: 30,
                      ),
                      FadeInUp(
                        duration: Duration(milliseconds: 1900),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Color.fromRGBO(143, 148, 251, 1),
                            onPrimary: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          onPressed: () {
                            service
                                .saveUser(emailController.text,
                                    passwordController.text)
                                .then((response) {
                              if (response.statusCode == 200) {
                                // หากลงทะเบียนเรียบร้อย
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => SuccessPage(
                                      title: 'Movie',
                                      email: emailController.text,
                                      password: passwordController.text,
                                    ),
                                  ),
                                );
                              } else {
                                // หากมีข้อผิดพลาดในการลงทะเบียน
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: Text("Registration Failed"),
                                      content: Text(
                                          "Failed to register. Please try again."),
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
                          child: Container(
                            height: 50,
                            alignment: Alignment.center,
                            child: Text(
                              "Login",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 70,
                      ),
                      FadeInUp(
                          duration: Duration(milliseconds: 2000),
                          child: Text(
                            "Forgot Password?",
                            style: TextStyle(
                                color: Color.fromRGBO(143, 148, 251, 1)),
                          )),
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
