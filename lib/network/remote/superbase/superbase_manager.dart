import 'package:auto_motive/presentation/resources/routes_manager.dart';
import 'package:auto_motive/presentation/widgets/toast.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

const String supabaseUrl = "your supabase url goes here ";
const String token = "your supabase token goes here";

class SupabaseManager {
  final client = SupabaseClient(supabaseUrl, token);

  Future<bool> signUpUser(context, {String? email, String? password}) async {
    debugPrint("email:$email password:$password");
    final result = await client.auth.signUp(email: email!, password: password!);

    debugPrint(result.toString());

    if (result.user != null) {
      showToastMessage('Registration Success', isError: false);
      Navigator.pushReplacementNamed(context, Routes.signIn);
      showToastMessage('Success', isError: false);
      return true;
    } else {
      showToastMessage('Sign Up failed', isError: true);
      return false;
    }
  }

  Future<bool> signInUser(context, {String? email, String? password}) async {
    debugPrint("email:$email password:$password");
    final result = await client.auth
        .signInWithPassword(email: email!, password: password!);
    debugPrint(result.toString());

    if (result.user != null) {
      showToastMessage('Login Success', isError: false);
      Navigator.pushReplacementNamed(context, Routes.home);
      showToastMessage('Success', isError: false);
      return true;
    } else {
      showToastMessage('Check your credentials login failed}', isError: true);
      return false;
    }
  }

  Future<void> logout(context) async {
    await client.auth.signOut();
    Navigator.pushReplacementNamed(context, 'login');
  }
}
