import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:qrabsen/assets/component/cardProfile.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF4FFFF),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            //appbar
            Container(
              padding: EdgeInsets.fromLTRB(20, 30, 20, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'Selamat Datang!',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(100),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5), // Warna bayangan
                          spreadRadius: 0, // Meratakan bayangan
                          blurRadius: 5, // Jarak perataan bayangan
                          offset:
                              Offset(0, 3), // Menentukan arah bayangan (x, y)
                        ),
                      ],
                    ),
                    height: 40,
                    width: 40,
                    child: Icon(
                      Icons.notifications,
                      color: Colors.black,
                      size: 24,
                    ),
                  ),
                ],
              ),
            ),
            //pilihsiswa
            DropProfile(),
            //body
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('images/dashboard/informasiAbsen.png'),
                    fit: BoxFit.cover),
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30.0),
                  topRight: Radius.circular(30.0),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(1),
                    spreadRadius: 0,
                    blurRadius: 15,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              margin: EdgeInsets.only(top: 40),
              width: MediaQuery.of(context).size.width * 1,
              // Tinggi Container akan mengisi sisa ruang di dalam Column
              height: 550,
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Container(
                              margin: EdgeInsets.only(left: 20, top: 20),
                              child: Text(
                                'Minggu, 17-14-2024',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18),
                              )),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Jam Masuk',
                    style: TextStyle(
                        fontSize: 17,
                        color: Colors.grey,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 5),
                  Container(
                    decoration: BoxDecoration(
                        color: Color(0xFFB9F8B9),
                        border: Border.all(
                          color: Color(0xFF008800),
                        ),
                        borderRadius: BorderRadius.circular(100)),
                    padding: EdgeInsets.fromLTRB(25, 10, 20, 10),
                    width: MediaQuery.of(context).size.width * 0.8,
                    height: 100,
                    child: Row(
                      children: <Widget>[
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                color: Color(0xFF008800),
                              ),
                              borderRadius: BorderRadius.circular(100)),
                          width: 70,
                          height: 70,
                          child: Icon(
                            Icons.check_rounded,
                            size: 50,
                            color: Color(0xFF008800),
                          ),
                        ),
                        SizedBox(
                          width: 40,
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 5),
                          child: Column(
                            children: <Widget>[
                              Text(
                                'Masuk Pukul',
                                style: TextStyle(
                                    color: Color(0xFF008800),
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold),
                              ),
                              StreamBuilder(
                                stream: FirebaseFirestore.instance
                                    .collection('qrabsen')
                                    .snapshots(),
                                builder: (context,
                                    AsyncSnapshot<QuerySnapshot> snapshot) {
                                  if (!snapshot.hasData) {
                                    return CircularProgressIndicator();
                                  }
                                  String jamMasuk = snapshot.data!.docs[0][
                                      'jamMasuk']; // Mengambil jam masuk dari dokumen pertama dalam collection
                                  return Text(
                                    '$jamMasuk',
                                    style: TextStyle(
                                      color: Color(0xFF008800),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 30,
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Color(0xFFFFE0EB),
                        border: Border.all(
                          color: Color(0xFFFF0000),
                        ),
                        borderRadius: BorderRadius.circular(100)),
                    padding: EdgeInsets.fromLTRB(25, 10, 20, 10),
                    width: MediaQuery.of(context).size.width * 0.8,
                    height: 100,
                    child: Row(
                      children: <Widget>[
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                color: Color(0xFFFF0000),
                              ),
                              borderRadius: BorderRadius.circular(100)),
                          width: 70,
                          height: 70,
                          child: Icon(
                            Icons.close_rounded,
                            size: 50,
                            color: Color(0xFFFF0000),
                          ),
                        ),
                        SizedBox(
                          width: 40,
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 5),
                          child: Column(
                            children: <Widget>[
                              Text(
                                'Masuk Pukul',
                                style: TextStyle(
                                    color: Color(0xFFFF0000),
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                '00:00:00',
                                style: TextStyle(
                                  color: Color(0xFFFF0000),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 30,
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  Text('Siswa Datang Tepat Waktu',
                      style: TextStyle(
                          color: Color(0xFF008800),
                          fontWeight: FontWeight.bold)),
                  SizedBox(height: 10),
                  Text(
                    'Jam Keluar',
                    style: TextStyle(
                        fontSize: 17,
                        color: Colors.grey,
                        fontWeight: FontWeight.bold),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Color(0xFFB9F8B9),
                        border: Border.all(
                          color: Color(0xFF008800),
                        ),
                        borderRadius: BorderRadius.circular(100)),
                    padding: EdgeInsets.fromLTRB(25, 10, 20, 10),
                    width: MediaQuery.of(context).size.width * 0.8,
                    height: 100,
                    child: Center(
                      child: Container(
                        margin: EdgeInsets.only(top: 5),
                        child: Column(
                          children: <Widget>[
                            Text(
                              'Keluar Pukul',
                              style: TextStyle(
                                  color: Color(0xFF008800),
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              '17:19:20',
                              style: TextStyle(
                                color: Color(0xFF008800),
                                fontWeight: FontWeight.bold,
                                fontSize: 30,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
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
