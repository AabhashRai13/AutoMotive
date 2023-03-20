import 'package:auto_motive/config.dart';
import 'package:auto_motive/presentation/widgets/toast.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

const String supabaseUrl = MyConfig.url;
const String token = MyConfig.token;

class SuparbaseManager {
  final client = SupabaseClient(supabaseUrl, token);

  Future<AuthResponse> signUpUser({String? email, String? password}) async {
    debugPrint("email:$email password:$password");
    final result = await client.auth.signUp(email: email!, password: password!);

    debugPrint(result.toString());

    if (result.user != null) {
      return result;
    } else {
      return result;
    }
  }

  Future<AuthResponse> signInUser({String? email, String? password}) async {
    debugPrint("email:$email password:$password");
    final result = await client.auth
        .signInWithPassword(email: email!, password: password!);
    debugPrint(result.toString());

    if (result.user != null) {
      showToastMessage('Login Success', isError: false);

      showToastMessage('Success', isError: false);
      return result;
    } else {
      showToastMessage('Check your credentials login failed}', isError: true);
      return result;
    }
  }

  Future<void> logout(context) async {
    await client.auth.signOut();
    Navigator.pushReplacementNamed(context, 'login');
  }
}
