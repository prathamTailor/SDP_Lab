import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  // final auth = FirebaseAuth.instance;

  // String n = "";

  // void inputData() {
  //   final User? user = auth.currentUser;
  //   if(user != null){
  //     n = user.uid;
  //   }
  // }

  // var uid = "";
  //
  // Future<void> inputData() async {
  //   final User? user = await auth.currentUser;
  //   uid = user != null ? user.uid : "";
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text("Welcome to your profile page"),
            // const SizedBox(
            //   height: 30.0,
            // ),
            // ElevatedButton(
            //   onPressed: (){
            //     Navigator.pop(context);
            //   },
            //   child: const Text("Back to Login"),
            // ),
          ],
        ),
      ),
    );
  }
}
