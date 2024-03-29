import 'package:flutter/material.dart';

class Rekap extends StatefulWidget {
  const Rekap({super.key});

  @override
  State<Rekap> createState() => _RekapState();
}

class _RekapState extends State<Rekap> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Ini Halaman Rekap')
      ),
    );
  }
}