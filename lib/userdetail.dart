import 'package:flutter/material.dart';
import 'dart:async';
import 'package:video_player/video_player.dart';
import 'package:flick_video_player/flick_video_player.dart';
import 'models/movie.dart';
import './service.dart';
import 'models/reviews.dart';

class UserDetail extends StatefulWidget {
  final Movie movie;
  final String email; // เพิ่ม email ใน Constructor
  final String password;

  const UserDetail(
      {Key? key,
      required this.movie,
      required this.email,
      required this.password})
      : super(key: key);

  @override
  _UserDetailState createState() => _UserDetailState();
}

class _UserDetailState extends State<UserDetail> {
  late FlickManager flickManager;
  final TextEditingController _textEditingController = TextEditingController();
  String _printedText = '';

  late Reviews users;
  late String title;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    isLoading = true;
    title = 'Loading users';
    users = Reviews();

    Services.getMovies(widget.movie.id).then((usersFromServer) {
      setState(() {
        users = usersFromServer;
        title = "aaa";
        isLoading = false;
      });
    });

    flickManager = FlickManager(
      videoPlayerController: VideoPlayerController.network(
        widget.movie.video,
      ),
    );
  }

  @override
  void dispose() {
    flickManager.dispose();
    super.dispose();
  }

  void _printText() async {
    final text = _textEditingController.text;
    final movieId = widget.movie.id;

    final reviewService = service();
    final response = await reviewService.saveReview(
        movieId, text, widget.email, widget.password);

    setState(() {
      // ทำสิ่งอื่น ๆ ที่คุณต้องการทำหลังจากบันทึกข้อมูลเสร็จสิ้น
      _textEditingController.clear();
    });
  }

  Widget list() {
    return Expanded(
      child: ListView.builder(
        itemCount: users.reviews == null ? 0 : users.reviews.length,
        itemBuilder: (BuildContext context, int index) {
          return row(index);
        },
      ),
    );
  }

  Widget row(int index) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(1.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ListTile(
              title: Text("${users.reviews[index].comment}",
                  style: const TextStyle(color: Colors.green, fontSize: 16)),
              subtitle: Text(
                  "Time: ${users.reviews[index].dates.toLowerCase()}",
                  style: const TextStyle(color: Colors.green, fontSize: 14)),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {},
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: Text(
          "VIDEO",
          style: TextStyle(
              fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
      body: Container(
        color: Colors.black87, // ตั้งสีพื้นหลังเป็นสีดำ
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AspectRatio(
                aspectRatio: 16 / 9,
                child: FlickVideoPlayer(flickManager: flickManager),
              ),
              SizedBox(height: 16),
              ListTile(
                title: Text(
                  'Name: ' + widget.movie.name,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.grey, // สีข้อความเป็นสีขาว
                  ),
                ),
                subtitle: Text(
                  'Type: ' +
                      widget.movie.type +
                      '\n' +
                      widget.movie.description,
                  style: TextStyle(color: Colors.grey),
                ),
              ),
              SizedBox(height: 16),
              TextField(
                controller: _textEditingController,
                onSubmitted: (value) {
                  _printText();
                },
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: 'Enter text and press Enter',
                ),
              ),
              SizedBox(height: 5),
              list(),
            ],
          ),
        ),
      ),
    );
  }
}
