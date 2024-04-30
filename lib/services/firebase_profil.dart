import 'package:cloud_firestore/cloud_firestore.dart';

class ProfilService {
  //get collection
  final CollectionReference profils =
      FirebaseFirestore.instance.collection('profil');
  //create
  Future<void> addProfile(String nama, String telp) {
    return profils.add({'Nama': nama, 'noTelp': telp});
  }

  //read
  Stream<QuerySnapshot> getProfilesStream() {
    return profils.snapshots();
  }

  //update
  Future<void> updateProfile(String docId, String newName, String newTelp) {
    return profils.doc(docId).update({'Nama': newName, 'noTelp': newTelp});
  }
}
