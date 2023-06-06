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
import 'create_message_bottom_sheet_model.dart';
export 'create_message_bottom_sheet_model.dart';

class CreateMessageBottomSheetWidget extends StatefulWidget {
  const CreateMessageBottomSheetWidget({
    Key? key,
    String? taxiName,
    String? taxiCarModel,
    this.taxiImage,
    String? taxiDriverName,
    this.taxiDriverUserRef,
  })  : this.taxiName = taxiName ?? 'Name',
        this.taxiCarModel = taxiCarModel ?? 'Tesla',
        this.taxiDriverName = taxiDriverName ?? 'Name',
        super(key: key);

  final String taxiName;
  final String taxiCarModel;
  final String? taxiImage;
  final String taxiDriverName;
  final DocumentReference? taxiDriverUserRef;

  @override
  _CreateMessageBottomSheetWidgetState createState() =>
      _CreateMessageBottomSheetWidgetState();
}

class _CreateMessageBottomSheetWidgetState
    extends State<CreateMessageBottomSheetWidget> {
  late CreateMessageBottomSheetModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CreateMessageBottomSheetModel());

    _model.messageController ??= TextEditingController();
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Material(
      color: Colors.transparent,
      elevation: 5.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(0.0),
          bottomRight: Radius.circular(0.0),
          topLeft: Radius.circular(16.0),
          topRight: Radius.circular(16.0),
        ),
      ),
      child: Container(
        width: double.infinity,
        height: 370.0,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(0.0),
            bottomRight: Radius.circular(0.0),
            topLeft: Radius.circular(16.0),
            topRight: Radius.circular(16.0),
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
                    child: Container(
                      width: 50.0,
                      height: 4.0,
                      decoration: BoxDecoration(
                        color: Color(0xFFE0E3E7),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16.0, 12.0, 0.0, 0.0),
                child: Text(
                  valueOrDefault<String>(
                    widget.taxiName,
                    'Name',
                  ),
                  style: FlutterFlowTheme.of(context).headlineMedium.override(
                        fontFamily: 'Outfit',
                        color: Color(0xFF14181B),
                        fontSize: 24.0,
                        fontWeight: FontWeight.normal,
                      ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16.0, 4.0, 0.0, 0.0),
                child: Text(
                  widget.taxiCarModel,
                  style: FlutterFlowTheme.of(context).labelMedium.override(
                        fontFamily: 'Plus Jakarta Sans',
                        color: Color(0xFF57636C),
                        fontSize: 14.0,
                        fontWeight: FontWeight.w500,
                      ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16.0, 12.0, 16.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(40.0),
                      child: Image.network(
                        widget.taxiImage!,
                        width: 40.0,
                        height: 40.0,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 0.0, 0.0),
                      child: Text(
                        widget.taxiDriverName,
                        style: FlutterFlowTheme.of(context).titleLarge.override(
                              fontFamily: 'Outfit',
                              color: Color(0xFF14181B),
                              fontSize: 22.0,
                              fontWeight: FontWeight.w500,
                            ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 0.0),
                child: TextFormField(
                  controller: _model.messageController,
                  obscureText: false,
                  decoration: InputDecoration(
                    hintText: 'Enter your message here...',
                    hintStyle:
                        FlutterFlowTheme.of(context).labelMedium.override(
                              fontFamily: 'Plus Jakarta Sans',
                              color: Color(0xFF57636C),
                              fontSize: 14.0,
                              fontWeight: FontWeight.w500,
                            ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xFFE0E3E7),
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xFF4B39EF),
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xFFFF5963),
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xFFFF5963),
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    contentPadding:
                        EdgeInsetsDirectional.fromSTEB(20.0, 32.0, 20.0, 12.0),
                  ),
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Plus Jakarta Sans',
                        color: Color(0xFF14181B),
                        fontSize: 14.0,
                        fontWeight: FontWeight.w500,
                      ),
                  textAlign: TextAlign.start,
                  maxLines: 4,
                  keyboardType: TextInputType.multiline,
                  validator:
                      _model.messageControllerValidator.asValidator(context),
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 44.0),
                    child: FFButtonWidget(
                      onPressed: () async {
                        _model.chatRefByUsers = await actions.getChatRefByUsers(
                          widget.taxiDriverUserRef!,
                          currentUserReference!,
                        );
                        if (_model.chatRefByUsers != null) {
                          final chatMessagesCreateData1 = {
                            ...createChatMessagesRecordData(
                              user: currentUserReference,
                              chat: _model.chatRefByUsers,
                              text: _model.messageController.text,
                            ),
                            'timestamp': FieldValue.serverTimestamp(),
                          };
                          await ChatMessagesRecord.collection
                              .doc()
                              .set(chatMessagesCreateData1);

                          final chatsUpdateData1 = {
                            ...createChatsRecordData(
                              lastMessage: _model.messageController.text,
                              lastMessageSentBy: currentUserReference,
                            ),
                            'last_message_time': FieldValue.serverTimestamp(),
                            'last_message_seen_by': FieldValue.delete(),
                          };
                          await _model.chatRefByUsers!.update(chatsUpdateData1);
                        } else {
                          final chatsCreateData = {
                            'users': functions.getUsersRefsListByTwoUsers(
                                widget.taxiDriverUserRef!,
                                currentUserReference!),
                          };
                          var chatsRecordReference =
                              ChatsRecord.collection.doc();
                          await chatsRecordReference.set(chatsCreateData);
                          _model.createdChatRef =
                              ChatsRecord.getDocumentFromData(
                                  chatsCreateData, chatsRecordReference);

                          final chatMessagesCreateData2 = {
                            ...createChatMessagesRecordData(
                              user: currentUserReference,
                              chat: _model.createdChatRef!.reference,
                              text: _model.messageController.text,
                            ),
                            'timestamp': FieldValue.serverTimestamp(),
                          };
                          await ChatMessagesRecord.collection
                              .doc()
                              .set(chatMessagesCreateData2);

                          final chatsUpdateData2 = {
                            ...createChatsRecordData(
                              lastMessage: _model.messageController.text,
                              lastMessageSentBy: currentUserReference,
                            ),
                            'last_message_time': FieldValue.serverTimestamp(),
                            'last_message_seen_by': FieldValue.delete(),
                          };
                          await _model.createdChatRef!.reference
                              .update(chatsUpdateData2);
                        }

                        context.pushNamed('AllChatsPage');

                        setState(() {});
                      },
                      text: 'Send Message',
                      options: FFButtonOptions(
                        width: 270.0,
                        height: 50.0,
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        iconPadding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: Color(0xFF4B39EF),
                        textStyle:
                            FlutterFlowTheme.of(context).titleMedium.override(
                                  fontFamily: 'Plus Jakarta Sans',
                                  color: Colors.white,
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.normal,
                                ),
                        elevation: 3.0,
                        borderSide: BorderSide(
                          color: Colors.transparent,
                          width: 1.0,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
