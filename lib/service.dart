import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'models/movie.dart';
import 'models/movies.dart';
import 'models/review.dart';
import 'models/reviews.dart';

class Service {
  Future<http.Response> saveUser(String email, String password) async {
    var uri = Uri.parse("http://192.168.43.35:8080/api/userss");
    Map<String, String> headers = {"Content-Type": "application/json"};
    Map data = {
      'email': '$email',
      'password': '$password',
    };
    var body = json.encode(data);
    var response = await http.post(uri, headers: headers, body: body);
    print("${response.body}");

    if (response.body.length != 0) {
      var jsonResponse = json.decode(response.body);
      print("ID: ${jsonResponse['id']}");

      var url = Uri.parse(
          "http://192.168.43.35:8080/api/login/${jsonResponse['id']}");
      Map<String, String> headerl = {"Content-Type": "application/json"};
      Map datl = {
        "status": {"id": 1}
      };
      var bodl = json.encode(datl);
      var responsl = await http.put(url, headers: headerl, body: bodl);
      print("${responsl.body}");
    }

    return response;
  }
}

class services {
  static const String url = "http://192.168.43.35:8080/api/movie";

  static Future<Movies> getMovies() async {
    try {
      final response = await http.get(Uri.parse(url));
      if (200 == response.statusCode) {
        return parseUsers(response.body);
      } else {
        return Movies();
      }
    } catch (e) {
      print('Error ${e.toString()}');
      return Movies();
    }
  }

  static Movies parseUsers(String reponseBody) {
    final parsed = json.decode(reponseBody).cast<Map<String, dynamic>>();
    List<Movie> movies =
        parsed.map<Movie>((json) => Movie.fromJson(json)).toList();
    Movies u = Movies();
    u.movies = movies;
    return u;
  }
}

class service {
  Future<http.Response> saveReview(
      final movieId, String text, String email, String password) async {
    var url = Uri.parse("http://192.168.43.35:8080/api/userss");
    Map<String, String> headers = {"Content-Type": "application/json"};
    Map data = {
      'email': '$email',
      'password': '$password',
    };
    var body = json.encode(data);
    var response = await http.post(url, headers: headers, body: body);
    print("${response.body}");
    var jsonResponse = json.decode(response.body);
    print("ID: ${jsonResponse['id']}");

    var uri = Uri.parse("http://192.168.43.35:8080/api/review");
    Map<String, String> headerl = {"Content-Type": "application/json"};
    Map datl = {
      "users": {"id": jsonResponse['id']},
      "video": {"id": movieId},
      "comment": text
    };
    var bodl = json.encode(datl);
    var responsed = await http.post(uri, headers: headerl, body: bodl);
    print("${responsed.body}");

    return response;
  }
}

class Services {
  static Future<Reviews> getMovies(final id) async {
    var url = "http://192.168.43.35:8080/api/review/movie/${id}";

    try {
      final response = await http.get(Uri.parse(url));
      if (200 == response.statusCode) {
        return parseUsers(response.body);
      } else {
        return Reviews();
      }
    } catch (e) {
      print('Error ${e.toString()}');
      return Reviews();
    }
  }

  static Reviews parseUsers(String reponseBody) {
    final parsed = json.decode(reponseBody).cast<Map<String, dynamic>>();
    List<Review> movies =
        parsed.map<Review>((json) => Review.fromJson(json)).toList();
    Reviews u = Reviews();
    u.reviews = movies;
    return u;
  }
}

class Servicel {
  Future<http.Response> saveUser(String name, String address, String age,
      String email, String password) async {
    int number = int.parse(age);

    var uri = Uri.parse("http://192.168.43.35:8080/api/users");
    Map<String, String> headers = {"Content-Type": "application/json"};
    Map data = {
      'name': '$name',
      'address': '$address',
      'age': '$number',
      'email': '$email',
      'password': '$password',
    };
    var body = json.encode(data);
    var response = await http.post(uri, headers: headers, body: body);
    print("${response.body}");

    if (response.body.length != 0) {
      var jsonResponse = json.decode(response.body);
      print("ID: ${jsonResponse['id']}");

      var url = Uri.parse("http://192.168.43.35:8080/api/login");
      Map<String, String> headerl = {"Content-Type": "application/json"};
      Map datl = {
        "users": {"id": jsonResponse['id']},
        "status": {"id": 2}
      };
      var bodl = json.encode(datl);
      var responsl = await http.post(url, headers: headerl, body: bodl);
      print("${responsl.body}");
    }

    return response;
  }
}

class Servicek {
  Future<http.Response> updateLogin(String email, String password) async {
    var uri = Uri.parse("http://192.168.43.35:8080/api/userss");
    Map<String, String> headers = {"Content-Type": "application/json"};
    Map data = {
      'email': '$email',
      'password': '$password',
    };
    var body = json.encode(data);
    var response = await http.post(uri, headers: headers, body: body);
    print("${response.body}");

    if (response.body.length != 0) {
      var jsonResponse = json.decode(response.body);
      print("ID: ${jsonResponse['id']}");

      var url = Uri.parse(
          "http://192.168.43.35:8080/api/login/${jsonResponse['id']}");
      Map<String, String> headerl = {"Content-Type": "application/json"};
      Map datl = {
        "status": {"id": 2}
      };
      var bodl = json.encode(datl);
      var responsl = await http.put(url, headers: headerl, body: bodl);
      print("${responsl.body}");
    }

    return response;
  }
}
