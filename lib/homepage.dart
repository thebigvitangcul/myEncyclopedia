import 'package:flutter/material.dart';
import 'package:pdfx/pdfx.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  late PdfControllerPinch pdfControllerPinch;

  int totalPageCount = 0, currentPage = 1;

  @override
  void initState() {
    super.initState();
    pdfControllerPinch = PdfControllerPinch(
      document: PdfDocument.openAsset("assets/pdfs/flutter_tutorial.pdf"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "myEncyclopedia",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.red,
      ),
      body: _buildUI(),
    );
  }

  Widget _buildUI() {
    return Column(
      children: [
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [Text("Total Pages: ${totalPageCount}"),
          IconButton(
            onPressed: () {
              pdfControllerPinch.previousPage(duration: Duration(milliseconds: 500,), curve: Curves.linear,);
            },
             icon: Icon(
              Icons.arrow_back,
              ),
            ),
          Text("Current Page: ${currentPage}"),
          IconButton(
            onPressed: () {
              pdfControllerPinch.nextPage(duration: Duration(milliseconds: 500,), curve: Curves.linear,);
            },
             icon: Icon(
              Icons.arrow_forward,
              ),
            ), 
          ],
        ),
        _pdfView(),
      ],
    );
  }

  Widget _pdfView () {
    return Expanded(child: 
    PdfViewPinch(controller: pdfControllerPinch, onDocumentLoaded: (doc) {
      setState(() {
        totalPageCount = doc.pagesCount;
      });
    },
    onPageChanged: (page) {
      setState(() {
        currentPage = page;
      });
    },
    ),
    );
  }
}