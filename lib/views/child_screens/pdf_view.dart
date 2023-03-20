// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:pdfclass/views/view_exporter.dart';

class PdfView extends StatefulWidget {
  const PdfView({
    Key? key,
    required this.data,
  }) : super(key: key);
  final Map<String, dynamic> data;
  @override
  State<PdfView> createState() => _PdfViewState();
}

class _PdfViewState extends State<PdfView> {
  final GlobalKey<SfPdfViewerState> _pdfViewerKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.data["name"]),
        // actions: <Widget>[
        //   IconButton(
        //     icon: const Icon(
        //       Icons.bookmark,
        //       color: Colors.white,
        //       semanticLabel: 'Bookmark',
        //     ),
        //     onPressed: () {
        //       _pdfViewerKey.currentState?.openBookmarkView();
        //     },
        //   ),
        // ],
      ),
      body: SfPdfViewer.network(
        widget.data["url"],
        key: _pdfViewerKey,
      ),
    );
  }
}
