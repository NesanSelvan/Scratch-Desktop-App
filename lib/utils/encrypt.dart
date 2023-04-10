import 'dart:convert';
import 'dart:typed_data';

import 'package:crypto/crypto.dart';
import 'package:encrypt/encrypt.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

// ignore: avoid_classes_with_only_static_members
class EncryptData {
//for AES Algorithms

  // static Encrypted? encrypted;
  // static String? decrypted;

  // static String encryptAES(String plainText) {
  //   final key = Key.fromUtf8('my 32 length key................');
  //   final iv = IV.fromLength(16);
  //   final encrypter = Encrypter(AES(key));
  //   encrypted = encrypter.encrypt(plainText, iv: iv);
  //   print(encrypted!.base64);
  //   return encrypted!.base64;
  // }

  // static String? decryptAES(String encyptedString) {
  //   try {
  //     final key = Key.fromUtf8('my 32 length key................');
  //     final iv = IV.fromLength(16);
  //     final encrypter = Encrypter(AES(key));
  //     decrypted = encrypter.decrypt64(encyptedString, iv: iv);
  //     // final decrypted = encrypter.decrypt(encrypted!, iv: iv);
  //     print(decrypted);
  //     return jsonEncode(decrypted);
  //   } catch (e) {
  //     return encyptedString;
  //   }
  // }

  static Future<Uint8List> getDBKey() async {
    final val = await const FlutterSecureStorage().read(
        key: base64.normalize("V2lLd3zQyrQvYsxXPnsU2o1MnQKcw44VZVrjji01Tsg="));
    if (val != null)
      return base64Url.decode(val);
    else
      return base64Url.decode(
          base64.normalize("V2lLd3zQyrQvYsxXPnsU2o1MnQKcw44VZVrjji01Tsg="));
  }
}
