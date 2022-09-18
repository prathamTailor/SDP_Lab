import 'package:firebase_auth/firebase_auth.dart';
import 'package:first_android_flutter_project/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'signup.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  // Login function
  static Future<User?> loginUsingEmailPassword({required String email,required String password,required BuildContext context}) async{
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;
    try{
      UserCredential userCredential = await auth.signInWithEmailAndPassword(email: email, password: password);
      user = userCredential.user;
    } on FirebaseAuthException catch (e){
      // if(e.code == "user-not-found"){
      //   print("No user found for that email");
      // }
      print(e);
    }
    return user;
  }

  @override
  Widget build(BuildContext context) {
    // create the textfield controller
    TextEditingController _emailController = TextEditingController();
    TextEditingController _passwordController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Center(
          child: const Text(
              "Login"
          ),
        ),
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 44.0,
                ),
                TextField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    hintText: "User Email",
                    prefixIcon: Icon(Icons.mail,color: Colors.black),
                  ),
                ),
                const SizedBox(
                  height: 26.0,
                ),
                TextField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    hintText: "User Password",
                    prefixIcon: Icon(Icons.lock,color: Colors.black),
                  ),
                ),
                const SizedBox(
                  height: 12.0,
                ),
                const Text(
                  "Don't Remember your password?",
                  style: TextStyle(color: Colors.blue),
                ),
                const SizedBox(
                  height: 12.0,
                ),
                // ElevatedButton(
                //     onPressed: () {
                //       Navigator.push(context,MaterialPageRoute(builder: (context) => const signUp()));
                //     },
                //     child: const Text("sign up")
                // ),
                // const SizedBox(
                //   height: 88.0,
                // ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      // width: double.infinity,
                      children: [
                        RawMaterialButton(
                          fillColor: const Color(0xFF0069FE),
                          elevation: 0.0,
                          padding: const EdgeInsets.symmetric(vertical: 20.0,horizontal: 40.0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          onPressed: () async {
                            User? user = await loginUsingEmailPassword(email: _emailController.text, password: _passwordController.text, context: context);
                            print(user);
                            if(user != null){
                              // Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>ProfileScreen()));
                              Navigator.push(context,MaterialPageRoute(builder: (context) => const ProfileScreen()));
                            }
                          },
                          child: const Text(
                            "login",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18.0,
                            ),
                          ),
                        ),
                      ],
                    ),

                    Column(
                      // width: double.infinity,
                      children:[
                        RawMaterialButton(
                          fillColor: const Color(0xFF0069FE),
                          elevation: 0.0,
                          padding: const EdgeInsets.symmetric(vertical: 20.0,horizontal: 40),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          onPressed: () {
                            Navigator.push(context,MaterialPageRoute(builder: (context) => const signUp()));
                          },
                          child: const Text(
                            "sign up",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18.0,
                            ),
                          ),
                        ),
                      ],
                    ),

                  ],
                ),



              ],
            ),
          ),
        ),
      ),
    );
  }
}