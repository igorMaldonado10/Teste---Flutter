//  class Routes {
//   static const signUp =
//       "https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=AIzaSyAbY-woNzHGObmtejViDVb0MGOE8VV_8nY";
// }

class Routes {
  static const String authService =
      "https://identitytoolkit.googleapis.com/v1/";

  static const String apiKey = "AIzaSyAbY-woNzHGObmtejViDVb0MGOE8VV_8nY";

  String signIn() {
    return authService + "accounts:signInWithPassword?key=" + apiKey;
  }

  String signUp() {
    return authService + "accounts:signUp?key=" + apiKey;
  }
}
