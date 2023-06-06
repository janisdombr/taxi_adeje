import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'finding_ride_page_model.dart';
export 'finding_ride_page_model.dart';

class FindingRidePageWidget extends StatefulWidget {
  const FindingRidePageWidget({
    Key? key,
    required this.rideDetailsReference,
  }) : super(key: key);

  final DocumentReference? rideDetailsReference;

  @override
  _FindingRidePageWidgetState createState() => _FindingRidePageWidgetState();
}

class _FindingRidePageWidgetState extends State<FindingRidePageWidget> {
  late FindingRidePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FindingRidePageModel());

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

    return StreamBuilder<RideRecord>(
      stream: RideRecord.getDocument(widget.rideDetailsReference!),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: Center(
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
        final findingRidePageRideRecord = snapshot.data!;
        return GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            appBar: AppBar(
              backgroundColor: FlutterFlowTheme.of(context).primaryText,
              automaticallyImplyLeading: false,
              title: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'DESTINO',
                    textAlign: TextAlign.start,
                    style: FlutterFlowTheme.of(context).headlineMedium.override(
                          fontFamily: 'Poppins',
                          color: FlutterFlowTheme.of(context).grayIcon,
                          fontSize: 10.0,
                        ),
                  ),
                  Text(
                    findingRidePageRideRecord.destinationAddress,
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Poppins',
                          color: FlutterFlowTheme.of(context).lineColor,
                        ),
                  ),
                ],
              ),
              actions: [],
              centerTitle: false,
              elevation: 2.0,
            ),
            body: SafeArea(
              top: true,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  if (findingRidePageRideRecord.isDriverAssigned)
                    Container(
                      width: MediaQuery.of(context).size.width * 1.0,
                      height: 50.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).info,
                      ),
                      alignment: AlignmentDirectional(-1.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                10.0, 0.0, 0.0, 0.0),
                            child: Text(
                              'Paseo encontrado',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Poppins',
                                    color:
                                        FlutterFlowTheme.of(context).lineColor,
                                    fontSize: 18.0,
                                  ),
                            ),
                          ),
                          Expanded(
                            child: Align(
                              alignment: AlignmentDirectional(1.0, 0.0),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 10.0, 0.0),
                                child: Icon(
                                  Icons.check,
                                  color: FlutterFlowTheme.of(context).lineColor,
                                  size: 24.0,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  if (!findingRidePageRideRecord.isDriverAssigned)
                    Expanded(
                      child: Container(
                        width: double.infinity,
                        height: double.infinity,
                        child: custom_widgets.RouteViewStatic(
                          width: double.infinity,
                          height: double.infinity,
                          lineColor: FlutterFlowTheme.of(context).primary,
                          startAddress: findingRidePageRideRecord.userAddress,
                          destinationAddress:
                              findingRidePageRideRecord.destinationAddress,
                          iOSGoogleMapsApiKey:
                              'AIzaSyAVcl8BmqR0cISbT3OnCG2s9ymfe9VAWPI',
                          androidGoogleMapsApiKey:
                              'AIzaSyArZSzR6JXjM00ZxtL0T7i5MmxjQihI1Ls',
                          webGoogleMapsApiKey:
                              'AIzaSyCnKRqoEinVuflhOCl-RKYqC4mlQrztU_U',
                          startCoordinate:
                              findingRidePageRideRecord.userLocation!,
                          endCoordinate:
                              findingRidePageRideRecord.destinationLocation!,
                        ),
                      ),
                    ),
                  if (findingRidePageRideRecord.isDriverAssigned)
                    Expanded(
                      child: Container(
                        width: double.infinity,
                        height: double.infinity,
                        child: custom_widgets.RouteViewLive(
                          width: double.infinity,
                          height: double.infinity,
                          lineColor: FlutterFlowTheme.of(context).primary,
                          startAddress: ' ',
                          destinationAddress:
                              findingRidePageRideRecord.userAddress,
                          iOSGoogleMapsApiKey:
                              'AIzaSyAVcl8BmqR0cISbT3OnCG2s9ymfe9VAWPI',
                          androidGoogleMapsApiKey:
                              'AIzaSyArZSzR6JXjM00ZxtL0T7i5MmxjQihI1Ls',
                          webGoogleMapsApiKey:
                              'AIzaSyCnKRqoEinVuflhOCl-RKYqC4mlQrztU_U',
                          startCoordinate:
                              findingRidePageRideRecord.driverLocation!,
                          endCoordinate:
                              findingRidePageRideRecord.userLocation!,
                          rideDetailsReference:
                              findingRidePageRideRecord.reference,
                        ),
                      ),
                    ),
                  if (!findingRidePageRideRecord.isDriverAssigned)
                    Align(
                      alignment: AlignmentDirectional(0.0, 1.0),
                      child: Container(
                        width: MediaQuery.of(context).size.width * 1.0,
                        height: 70.0,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).info,
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              10.0, 10.0, 0.0, 0.0),
                          child: Text(
                            'Buscando paseo...',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Poppins',
                                  color: FlutterFlowTheme.of(context).lineColor,
                                  fontSize: 18.0,
                                ),
                          ),
                        ),
                      ),
                    ),
                  if (findingRidePageRideRecord.isDriverAssigned)
                    Align(
                      alignment: AlignmentDirectional(0.0, 1.0),
                      child: Container(
                        width: MediaQuery.of(context).size.width * 1.0,
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 1.0,
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              10.0, 0.0, 10.0, 0.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 10.0, 0.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Expanded(
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 10.0, 0.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            Text(
                                              'llegando a',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        fontSize: 18.0,
                                                      ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 10.0, 10.0),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .info,
                                                borderRadius:
                                                    BorderRadius.circular(10.0),
                                                shape: BoxShape.rectangle,
                                              ),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        10.0, 10.0, 10.0, 10.0),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Text(
                                                          FFAppState()
                                                              .routeDuration,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Poppins',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .lineColor,
                                                                fontSize: 18.0,
                                                              ),
                                                        ),
                                                      ],
                                                    ),
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Text(
                                                          FFAppState()
                                                              .routeDistance,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Poppins',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .grayIcon,
                                                              ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Divider(
                                thickness: 2.0,
                                color: FlutterFlowTheme.of(context).grayIcon,
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            20.0, 20.0, 20.0, 20.0),
                                        child: FlutterFlowIconButton(
                                          borderColor: Colors.transparent,
                                          borderRadius: 30.0,
                                          borderWidth: 1.0,
                                          buttonSize: 50.0,
                                          fillColor:
                                              FlutterFlowTheme.of(context)
                                                  .grayIcon,
                                          icon: Icon(
                                            Icons.person_rounded,
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            size: 30.0,
                                          ),
                                          onPressed: () {
                                            print('IconButton pressed ...');
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                  Expanded(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Text(
                                              findingRidePageRideRecord
                                                  .driverName,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        fontSize: 18.0,
                                                      ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Text(
                                              'Taxi',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .grayIcon,
                                                      ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
