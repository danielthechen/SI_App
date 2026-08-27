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

int qRcheckGC(String ciphertext, String inOut) {
  /// MODIFY CODE ONLY BELOW THIS LINE
  if (ciphertext == 'default') {
    return 3;
  }

  StringBuffer plaintext = StringBuffer();
  int keyIndex = 0;
  String key = "XXX";

  for (int i = 0; i < ciphertext.length; i++) {
    int ciphertextChar = ciphertext.codeUnitAt(i);
    int keyChar = key.codeUnitAt(keyIndex % key.length);

    if (ciphertextChar <= 47) {
      plaintext.write(String.fromCharCode(ciphertextChar));
      continue;
    }

    ciphertextChar -= 48;
    keyChar -= 48;

    int decryptedChar = (ciphertextChar - keyChar) % 75;
    decryptedChar += 48;

    plaintext.write(String.fromCharCode(decryptedChar));
    keyIndex++;
  }

  // Custom function to check if a substring is composed only of digits
  bool isDigit(String text, int start, int end) {
    if (text.length <= end) {
      return false; // Ensure the substring won't exceed the text length
    }
    String part = text.substring(start, end);
    return RegExp(r'^\d+$').hasMatch(part);
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
