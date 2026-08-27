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

int qRcheck(String ciphertext, String inOut) {
  /// MODIFY CODE ONLY BELOW THIS LINE
  if (ciphertext == 'default') {
    return 3;
  }

  StringBuffer plaintext = StringBuffer();
  int keywordIndex = 0;
  String alphanumeric =
      '0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz';
  String keyword =
      'XXX';

  for (int i = 0; i < ciphertext.length; i++) {
    int cCharIndex = alphanumeric.indexOf(ciphertext[i]);

    if (cCharIndex != -1) {
      // Only process alphanumeric characters
      int kCharIndex =
          alphanumeric.indexOf(keyword[keywordIndex % keyword.length]);
      int shiftedIndex =
          (cCharIndex - kCharIndex + alphanumeric.length) % alphanumeric.length;
      plaintext.write(alphanumeric[shiftedIndex]);

      keywordIndex++; // Move to the next character in the keyword
    } else {
      plaintext
          .write(ciphertext[i]); // Non-alphanumeric characters remain unchanged
    }
  }
  // Custom function to check if a substring is composed only of digits
  bool isDigit(String text, int start, int end) {
    if (text.length <= end) {
      return false; // Ensure the substring won't exceed the text length
    }
    String part = text.substring(start, end);
    return RegExp('XXX').hasMatch(part);
  }

  // Check conditions
  List<String> words = plaintext.toString().split(' ');

  if (plaintext.toString().startsWith(inOut) &&
      isDigit(plaintext.toString(), 4, 14) &&
      words.length > 4 &&
      words[4] == "XXX") {
    return 1;
  }
  return 0;
}

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
//dsfds
