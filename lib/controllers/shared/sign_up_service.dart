import 'dart:convert';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:teste/controllers/shared/routes_firebase.dart';

class SignUpService {
  signUp(String email, String senha) async {
    // Uri uri = Uri.https(Routes.signUp, '/');
   // encoder = pega um objeto e transforma numa string
    http.Response response = await http.post(
      //  Routes.signUp,
      Uri.parse(Routes().signIn()),
      // uri,
      body: json.encode({"email": email, "senha": senha, "returnSecureToken": true
      }
      ),
    );
    print(response.body);
  }
}
