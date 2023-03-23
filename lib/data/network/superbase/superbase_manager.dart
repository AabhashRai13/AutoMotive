import 'dart:developer';

import 'package:auto_motive/config.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

const String supabaseUrl = MyConfig.url;
const String token = MyConfig.token;

class SuparbaseManager {
  final client = SupabaseClient(supabaseUrl, token);

  Future<AuthResponse?> signUpUser(
      {String? email, String? password, required String phone}) async {
    try {
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
    } catch (e) {
      return null;
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
      phone: "61$number",
    );
  }

  Future<AuthResponse?> verifyOTP(
      {String? phoneNumber, String? otpNumber}) async {
    try {
      log("user pugyo eta");
      log("$phoneNumber $otpNumber");
      final AuthResponse res = await client.auth.verifyOTP(
        type: OtpType.sms,
        token: otpNumber!,
        phone: "61$phoneNumber",
      );

// { data, error } = await client.auth.verifyOtp({ phone, token, type: 'sms'})

      log(res.user!.id);
      final User? user = res.user;
      log("user $user");
      return res;
    } catch (e) {
      log("$e");
      return null;
    }
  }

  Future<void> logout(context) async {
    await client.auth.signOut();
    Navigator.pushReplacementNamed(context, 'login');
  }
}
