import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:teste/controllers/shared/routes_firebase.dart';

class SignUpService {
  signUp(String email, String senha) async {
    // Uri uri = Uri.https(Routes.signUp, '/');
    // Routes.signUp;
    // encoder = pega um objeto e transforma numa string
    http.Response response = await http.post(
      Uri.parse(Routes().signIn())
      // Routes.signUp
      ,
      body: json
          .encode({"email": email, "senha": senha, "returnSecureToken": true}),
    );
    print(response.body);
  }
}
