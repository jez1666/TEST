import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp( MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: TextField(controller: controller,),
          actions: [
            IconButton(onPressed: (){
              final name = controller.text;

              createUser(name: name);

            }, icon: Icon(Icons.add))
          ],
        )
    );
  }
}
Future createUser ({ required String name}) async {
  final docUser = FirebaseFirestore.instance.collection('users').doc('my-id');
  final json = {
    'name': name,
    'age': 26,
    'birthday': DateTime(2022,22,200)
  };

  await docUser.set(json);
}


