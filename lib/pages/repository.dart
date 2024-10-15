
import 'dart:convert';

import 'package:http/http.dart'as http;

import '../Models/headlinesModel.dart';

class NewsRepositorys {

Future <HeadlinesModel> getHeadlines (city) async{

  String url = 'https://newsapi.org/v2/top-headlines?q=$city&apiKey=a7da3d4b814f4df1b18c73deee22c08a';

  final response = await http.get(Uri.parse(url));
  if (response.statusCode ==200){
    final body = jsonDecode(response.body);
    return HeadlinesModel.fromJson(body);

  }else{

    throw Exception("Error Headlines ${response.statusCode}");

  }

}

}

class NewsLiders {

   Future <TopLiders> getHeadlines (name) async{

    String url = 'https://newsapi.org/v2/top-headlines?q=$name&apiKey=a7da3d4b814f4df1b18c73deee22c08a';

    final response = await http.get(Uri.parse(url));
    if (response.statusCode ==200){
      final body = jsonDecode(response.body);
      return TopLiders.fromJson(body);
    }else{
      throw Exception("Error Headlines");
    }

  }

}