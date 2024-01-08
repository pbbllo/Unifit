import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleLoginPage extends StatelessWidget {
  final Function(GoogleSignInAccount?) onLoginComplete;

  GoogleLoginPage({required this.onLoginComplete});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login via Google'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {},
          child: Text('Login via Google'),
        ),
      ),
    );
  }
}

// class FacebookLoginPage extends StatelessWidget {
//   final Function(FacebookAuthResult?) onLoginComplete;
//   FacebookLoginPage({required this.onLoginComplete});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Login via Facebook'),
//       ),
//       body: Center(
//         child: ElevatedButton(
//           onPressed: () {},
//           child: Text('Login via Facebook'),
//         ),
//       ),
//     );
//   }
// }
