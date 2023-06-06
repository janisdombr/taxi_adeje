import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CreateMessageBottomSheetModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this component.

  // State field(s) for message widget.
  TextEditingController? messageController;
  String? Function(BuildContext, String?)? messageControllerValidator;
  // Stores action output result for [Custom Action - getChatRefByUsers] action in Button widget.
  DocumentReference? chatRefByUsers;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  ChatsRecord? createdChatRef;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    messageController?.dispose();
  }

  /// Additional helper methods are added here.

}
