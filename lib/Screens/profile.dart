import 'package:expense/Screens/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        centerTitle: true,
        title: Text('Profile'),

      ),
      body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/money.jpg"),
                opacity: 0.4,

              fit: BoxFit.cover,
            ),
          ),
        child: Stack(
          
          children: [
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Container(
                width: double.infinity,
                height: 240,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 169, 100, 233).withOpacity(0.7),
        
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                ),
              ),
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 65), 
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage('assets/images/avatar.jpg'),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Nishtha Joshi',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'joshinishtha99@gmail.com',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          
                        },
                        child: Text('Edit Profile'),
                      ),
        
                      ElevatedButton(onPressed: (){
              
                        FirebaseAuth.instance.signOut();
                        Navigator.pop(context);
                        Navigator.push(context, MaterialPageRoute(builder: (context) => Login()));
                      }, child: Text("Logout"))
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
