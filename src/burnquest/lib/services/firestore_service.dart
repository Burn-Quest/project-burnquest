import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirestoreService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> saveUserData(User user) async {
    await _firestore.collection("users").doc(user.uid).set({
      "uid": user.uid,
      "email": user.email,
      "name": user.displayName ?? "Sem Nome",
    });
  }

  Future<Map<String, dynamic>?> getUserData(String uid) async {
    DocumentSnapshot doc = await _firestore.collection("users").doc(uid).get();
    return doc.exists ? doc.data() as Map<String, dynamic> : null;
  }
}