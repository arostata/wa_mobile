import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'package:go_router/go_router.dart';
import 'package:wa_mobile/MainPage/loginPageModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ReviewPageWidget extends StatefulWidget {
  const ReviewPageWidget({super.key});

  @override
  State<ReviewPageWidget> createState() => _ReviewPageWidgetState();
}

class _ReviewPageWidgetState extends State<ReviewPageWidget> {
  late ReviewPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    //_model = createModel(context, () => ReviewPageModel());
  }

  @override
  void dispose() {
    //  _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // onTap: () => _model.unfocusNode.canRequestFocus
      //     ? FocusScope.of(context).requestFocus(_model.unfocusNode)
      //     : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        body: SafeArea(
          top: true,
          child: Stack(
            children: [
              Stack(
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(24, 0, 0, 0),
                                child: Text(
                                  'The title or label of exam',
                                  style: FlutterFlowTheme.of(context)
                                      .displaySmall
                                      .override(
                                        fontFamily: 'Outfit',
                                        fontSize: 16,
                                        letterSpacing: 0,
                                        fontWeight: FontWeight.w500,
                                      ),
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(24, 4, 0, 0),
                                child: Text(
                                  'Online Proctor',
                                  textAlign: TextAlign.start,
                                  style: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .override(
                                        fontFamily: 'Readex Pro',
                                        letterSpacing: 0,
                                        fontWeight: FontWeight.w500,
                                      ),
                                ),
                              ),
                              Divider(
                                height: 32,
                                thickness: 1,
                                color: FlutterFlowTheme.of(context).alternate,
                              ),
                              Align(
                                alignment: AlignmentDirectional(0, 0),
                                child: PDFView(
                                  filePath: 'lib/assets/review-example.pdf',
                                  enableSwipe: true,
                                  swipeHorizontal: true,
                                  autoSpacing: false,
                                  pageFling: false,
                                  onRender: (_pages) {
                                    // setState(() {
                                    //   pages = _pages;
                                    //   isReady = true;
                                    // });
                                  },
                                  onError: (error) {
                                    print(error.toString());
                                  },
                                  onPageError: (page, error) {
                                    print('$page: ${error.toString()}');
                                  },
                                  // onViewCreated:
                                  //     (PDFViewController pdfViewController) {
                                  //   _controller.complete(pdfViewController);
                                  // },
                                  // onPageChanged: (int page, int total) {
                                  //   print('page change: $page/$total');
                                  // },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
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

class ReviewPageModel {}
