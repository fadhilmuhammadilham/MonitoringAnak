import 'package:cloud_firestore/cloud_firestore.dart';

class ProfilService {
  //get collection
  final CollectionReference profils =
      FirebaseFirestore.instance.collection('profil');
  //create
  Future<void> addProfile(String nama, String telp) {
    return profils.add({'Nama': nama, 'No.Telp': telp});
  }
  //read

  //update
}
