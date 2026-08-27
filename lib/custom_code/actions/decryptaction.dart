// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

String decryptaction(
  String ciphertext,
  String key,
) {
  /// MODIFY CODE ONLY BELOW THIS LINE
  StringBuffer plaintext = StringBuffer();
  int keywordIndex = 0;
  String alphanumeric =
      '0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz';

  for (int i = 0; i < ciphertext.length; i++) {
    int cCharIndex = alphanumeric.indexOf(ciphertext[i]);

    if (cCharIndex != -1) {
      // Only process alphanumeric characters
      int kCharIndex = alphanumeric.indexOf(key[keywordIndex % key.length]);
      int shiftedIndex =
          (cCharIndex - kCharIndex + alphanumeric.length) % alphanumeric.length;
      plaintext.write(alphanumeric[shiftedIndex]);

      keywordIndex++; // Move to the next character in the keyword
    } else {
      plaintext
          .write(ciphertext[i]); // Non-alphanumeric characters remain unchanged
    }
  }
  return plaintext.toString();
  // int length = ciphertext.length;
  // List<int> decrypted = [];

  // for (int i = 0; i < length; i++) {
  //   int charCode = ciphertext.codeUnitAt(i);
  //   if (charCode >= 'A'.codeUnitAt(0) && charCode <= 'Z'.codeUnitAt(0)) {
  //     // Uppercase letter
  //     decrypted.add(
  //         (charCode - 'A'.codeUnitAt(0) - key[i % key.length].codeUnitAt(0)) %
  //                 26 +
  //             'A'.codeUnitAt(0));
  //   } else if (charCode >= 'a'.codeUnitAt(0) && charCode <= 'z'.codeUnitAt(0)) {
  //     // Lowercase letter
  //     decrypted.add(
  //         (charCode - 'a'.codeUnitAt(0) - key[i % key.length].codeUnitAt(0)) %
  //                 26 +
  //             'a'.codeUnitAt(0));
  //   } else {
  //     // Non-alpha character
  //     decrypted.add(charCode);
  //   }
  // }

  // return String.fromCharCodes(decrypted);

  /// MODIFY CODE ONLY ABOVE THIS LINE
}

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
