// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<DocumentReference?> getChatRefByUsers(
  DocumentReference usera,
  DocumentReference userb,
) async {
  final QuerySnapshot snapshot = await FirebaseFirestore.instance
      .collection('chats')
      .where('users', arrayContainsAny: [usera, userb])
      .limit(1)
      .get();
  if (snapshot.docs.length == 0) {
    return null;
  } else {
    return snapshot.docs.first.reference;
  }
}
