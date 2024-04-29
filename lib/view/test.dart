import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class TestPage extends StatefulWidget {
  const TestPage({super.key});

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF4FFFF),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('qrabsen').snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          String jamMasuk = snapshot.data!.docs[0]['jamMasuk']; // Mengambil jam masuk dari dokumen pertama dalam collection
          return Center(
            child: Text('Jam Masuk: $jamMasuk'),
          );
        },
      ),
    );
  }
}