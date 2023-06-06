import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_place_picker.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/place.dart';
import 'dart:io';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'select_destination_page_model.dart';
export 'select_destination_page_model.dart';

class SelectDestinationPageWidget extends StatefulWidget {
  const SelectDestinationPageWidget({Key? key}) : super(key: key);

  @override
  _SelectDestinationPageWidgetState createState() =>
      _SelectDestinationPageWidgetState();
}

class _SelectDestinationPageWidgetState
    extends State<SelectDestinationPageWidget> {
  late SelectDestinationPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();
  LatLng? currentUserLocationValue;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SelectDestinationPageModel());

    getCurrentUserLocation(defaultLocation: LatLng(0.0, 0.0), cached: true)
        .then((loc) => setState(() => currentUserLocationValue = loc));
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    _unfocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();
    if (currentUserLocationValue == null) {
      return Container(
        color: FlutterFlowTheme.of(context).primaryBackground,
        child: Center(
          child: SizedBox(
            width: 50.0,
            height: 50.0,
            child: CircularProgressIndicator(
              color: FlutterFlowTheme.of(context).primary,
            ),
          ),
        ),
      );
    }

    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
      child: Scaffold(
        key: scaffoldKey,
        resizeToAvoidBottomInset: false,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primaryText,
          automaticallyImplyLeading: true,
          title: FlutterFlowPlacePicker(
            iOSGoogleMapsApiKey: 'AIzaSyAVcl8BmqR0cISbT3OnCG2s9ymfe9VAWPI',
            androidGoogleMapsApiKey: 'AIzaSyArZSzR6JXjM00ZxtL0T7i5MmxjQihI1Ls',
            webGoogleMapsApiKey: 'AIzaSyCnKRqoEinVuflhOCl-RKYqC4mlQrztU_U',
            onSelect: (place) async {
              setState(() => _model.placePickerValue = place);
            },
            defaultText: 'Seleccionar destino',
            icon: Icon(
              Icons.place,
              color: Colors.white,
              size: 15.0,
            ),
            buttonOptions: FFButtonOptions(
              height: 50.0,
              color: Colors.black,
              textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                    fontFamily: 'Poppins',
                    color: Colors.white,
                    fontSize: 18.0,
                  ),
              borderSide: BorderSide(
                color: Colors.transparent,
                width: 0.0,
              ),
              borderRadius: BorderRadius.circular(0.0),
            ),
          ),
          actions: [],
          centerTitle: true,
          elevation: 4.0,
        ),
        body: SafeArea(
          top: true,
          child: Stack(
            alignment: AlignmentDirectional(0.0, 1.0),
            children: [
              if (_model.placePickerValue.address == null ||
                  _model.placePickerValue.address == '')
                FlutterFlowGoogleMap(
                  controller: _model.googleMapsController,
                  onCameraIdle: (latLng) => _model.googleMapsCenter = latLng,
                  initialLocation: _model.googleMapsCenter ??=
                      currentUserLocationValue!,
                  markerColor: GoogleMarkerColor.violet,
                  mapType: MapType.normal,
                  style: GoogleMapStyle.standard,
                  initialZoom: 14.0,
                  allowInteraction: true,
                  allowZoom: true,
                  showZoomControls: true,
                  showLocation: true,
                  showCompass: true,
                  showMapToolbar: true,
                  showTraffic: true,
                  centerMapOnMarkerTap: true,
                ),
              if (_model.placePickerValue.address != null &&
                  _model.placePickerValue.address != '')
                Container(
                  width: double.infinity,
                  height: double.infinity,
                  child: custom_widgets.RouteViewStatic(
                    width: double.infinity,
                    height: double.infinity,
                    lineColor: FlutterFlowTheme.of(context).black600,
                    startAddress: 'Estás aquí',
                    destinationAddress: _model.placePickerValue.address,
                    iOSGoogleMapsApiKey:
                        'AIzaSyAVcl8BmqR0cISbT3OnCG2s9ymfe9VAWPI',
                    androidGoogleMapsApiKey:
                        'AIzaSyArZSzR6JXjM00ZxtL0T7i5MmxjQihI1Ls',
                    webGoogleMapsApiKey:
                        'AIzaSyCnKRqoEinVuflhOCl-RKYqC4mlQrztU_U',
                    startCoordinate: currentUserLocationValue!,
                    endCoordinate: _model.placePickerValue.latLng,
                  ),
                ),
              if (_model.placePickerValue.address != null &&
                  _model.placePickerValue.address != '')
                Container(
                  height: 230.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                10.0, 10.0, 10.0, 5.0),
                            child: Image.asset(
                              'assets/images/taxiadejecab.png',
                              width: 100.0,
                              height: 50.0,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Text(
                            'Taxi',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Poppins',
                                  fontSize: 18.0,
                                ),
                          ),
                          Expanded(
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 10.0, 0.0),
                                      child: Text(
                                        '€${FFAppState().price.toString()}',
                                        textAlign: TextAlign.end,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Poppins',
                                              fontSize: 18.0,
                                              fontWeight: FontWeight.normal,
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text(
                                      'Distancia: ${FFAppState().routeDistance}',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Divider(
                        thickness: 1.0,
                        color: FlutterFlowTheme.of(context).accent4,
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                10.0, 5.0, 10.0, 10.0),
                            child: Image.asset(
                              'assets/images/cash.png',
                              width: 50.0,
                              height: 50.0,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Expanded(
                            child: Text(
                              'Effectivo',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Poppins',
                                    fontSize: 18.0,
                                  ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 10.0, 0.0),
                            child: Icon(
                              Icons.arrow_forward_ios,
                              color: FlutterFlowTheme.of(context).primaryText,
                              size: 24.0,
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            10.0, 10.0, 10.0, 10.0),
                        child: FFButtonWidget(
                          onPressed: () async {
                            currentUserLocationValue =
                                await getCurrentUserLocation(
                                    defaultLocation: LatLng(0.0, 0.0));

                            final rideCreateData = createRideRecordData(
                              userLocation: currentUserLocationValue,
                              userUid: currentUserUid,
                              isDriverAssigned: false,
                              destinationLocation:
                                  _model.placePickerValue.latLng,
                              destinationAddress:
                                  _model.placePickerValue.address,
                              userName: currentUserDisplayName,
                            );
                            var rideRecordReference =
                                RideRecord.collection.doc();
                            await rideRecordReference.set(rideCreateData);
                            _model.rideDetails = RideRecord.getDocumentFromData(
                                rideCreateData, rideRecordReference);

                            context.pushNamed(
                              'FindingRidePage',
                              queryParameters: {
                                'rideDetailsReference': serializeParam(
                                  _model.rideDetails!.reference,
                                  ParamType.DocumentReference,
                                ),
                              }.withoutNulls,
                            );

                            setState(() {});
                          },
                          text: 'Pedir un taxi',
                          options: FFButtonOptions(
                            width: double.infinity,
                            height: 50.0,
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            iconPadding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: FlutterFlowTheme.of(context).black600,
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: 'Poppins',
                                  color: Colors.white,
                                ),
                            borderSide: BorderSide(
                              color: Colors.transparent,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
