import 'package:easy_pdf_viewer/easy_pdf_viewer.dart';
import 'package:flutter/material.dart';

class ReviewerPage extends StatefulWidget {
  const ReviewerPage({super.key});

  @override
  _ReviewerPage createState() => _ReviewerPage();
}

class _ReviewerPage extends State<ReviewerPage> {
  bool _isLoading = true;
  late PDFDocument document;

  @override
  void initState() {
    super.initState();
    loadDocument();
  }

  loadDocument() async {
    document = await PDFDocument.fromAsset('lib/assets/review_example.pdf');

    // Or from a URL
    // document = await PDFDocument.fromURL(
    //    'https://www.ecma-international.org/wp-content/uploads/ECMA-262_12th_edition_june_2021.pdf');

    // Or from a file
    // File file  = File('...');
    // document = await PDFDocument.fromFile(file);
    setState(() => _isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'The title or label of exam',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Online Proctor',
              style: TextStyle(
                fontSize: 12,
                color: Color(0xFF616161),
              ),
            ),
          ],
        ),
      ),
      body: Center(
        child: _isLoading
            ? const Center(child: CircularProgressIndicator())
            : PDFViewer(document: document),
      ),
    );
  }
}
