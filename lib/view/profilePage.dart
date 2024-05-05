import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_icon_class/font_awesome_icon_class.dart';
import 'package:qrabsen/services/firebase_profil.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  void openBottomSheet() {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 4,
                offset: Offset(0, -2),
              )
            ], color: Colors.white, borderRadius: BorderRadius.circular(20)),
            padding: EdgeInsets.only(top: 20),
            height: MediaQuery.of(context).size.height * 0.5,
            child: Center(
                child: Column(
              children: <Widget>[
                Text(
                  'QR PROFIL',
                  style: TextStyle(color: Colors.grey),
                ),
                SizedBox(
                  height: 30,
                ),
                Icon(
                  FontAwesomeIcons.qrcode,
                  size: 250,
                )
              ],
            )),
          );
        });
  }

  final ProfilService profilService = ProfilService();

  final TextEditingController namaController = TextEditingController();
  final TextEditingController telpController = TextEditingController();

  void openDialog({String? docId}) async {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: Container(
          height: MediaQuery.of(context).size.height * 0.3,
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Masukan Data',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              ),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Nama',
                ),
                controller: namaController,
              ),
              TextField(
                decoration: InputDecoration(
                  labelText: 'No.Telp',
                ),
                controller: telpController,
                keyboardType: TextInputType.phone,
              ),
            ],
          ),
        ),
        actions: [
          ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Close')),
          ElevatedButton(
              onPressed: () {
                //new data
                if (docId == null) {
                  profilService.addProfile(
                      namaController.text, telpController.text);
                }
                //update data
                else {
                  profilService.updateProfile(
                      docId, namaController.text, telpController.text);
                }

                namaController.clear();
                telpController.clear();
                Navigator.pop(context);
              },
              child: Text('Save'))
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        child: Column(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('images/profil/top.png'),
                    fit: BoxFit.cover),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30.0),
                  bottomRight: Radius.circular(30.0),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 0,
                    blurRadius: 5,
                    offset: Offset(0, 3), // Mengatur bayangan ke bawah
                  ),
                ],
              ),
              padding: EdgeInsets.only(top: 30, bottom: 10),
              width: MediaQuery.of(context).size.width * 1,
              child: Column(
                children: <Widget>[
                  Text(
                    'Profile',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                  ),
                  CircleAvatar(
                    radius: 60,
                    backgroundImage: AssetImage('images/gyj.jpg'),
                  ),
                  SizedBox(height: 10),
                  InkWell(
                    onTap: openBottomSheet,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(50),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 4,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                      padding: EdgeInsets.all(7),
                      width: 200,
                      height: 35,
                      child: Row(
                        children: <Widget>[
                          Icon(
                            FontAwesomeIcons.qrcode,
                            size: 20,
                          ),
                          SizedBox(width: 10),
                          Text('Tampilkan QR Siswa'),
                          SizedBox(width: 8),
                          Icon(
                            Icons.arrow_forward_ios_rounded,
                            size: 15,
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 70,
            ),
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('images/profil/Body.png'),
                    fit: BoxFit.cover),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 4,
                    offset: Offset(0, -2),
                  ),
                ],
              ),
              width: MediaQuery.of(context).size.width * 1,
              height: 550,
              padding: EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Siswa',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                      color: Color(0xFFADD8E6),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          'Nama Siswa',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        Text(
                          'Goo Youn Jung',
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Divider(),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          'Kelas',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        Text(
                          'XII - RPL2',
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Divider(),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          'No.Telp',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        Text(
                          '087730341110',
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Divider(),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Orang Tua/Wali',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                      color: Color(0xFFADD8E6),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  StreamBuilder(
                    stream: profilService.getProfilesStream(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return CircularProgressIndicator();
                      }
                      if (snapshot.hasData) {
                        QuerySnapshot querySnapshot =
                            snapshot.data as QuerySnapshot;
                        if (querySnapshot.docs.isNotEmpty) {
                          String nama = querySnapshot.docs[0]['Nama'];
                          String docId = querySnapshot.docs[0].id;
                          return Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                                  'Nama',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  ),
                                ),
                                Row(
                                  children: <Widget>[
                                    Text(
                                      nama,
                                      style: TextStyle(fontSize: 18),
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    InkWell(
                                      onTap: () {
                                        openDialog(docId: docId);
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(100),
                                          boxShadow: [
                                            BoxShadow(
                                              color:
                                                  Colors.grey.withOpacity(0.5),
                                              spreadRadius: 2,
                                              blurRadius: 4,
                                              offset: Offset(0, 2),
                                            ),
                                          ],
                                        ),
                                        height: 25,
                                        width: 25,
                                        child: Icon(
                                          Icons.edit,
                                          size: 18,
                                          color: Color(0xFFADD8E6),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          );
                        } else {
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                'Nama Belum Tersedia',
                                style: TextStyle(fontSize: 18),
                              ),
                              InkWell(
                                onTap: openDialog,
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(100),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.5),
                                        spreadRadius: 2,
                                        blurRadius: 4,
                                        offset: Offset(0, 2),
                                      ),
                                    ],
                                  ),
                                  height: 25,
                                  width: 25,
                                  child: Icon(
                                    FontAwesomeIcons.plus,
                                    size: 18,
                                    color: Color(0xFFADD8E6),
                                  ),
                                ),
                              ),
                            ],
                          );
                        }
                      } else {
                        return Text(
                          'Tidak Ada Data',
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        );
                      }
                    },
                  ),
                  Divider(),
                  StreamBuilder(
                    stream: profilService.getProfilesStream(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return CircularProgressIndicator();
                      }
                      if (snapshot.hasData) {
                        QuerySnapshot querySnapshot =
                            snapshot.data as QuerySnapshot;
                        if (querySnapshot.docs.isNotEmpty) {
                          String nomorTelp = querySnapshot.docs[0]['noTelp'];
                          String docId = querySnapshot.docs[0].id;
                          return Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                                  'No.Telp',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  ),
                                ),
                                Row(
                                  children: <Widget>[
                                    Text(
                                      nomorTelp,
                                      style: TextStyle(fontSize: 18),
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    InkWell(
                                      onTap: () {
                                        openDialog(docId: docId);
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(100),
                                          boxShadow: [
                                            BoxShadow(
                                              color:
                                                  Colors.grey.withOpacity(0.5),
                                              spreadRadius: 2,
                                              blurRadius: 4,
                                              offset: Offset(0, 2),
                                            ),
                                          ],
                                        ),
                                        height: 25,
                                        width: 25,
                                        child: Icon(
                                          Icons.edit,
                                          size: 18,
                                          color: Color(0xFFADD8E6),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          );
                        } else {
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                'No.Telp Belum Tersedia',
                                style: TextStyle(fontSize: 18),
                              ),
                              InkWell(
                                onTap: openDialog,
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(100),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.5),
                                        spreadRadius: 2,
                                        blurRadius: 4,
                                        offset: Offset(0, 2),
                                      ),
                                    ],
                                  ),
                                  height: 25,
                                  width: 25,
                                  child: Icon(
                                    FontAwesomeIcons.plus,
                                    size: 18,
                                    color: Color(0xFFADD8E6),
                                  ),
                                ),
                              ),
                            ],
                          );
                        }
                      } else {
                        return Text(
                          'Tidak Ada Data',
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        );
                      }
                    },
                  ),
                  Divider(),
                  SizedBox(
                    height: 30,
                  ),
                  Center(
                    child: Container(
                      decoration: BoxDecoration(
                          color: Color(0xFFFFE0EB),
                          borderRadius: BorderRadius.circular(100),
                          border: Border.all(color: Color(0xFFFF0000))),
                      width: MediaQuery.of(context).size.width * 0.7,
                      height: 55,
                      child: Center(
                        child: Text(
                          'Logout',
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFFFF0000),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
