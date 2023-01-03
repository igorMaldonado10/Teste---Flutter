import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:teste/controllers/shared/routes.dart';

class SignUpService {
  signUp(String email, String senha) async {
    Uri uri = Uri.https(Routes.urlSignUp, '/');
    // encoder = pega um objeto e transforma numa string
    http.Response response = await http.post(
      uri,
      body: json
          .encode({"email": email, "senha": senha, "returnSecureToken": true}),
    );
    print(response.body);
  }
}
