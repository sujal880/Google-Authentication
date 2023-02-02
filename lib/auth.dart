import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_auth/usermodel.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Auth {
  static Future<bool> signInWithGoogle() async {
    bool result = false;
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication? googleSignInAuthentication =
          await googleUser?.authentication;
      final credential = GoogleAuthProvider.credential(
          accessToken: googleSignInAuthentication?.accessToken,
          idToken: googleSignInAuthentication?.idToken);
      UserCredential userCredential=await FirebaseAuth.instance.signInWithCredential(credential);
      User ? user=userCredential.user;
      if(user!=null){
        if(userCredential.additionalUserInfo!.isNewUser){
          UserModel newuser=UserModel(email: user.email, uid:user.uid, username: user.displayName, profilepic: user.photoURL);
          FirebaseFirestore.instance.collection("users").doc(user.email).set(newuser.toMap()).then((value){
            log("User Created");
          });
        }
        result=true;
      }
      return result;
    } catch (ex) {
      log(ex.toString());
    }
    return result;
  }
}
