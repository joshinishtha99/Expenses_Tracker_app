import 'package:expense/Screens/home.dart';
import 'package:expense/Screens/register.dart';
import 'package:expense/widgets/bottomnavigationbar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:expense/Screens/authentication.dart';

class Login extends StatefulWidget {
  const Login({Key? key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  void login() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);
      Navigator.pop(context);
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return const Bottom();
      }));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('No user found for that email')));
      } else if (e.code == 'wrong-password') {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text('Wrong password provided for that user')));
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF8A2BE2),

      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Container(
          padding: const EdgeInsets.all(10),
          child: const Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Expense Tracker',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 25,
                ),
              ),
              SizedBox(width: 10),
              Text(
                '💵',
                style: TextStyle(
                  fontSize: 30,
                ),
              ),
            ],
          ),
        ),
        centerTitle: true,
        elevation: 2,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 50),
              const Text(
                'Welcome to Expense Tracker!',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    labelText: 'Email',
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  obscureText: true,
                  controller: passwordController,
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    labelText: 'Password',
                  ),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  login();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFFFE5C1),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                  textStyle: const TextStyle(
                    fontSize: 20,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text('Login'),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Don\'t have an account?',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return const Register();
                        },
                      ));
                    },
                    child: const Text(
                      'Sign Up',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 10),
              GestureDetector(
                    onTap: () async {
                       bool auth = await Authetication.authetication();                    
                      print("can autheticate:$auth");
                      if(auth){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>const Home()
                      
                        ));
                      }
                    } ,
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Use your ',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                    Icon(
                      Icons.fingerprint,
                      size: 20,
                      color: Colors.white,
                    ),
                    Text(
                      ' to login',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
