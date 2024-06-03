import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:task1/model/modelapi.dart';
import 'package:http/http.dart' as http;

class Homescreencontroller extends ChangeNotifier {
  List<ModelApi>?
      responseModels;

  Future<void> getData() async {
    
    final url = Uri.parse("https://jsonplaceholder.typicode.com/posts");
    var response = await http.get(url);
    print(response.statusCode);
    print(response.body);
    if (response.statusCode == 200) {
      List<dynamic> decodeData =
          jsonDecode(response.body);
      responseModels = decodeData
          .map((json) => ModelApi.fromJson(json))
          .toList();
      print(responseModels);
      notifyListeners();
    } else {
      print("api is dead");
    }
  }
}
