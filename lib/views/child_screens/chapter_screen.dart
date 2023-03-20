import 'package:pdfclass/data/api_url.dart';
import 'package:pdfclass/views/child_screens/pdf_view.dart';
import 'package:pdfclass/views/view_exporter.dart';
import 'package:pdfclass/model/get_resource_model.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class ChapterScreen extends StatefulWidget {
  ChapterScreen({super.key, required this.cid});
  final String cid;
  @override
  State<ChapterScreen> createState() => _ChapterScreenState();
}

class _ChapterScreenState extends State<ChapterScreen> {
  @override
  void initState() {
    super.initState();
    callApi();
  }

  callApi() {
    context
        .read<GetCategoriesAndSubCategoriesViewModel>()
        .getResourceBySubjectApi(context, widget.cid);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Chapters"),
        ),
        body: context
                .watch<GetCategoriesAndSubCategoriesViewModel>()
                .isLoadingResource
            ? const Center(
                child: CircularProgressIndicator(
                color: green,
              ))
            : ListView.separated(
                itemBuilder: (context, index) {
                  DataChapter data = context
                      .read<GetCategoriesAndSubCategoriesViewModel>()
                      .dataChapters[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PdfView(
                                    data: {
                                      // "url":
                                      //     "${ApiUrl.baseUrl}/api/${data.pdf}",
                                      "url":
                                          "https://classten.onrender.com/api/uploads/pdfs/1679307357553-1. Home Page_Final.pdf",
                                      "name": data.name
                                    },
                                  )));
                    },
                    //create a elevated card with elevation only on bottom
                    child: Container(
                      height: 100,
                      decoration: BoxDecoration(
                          color: white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                                color: black.withOpacity(0.1),
                                offset: const Offset(0, 5),
                                blurRadius: 10)
                          ]),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                  color: green.withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(10)),
                              child: const Icon(
                                Icons.book,
                                color: green,
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    data.name,
                                    style: const TextStyle(
                                        color: black,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  const Text(
                                    "View PDF",
                                    style: TextStyle(
                                        color: black,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            const Icon(
                              Icons.download,
                              color: black,
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return const SizedBox(
                    height: 10,
                  );
                },
                itemCount: context
                    .read<GetCategoriesAndSubCategoriesViewModel>()
                    .dataChapters
                    .length));
  }
}
