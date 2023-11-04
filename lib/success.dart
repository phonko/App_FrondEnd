import 'package:flutter/material.dart';
import 'dart:async';
import 'service.dart';
import 'models/movies.dart';
import 'package:login/userdetail.dart';
import 'package:login/main.dart';

class SuccessPage extends StatefulWidget {
  final String title;
  final String email;
  final String password;

  const SuccessPage(
      {Key? key,
      required this.title,
      required this.email,
      required this.password})
      : super(key: key);

  @override
  State<SuccessPage> createState() => _SuccessPageState();
}

class _SuccessPageState extends State<SuccessPage> {
  final debouncer = Debouncer(milliseconds: 1000);
  late Movies users;
  late String title;
  bool isLoading = false;

  Servicek service = Servicek();

  @override
  void initState() {
    super.initState();
    isLoading = true;
    users = Movies();

    services.getMovies().then((usersFromServer) {
      setState(() {
        users = usersFromServer;
        title = widget.title;
        isLoading = false;
      });
    });
  }

  Widget list() {
    return Expanded(
      child: ListView.builder(
        itemCount: users.movies == null ? 0 : users.movies.length,
        itemBuilder: (BuildContext context, int index) {
          return row(index);
        },
      ),
    );
  }

  Widget row(int index) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(0.0),
        child: Container(
          color: Colors.black87,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              ListTile(
                leading: Image.network(
                  users.movies[index].imgage,
                  width: 100,
                  height: 150,
                  fit: BoxFit.cover,
                ),
                title: Text("Name: ${users.movies[index].name}",
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 16,
                        fontWeight: FontWeight.bold)),
                subtitle: Text(
                    "Type: ${users.movies[index].type.toLowerCase()}",
                    style: TextStyle(color: Colors.grey, fontSize: 14)),
                trailing: Icon(Icons.arrow_forward_ios, color: Colors.grey),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => UserDetail(
                            movie: users!.movies[index],
                            email: widget.email,
                            password: widget.password,
                          )));
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget searchTF() {
    return TextField(
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(5.0)),
        ),
        filled: true,
        fillColor: Colors.white,
        contentPadding: EdgeInsets.all(15.0),
        hintText: 'name or type',
      ),
      onChanged: (string) {
        debouncer.run(() {
          services.getMovies().then((usersFromServer) {
            setState(() {
              users = Movies.filterlist(usersFromServer, string);
              title = widget.title;
            });
          });
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(25.0),
        color: Colors.black87,
        child: isLoading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Column(
                children: <Widget>[
                  searchTF(),
                  SizedBox(
                    height: 10.0,
                  ),
                  list(),
                ],
              ),
      ),
      appBar: AppBar(
        title: Text("Home"),
        backgroundColor: Colors.black87,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            service.updateLogin(widget.email, widget.password).then((response) {
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
                      content: Text("Failed to register. Please try again."),
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
        ),
      ),
    );
  }
}

class Debouncer {
  final int milliseconds;
  VoidCallback? action;
  Timer? _timer;

  Debouncer({required this.milliseconds});

  run(VoidCallback action) {
    if (null != _timer) {
      _timer?.cancel();
    }
    _timer = Timer(Duration(milliseconds: milliseconds), action);
  }
}
