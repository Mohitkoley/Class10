import 'package:pdfclass/model/subject_model.dart';
import 'package:pdfclass/routes/route_name.dart';
import 'package:pdfclass/views/view_exporter.dart';

class SubjectScreen extends StatefulWidget {
  SubjectScreen({super.key, required this.id});
  final String id;

  @override
  State<SubjectScreen> createState() => _SubjectScreenState();
}

class _SubjectScreenState extends State<SubjectScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _refresh();
  }

  void _refresh() {
    context
        .read<GetCategoriesAndSubCategoriesViewModel>()
        .getSubjectByCategoryApi(context, widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Subjects")),
        body: context
                .watch<GetCategoriesAndSubCategoriesViewModel>()
                .isLoadingSubject
            ? const Center(
                child: CircularProgressIndicator(
                color: green,
              ))
            : RefreshIndicator(
                onRefresh: () {
                  return context
                      .read<GetCategoriesAndSubCategoriesViewModel>()
                      .getSubjectByCategoryApi(context, widget.id);
                },
                color: green,
                child: ListView.separated(
                  separatorBuilder: ((context, index) {
                    return const SizedBox(
                      height: 10,
                    );
                  }),
                  itemCount: context
                      .read<GetCategoriesAndSubCategoriesViewModel>()
                      .dataSubjects
                      .length,
                  padding: const EdgeInsets.all(8.0),
                  itemBuilder: (context, index) {
                    DataSubject data = context
                        .read<GetCategoriesAndSubCategoriesViewModel>()
                        .dataSubjects[index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, RouteName.chapterScreen,
                            arguments: data.id);
                      },
                      //create a elevated card with elevation only on bottom
                      child: Container(
                        height: 80,
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
                              CircleAvatar(
                                radius: 20,
                                backgroundColor: green,
                                child: Text(
                                  data.name.substring(0, 1).toUpperCase(),
                                  style: const TextStyle(color: white),
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
                  },
                ),
              ));
  }
}
