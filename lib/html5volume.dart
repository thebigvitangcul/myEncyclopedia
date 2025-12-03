import 'package:flutter/material.dart';
import 'package:myencyclopedia/homepage.dart';
import 'package:myencyclopedia/main.dart';
import 'package:pdfx/pdfx.dart';

class HTMLPage extends StatefulWidget {
  const HTMLPage({super.key});

  @override
  State<HTMLPage> createState() => _HTMLPageState();
}

class _HTMLPageState extends State<HTMLPage> {

  late PdfControllerPinch pdfControllerPinch;

  final TextEditingController _pageControllerInput = TextEditingController();

  final FocusNode _focusNode = FocusNode();

  final String _inputText = '';

  int totalPageCount = 0, currentPage = 1;

  @override
  void dispose() {
    _focusNode.dispose();
    _pageControllerInput.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    pdfControllerPinch = PdfControllerPinch(
      document: PdfDocument.openAsset("assets/pdfs/html5_tutorial.pdf"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "HTML5 Encyclopedia",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.lightBlue,
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
          children: [
          IconButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => StartPage()));
          }, 
            icon: Icon(
              Icons.home,
             ),
            ),
          Text("Go to page:"),
          SizedBox(
            width: 30,
            child: TextField(
              controller: _pageControllerInput,
              focusNode: _focusNode,
              autofocus: false,
              keyboardType: TextInputType.number,
              decoration: 
              const InputDecoration(
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey, width: 4.0),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue, width: 4.0),
                ),
                hintStyle: TextStyle(color: Colors.white70),
              ),
              onTapOutside: (_) {
                _jumpToUserPage();
                _pageControllerInput.clear();
                FocusScope.of(context).unfocus();
              }
              ),
              ),
          Text('$currentPage'),
          Text("/ $totalPageCount"),
/*           IconButton(
            onPressed: _jumpToUserPage,
              icon: const Icon(Icons.double_arrow)
              ), */
          IconButton(
            onPressed: () {
              pdfControllerPinch.previousPage(duration: Duration(milliseconds: 500,), curve: Curves.linear,);
            },
             icon: Icon(
              Icons.arrow_back,
              ),
            ),
          IconButton(
            onPressed: () {
              pdfControllerPinch.nextPage(duration: Duration(milliseconds: 500,), curve: Curves.linear,);
            },
             icon: Icon(
              Icons.arrow_forward,
              ),
            ), 
          IconButton(
            onPressed: () {
              pdfControllerPinch.animateToPage(
                pageNumber: 4,
                duration: Duration(milliseconds: 250), 
                curve: Curves.ease,
                );
            }, icon: Icon(Icons.book))
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

  void _jumpToUserPage() {
    final int? pageNumber = int.tryParse(_pageControllerInput.text);
    if (pageNumber != null && pageNumber > 0 && (pageNumber <= totalPageCount)) {
      pdfControllerPinch.jumpToPage(pageNumber);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Invalid page number. Enter a number between 1 and $totalPageCount.')),
      );
    }
  }

}