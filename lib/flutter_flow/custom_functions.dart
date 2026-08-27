import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/auth/firebase_auth/auth_util.dart';

String? returndataQR(
  String? email,
  bool? signinout,
  String house,
  String name,
) {
  //true indicates sign out, false indicates sign in

  String? state;

  if (signinout == true) {
    state = "in:";
  } else {
    state = "out";
  }

  final DateTime now = DateTime.now();
  String formatted = now.toIso8601String();

  String semail = '1';

  if (email != null) {
    semail = email.replaceAll(new RegExp(r'[^0-9]'), '');
  }
  String info = state +
      " " +
      semail +
      " " +
      formatted +
      " " +
      name.replaceAll(' ', '') +
      " " +
      house;

  String ciphertext = ' ';
  int keyIndex = 0;
  String key = "ZKwyFdPsmXqAVwxPZyPqGDDnjgcTkAYtKEnB-rc6d0s=";

  for (int i = 0; i < info.length; i++) {
    int infoChar = info.codeUnitAt(i);
    int keyChar = key.codeUnitAt(keyIndex % key.length);

    if (infoChar <= 47) {
      ciphertext += info[i];
      continue;
    }

    infoChar -= 48;
    keyChar -= 48;

    int encryptedChar = (infoChar + keyChar) % 75;

    // Adjust the ASCII range back to 48-122
    encryptedChar += 48;

    ciphertext += String.fromCharCode(encryptedChar);
    keyIndex++;
  }

  if ((semail != null) & (formatted != null)) {
    return info;
  }
}

DateTime? returnTodayTimeValue() {
  DateTime currentDate = DateTime.now();

  return DateTime(currentDate.year, currentDate.month, currentDate.day);
}

String? newCustomFunction(DateTime? inTime) {
  if (inTime != null) {
    return "In";
  } else {
    return "Out";
  }
}

bool? checkforgyminducted(String email) {
  List<String> emails = [
    'XXX'
  ];

  if (emails.contains(email)) {
    return true;
  }
  return false;
}

bool gymTime() {
  DateTime now = DateTime.now();

  // Determine the value of x based on the current time
  if ((now.hour > 8 || (now.hour == 8 && now.minute > 15)) &&
      (now.hour < 16 || (now.hour == 16 && now.minute < 35))) {
    return true; // Between 8:15 and 4:35
  } else {
    return false; // Can't go to gym during other times
  }
}

int? newCustomFunction2(String? gradyear) {
  if (gradyear != null) {
    int year = int.parse(gradyear.substring(0, 4));
    return year;
  } else {
    return null;
  }
}

bool checkharrowvian(String email) {
  if (email == "0220171918@harrowschool.hk" ||
      email == "kmclintock@harrowschool.hk") {
    return (false);
  }

  if (email.endsWith("@harrowschool.hk")) {
    return (true); //delete this after email address change
  }

  if (email.endsWith("@harrowhongkong.hk")) {
    return (true);
  }

  return (false);
}

int returnGradYearBoundary() {
  DateTime now = DateTime.now();
  DateTime august = DateTime(now.year, DateTime.august, 20);
  if (now.isBefore(august)) {
    return (now.year + 2);
  } else {
    return (now.year + 3);
  }
}

bool? checkforadmin(String? email) {
  List<String> emails = [
    'XXX'
  ];

  if (emails.contains(email)) {
    return true;
  }
  return false;
}

String truncateName(String name) {
  int first = name.indexOf('[');

  if (first > 0) {
    return name.substring(0, name.length - 5);
  }
  return name; // Return the original name if no [house]
}

int numRowsinPage(int num) {
  return num < 15 ? num : 15;
}

String? twelveHour(DateTime? dateTime) {
  if (dateTime == null) {
    return "Currently Out";
  }

  String day = dateTime.day.toString().padLeft(2, '0');
  String month = dateTime.month.toString().padLeft(2, '0');
  String year = dateTime.year.toString();

  String hour = dateTime.hour > 12
      ? (dateTime.hour - 12).toString()
      : dateTime.hour.toString();
  String minute = dateTime.minute.toString().padLeft(2, '0');
  String period = dateTime.hour >= 12 ? 'PM' : 'AM';

  return '$month/$day/$year $hour:$minute $period';
}

String? addSpacesToName(String name) {
  String result = '';

  for (int i = 0; i < name.length; i++) {
    if (i > 0 && name[i].toUpperCase() == name[i]) {
      result += ' ';
    }
    result += name[i];
  }

  return result;
}

String banText(String name) {
  return name + " has been banned!";
}

DateTime returnNextWeek() {
  DateTime currentDate = DateTime.now();
  currentDate = currentDate.add(const Duration(hours: 167));

  return currentDate;
}

String unbanText(String name) {
  return name + " has been unbanned!";
}

String returnStudentIDNumber(String input) {
  // remove every character after and including @ given a string
  int atIndex = input.indexOf('@');
  if (atIndex == -1) {
    return input;
  } else {
    return input.substring(0, atIndex);
  }
}

DateTime? banUntilTime(DateTime? value) {
  return value ?? DateTime(2007, 5, 7, 10, 30, 0, 0);
}

String banGCtext(DateTime inputDateTime) {
  DateTime currentTime = DateTime.now();

  if (inputDateTime.isBefore(currentTime)) {
    return "allowed to go to Gold Coast!";
  } else {
    return "not allowed to Gold Coast!";
  }
}

bool? ifgymscanner(String? email) {
  if (email == 'XXX') {
    return true;
  }
  return false;
}

String getNamefromQR(String ciphertext) {
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

  List<String> phrases = plaintext.toString().split(' ');

  String? penultimatePhrase = phrases[phrases.length - 2];

  return penultimatePhrase;
}

int temp4(
  String ciphertext,
  String inOut,
) {
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

String? returnOnlyDate() {
  DateTime now = DateTime.now();
  int x;

  // Determine the value of x based on the current time
  if (now.hour < 8) {
    x = 1; // Before 8 AM
  } else if (now.hour < 16 || (now.hour == 16 && now.minute < 30)) {
    x = 2; // After 8 AM but before 4:30 PM
  } else {
    x = 3; // After 4:30 PM
  }

  // Create the formatted date string
  String formattedDateTime = '${now.year.toString().padLeft(4, '0')}-'
      '${now.month.toString().padLeft(2, '0')}-'
      '${now.day.toString().padLeft(2, '0')}-'
      '$x';

  return formattedDateTime;
}

String returnGymData(
  String state,
  String email,
  String name,
) {
  final DateTime now = DateTime.now();
  String formatted = now.toIso8601String();

  String plaintext = state +
      " " +
      email +
      " " +
      formatted +
      " " +
      name.replaceAll(' ', '') +
      " ";

  return plaintext;
}

bool? checkforprefect(String? email) {
  List<String> emails = [
    "XXX"
  ];

  if (emails.contains(email)) {
    return true;
  }
  return false;
}

String? prefectDateTime() {
  DateTime now = DateTime.now();
  int x;

  // Create the formatted date string
  String formattedDateTime = '${now.year.toString().padLeft(4, '0')}-'
      '${now.month.toString().padLeft(2, '0')}-'
      '${now.day.toString().padLeft(2, '0')}-'
      '${now.hour.toString().padLeft(2, '0')}-'
      '${now.minute.toString().padLeft(2, '0')}-'
      '${now.second.toString().padLeft(2, '0')}';

  return formattedDateTime;
}

String? truncateTime(DateTime timestamp) {
  return '${timestamp.year}-${timestamp.month.toString().padLeft(2, '0')}-${timestamp.day.toString().padLeft(2, '0')}';
}

String? returnName(String input) {
  // Split the input string by spaces
  List<String> parts = input.split(' ');

  // The fourth word is at index 3 (zero-based index)
  if (parts.length >= 4) {
    String fullName = parts[3];

    // Use a regular expression to split camel case into first and last name
    RegExp camelCasePattern = RegExp(r'(?<=[a-z])(?=[A-Z])');
    List<String> nameParts = fullName.split(camelCasePattern);

    if (nameParts.length == 2) {
      String firstName = nameParts[0];
      String lastName = nameParts[1];
      return '$firstName $lastName';
    }
  }
  // Return an empty string if the name cannot be extracted
  return '';
}

String? returnHouseGC(String input) {
  List<String> parts = input.split(' ');

  // The fifth word is at index 4 (zero-based index)
  if (parts.length >= 5) {
    return parts[4];
  }

  // Return an empty string if the house cannot be extracted
  return '';
}

String? returnEmailGC(String input) {
  // Split the input string by spaces
  List<String> parts = input.split(' ');

  // The second word is at index 1 (zero-based index)
  if (parts.length >= 2) {
    String email = '${parts[1]}@harrowschool.hk';
    return email;
  }

  // Return an empty string if the email cannot be constructed
  return '';
}

String checkInOutGC(String input) {
  // Split the input string by spaces
  List<String> parts = input.split(' ');

  // The first word is at index 0 (zero-based index)
  if (parts.isNotEmpty) {
    return parts[0];
  }

  // Return an empty string if the condition cannot be extracted
  return '';
}

String encryptString(
  String plaintext,
  String key,
) {
  StringBuffer ciphertext = StringBuffer();
  int keywordIndex = 0;
  String alphanumeric =
      '0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz';

  for (int i = 0; i < plaintext.length; i++) {
    int pCharIndex = alphanumeric.indexOf(plaintext[i]);

    if (pCharIndex != -1) {
      // Only process alphanumeric characters
      int kCharIndex = alphanumeric.indexOf(key[keywordIndex % key.length]);
      int shiftedIndex = (pCharIndex + kCharIndex) % alphanumeric.length;
      ciphertext.write(alphanumeric[shiftedIndex]);

      keywordIndex++; // Move to the next character in the keyword
    } else {
      ciphertext
          .write(plaintext[i]); // Non-alphanumeric characters remain unchanged
    }
  }

  return ciphertext.toString();
  // int length = plaintext.length;
  // List<int> encrypted = [];

  // for (int i = 0; i < length; i++) {
  //   int charCode = plaintext.codeUnitAt(i);
  //   if (charCode >= 'A'.codeUnitAt(0) && charCode <= 'Z'.codeUnitAt(0)) {
  //     // Uppercase letter
  //     encrypted.add(
  //         (charCode - 'A'.codeUnitAt(0) + key[i % key.length].codeUnitAt(0)) %
  //                 26 +
  //             'A'.codeUnitAt(0));
  //   } else if (charCode >= 'a'.codeUnitAt(0) && charCode <= 'z'.codeUnitAt(0)) {
  //     // Lowercase letter
  //     encrypted.add(
  //         (charCode - 'a'.codeUnitAt(0) + key[i % key.length].codeUnitAt(0)) %
  //                 26 +
  //             'a'.codeUnitAt(0));
  //   } else {
  //     // Non-alpha character
  //     encrypted.add(charCode);
  //   }
  // }
  // return String.fromCharCodes(encrypted);
}

String decryptString(
  String ciphertext,
  String key,
) {
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
}

bool checkQRcode(String plaintext) {
  bool isDigit(String text, int start, int end) {
    if (text.length <= end) {
      return false; // Ensure the substring won't exceed the text length
    }
    String part = text.substring(start, end);
    return RegExp(r'^\d+$').hasMatch(part);
  }

  // Check conditions
  List<String> words = plaintext.split(' ');

  final now = DateTime.now();
  final difference = now.difference(DateTime.parse(words[2]));

  if ((plaintext.startsWith("in") || plaintext.startsWith("out")) &&
      isDigit(plaintext, 4, 14) &&
      difference.abs() <= const Duration(minutes: 5) &&
      words.length > 4 &&
      (words[4] == "Shaftesbury" ||
          words[4] == "Peel" ||
          words[4] == "Churchill" ||
          words[4] == "Anderson" ||
          words[4] == "Sun" ||
          words[4] == "Gellhorn" ||
          words[4] == "Wu" ||
          words[4] == "Keller")) {
    return true;
  }
  return false;
}

List<MeritspotsRecord>? findSelected(
  List<MeritspotsRecord> allRows,
  List<int> selectedRowsIndex,
) {
  List<MeritspotsRecord> promotedEmps = [];
  for (int i = 0; i < selectedRowsIndex.length; i++) {
    int index = selectedRowsIndex[i];
    if (index >= 0 && index < allRows.length) {
      MeritspotsRecord emp = allRows[index];
      promotedEmps.add(emp);
    }
  }
  return promotedEmps;
}

List<String>? yearGroupdropbox(String? yearGroup) {
  if (yearGroup == 'Year 6' || yearGroup == 'Year 7' || yearGroup == 'Year 8') {
    return [
      'Banks',
      'Darwin',
      'Fry',
      'Lyon',
      'Nightingale',
      'Parks',
      'Shackleton'
    ];
  } else if (yearGroup == 'Year 9' ||
      yearGroup == 'Year 10' ||
      yearGroup == 'Year 11' ||
      yearGroup == 'Year 12' ||
      yearGroup == 'Year 13') {
    return [
      'Anderson',
      'Churchill',
      'Gellhorn',
      'Keller',
      'Peel',
      'Shaftesbury',
      'Sun',
      'Wu'
    ];
  } else {
    return [
      'Banks',
      'Darwin',
      'Fry',
      'Lyon',
      'Nightingale',
      'Parks',
      'Shackleton',
      'Anderson',
      'Churchill',
      'Gellhorn',
      'Keller',
      'Peel',
      'Shaftesbury',
      'Sun',
      'Wu'
    ]; // Return an empty list for invalid year groups
  }

  ///void main() {
  // Example usage
  ///print(getYearGroupLists('7')); // Output: [Shackleton, Nightingale, Parks]
  ///print(getYearGroupLists('10')); // Output: [Shaftesbury, Gellhorn, Churchill]
  ///print(getYearGroupLists('5')); // Output: []
  ///print(getYearGroupLists('12')); // Output: [Shaftesbury, Gellhorn, Churchill]
  ///}
}

String? newCustomFunction4() {
  return null;
}

bool? checkQRtypeGCistrue() {
  return (true);
}

DateTime? return48hours() {
  DateTime currentDate = DateTime.now();
  currentDate = currentDate.add(const Duration(hours: 48));

  return currentDate;
}

int reverseYear(int gYoryG) {
  DateTime now = DateTime.now();
  int year = now.year;
  int month = now.month;

  bool isBeforeAug = (month < 8);

  // 13 - yearsToGraduation

  return 13 -
      gYoryG +
      year +
      (isBeforeAug ? 0 : 1); // something like 2022-04-20
}

String? returnIDfromQR(String input) {
  final regExp = RegExp(r'\d+');
  final match = regExp.firstMatch(input);
  return match!.group(0)!;
}

bool gcTime() {
  DateTime now = DateTime.now();

  // Determine the value of x based on the current time
  if ((now.hour > 16 || (now.hour == 16 && now.minute > 30)) &&
      (now.hour < 18 || (now.hour == 18 && now.minute < 30))) {
    return true; // Between 4:30 and 6:15
  } else {
    return false; // Can't go to GC during other times
  }
}

String? returnTodayDate() {
  DateTime now = DateTime.now();

  // Create the formatted date string
  String formattedDateTime = '${now.year.toString().padLeft(4, '0')}-'
      '${now.month.toString().padLeft(2, '0')}-'
      '${now.day.toString().padLeft(2, '0')}';

  return formattedDateTime;
}

bool crossrefEmails(
  dynamic emailList,
  String userEmail,
) {
  for (int i = 0; i <= emailList['values'].length - 1; i++) {
    if (emailList['values'][i][0] == userEmail) {
      return true;
    }
  }

  return false;
}
