import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../services/auth_service.dart';
import '../services/firestore_service.dart';

class AuthViewModel extends ChangeNotifier {
  final AuthService _authService = AuthService();
  final FirestoreService _firestoreService = FirestoreService();
  User? user;
  Map<String, dynamic>? userData;

  Future<void> login(String email, String password) async {
    user = await _authService.signIn(email, password);
    if (user != null) {
      userData = await _firestoreService.getUserData(user!.uid);
    }
    notifyListeners();
  }

  Future<void> logout() async {
    await _authService.signOut();
    user = null;
    userData = null;
    notifyListeners();
  }
}