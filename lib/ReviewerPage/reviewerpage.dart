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
import 'package:flutter_pdfview/flutter_pdfview.dart';

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
    // _model = createModel(context, () => ReviewPageModel());
  }

  @override
  void dispose() {
    //_model.dispose();

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
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          automaticallyImplyLeading: false,
          title: Align(
            alignment: AlignmentDirectional(-1, 1),
            child: Text(
              'Page Title',
              style: FlutterFlowTheme.of(context).displaySmall.override(
                    fontFamily: 'Outfit',
                    color: Color(0xFF0F1113),
                    fontSize: 26,
                    letterSpacing: 0,
                    fontWeight: FontWeight.w500,
                  ),
            ),
          ),
          actions: [],
          centerTitle: false,
          elevation: 0,
        ),
        body: Stack(
          children: [
            Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Align(
                          alignment: AlignmentDirectional(-1, 0),
                          child: Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(16, 0, 0, 0),
                            child: Text(
                              'Online Proctor',
                              style: FlutterFlowTheme.of(context)
                                  .labelMedium
                                  .override(
                                    fontFamily: 'Plus Jakarta Sans',
                                    color: Color(0xFF57636C),
                                    fontSize: 14,
                                    letterSpacing: 0,
                                    fontWeight: FontWeight.w500,
                                  ),
                            ),
                          ),
                        ),
                        Divider(
                          height: 32,
                          thickness: 2,
                          color: FlutterFlowTheme.of(context).alternate,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const Align(
              alignment: AlignmentDirectional(0, -0.23),
              child: SizedBox(
                height: 650,
                child: PDFView(
                  filePath: 'lib/assets/review-example.pdf',
                  enableSwipe: true,
                  swipeHorizontal: true,
                  autoSpacing: false,
                  pageFling: false,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ReviewPageModel {}
