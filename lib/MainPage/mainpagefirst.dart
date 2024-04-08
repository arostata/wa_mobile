
import 'package:flutter/material.dart';



class MainPageFirstWidget extends StatefulWidget {
  const MainPageFirstWidget({super.key});

  @override
  State<MainPageFirstWidget> createState() => _MainPageFirstWidgetState();
}

class _MainPageFirstWidgetState extends State<MainPageFirstWidget> {
  late MainPageFirstModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    //_model = createModel(context, () => MainPageFirstModel());
  }


  @override
  void dispose() {
    //_model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
   //   onTap: () => _model.unfocusNode.canRequestFocus
      //    ? FocusScope.of(context).requestFocus(_model.unfocusNode)
        //  : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
              appBar: AppBar(
        title: const Text('Main Page'),
      ),
    //    backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: Align(
            alignment: const AlignmentDirectional(0, 0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Align(
                  alignment: const AlignmentDirectional(0, 0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child:
                     Image.asset(
                      'lib/assets/UnregisteredIcon.png',
                      width: 168.74,
                      height: 155.78,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class MainPageFirstModel {
}
