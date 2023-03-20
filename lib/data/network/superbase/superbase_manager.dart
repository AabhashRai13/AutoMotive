import 'dart:developer';

import 'package:auto_motive/config.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

const String supabaseUrl = MyConfig.url;
const String token = MyConfig.token;

class SuparbaseManager {
  final client = SupabaseClient(supabaseUrl, token);

  Future<AuthResponse> signUpUser(
      {String? email, String? password, required String phone}) async {
    debugPrint("email:$email password:$password");
    final result = await client.auth.signUp(
      email: email!,
      password: password!,
      //phone: phone,
    );

    debugPrint(result.toString());

    if (result.user != null) {
      return result;
    } else {
      return result;
    }
  }

  Future<AuthResponse?> signInUser({String? email, String? password}) async {
    try {
      final result = await client.auth
          .signInWithPassword(email: email!, password: password!);
      return result;
    } catch (e) {
      return null;
    }
  }

  Future<void> signInWithOTP({String? number}) async {
    log("61$number");
    await client.auth.signInWithOtp(
      phone: "$number",
    );
  }

  Future<AuthResponse?> verifyOTP(
      {String? phoneNumber, String? otpNumber}) async {
    try {
      final AuthResponse res = await client.auth.verifyOTP(
        type: OtpType.sms,
        token: otpNumber!,
        phone: phoneNumber,
      );

      final User? user = res.user;
      log("user $user");
      return res;
    } catch (e) {
      return null;
    }
  }

  Future<void> logout(context) async {
    await client.auth.signOut();
    Navigator.pushReplacementNamed(context, 'login');
  }
}
