import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

class SidnInWithFaceBook extends StatefulWidget {
  const SidnInWithFaceBook({Key? key}) : super(key: key);

  @override
  State<SidnInWithFaceBook> createState() => _SidnInWithFaceBookState();
}

class _SidnInWithFaceBookState extends State<SidnInWithFaceBook> {

  bool _isLoggedIn = false;
  Map _userObj = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("التاج الأزرق"),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: _isLoggedIn == true ?
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(_userObj["name"]),
            Text(_userObj["email"]),
            // TextButton(
            //     onPressed: () {
            //       FacebookAuth.instance.logOut().then((value) {
            //         setState(() {
            //           _isLoggedIn = false;
            //           _userObj = {};
            //         });
            //       });
            //     },
            //     child: Text("Logout"),
            // ),
          ],
        ) :
        Center(
          // child: ElevatedButton(
          //   onPressed: () async {
          //     FacebookAuth.instance.login(
          //         permissions: ["public_profile", "email"]).then((value) {
          //       FacebookAuth.instance.getUserData().then((userData) async {
          //         setState(() {
          //           _isLoggedIn = true;
          //           _userObj = userData;
          //         });
          //       });
          //     });
          //   },
          //   child: Text('Login with Facebook'),
          // ),
        ),
      ),
    );
  }
}
