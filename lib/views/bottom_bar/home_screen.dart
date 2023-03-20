import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:pdfclass/Utils/constant.dart';
import 'package:pdfclass/data/api_url.dart';
import 'package:pdfclass/model/get_all_category_model.dart';
import 'package:pdfclass/routes/route_name.dart';
import 'package:pdfclass/viewmodel/get_categories_view_model.dart';
import "package:provider/provider.dart";

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: context.watch<GetCategoriesAndSubCategoriesViewModel>().isLoading
            ? Center(
                child: const CircularProgressIndicator(
                  color: green,
                ),
              )
            : Column(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 2, right: 2),
                      child: Container(
                          child: GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                childAspectRatio: 6 / 2,
                                mainAxisSpacing: 10),
                        itemCount: context
                            .watch<GetCategoriesAndSubCategoriesViewModel>()
                            .categoryList
                            .length,

                        ///shrinkWrap: true,
                        physics: const ScrollPhysics(),

                        itemBuilder: (BuildContext context, int index) {
                          DataCategory category = context
                              .watch<GetCategoriesAndSubCategoriesViewModel>()
                              .categoryList[index];

                          log("${ApiUrl.baseUrl}/api/${category.image}");

                          // String image = category.image!.replaceAll("\\", "/");

                          // log("${ApiUrl.baseUrl}/api/$image");

                          log(context
                              .watch<GetCategoriesAndSubCategoriesViewModel>()
                              .categoryList
                              .toString());
                          return GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(
                                  context, RouteName.subjectScreen,
                                  arguments: category.sId);
                            },
                            child: Container(
                              margin:
                                  EdgeInsets.only(top: 5, right: 5, left: 5),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                  color: Color.fromARGB(255, 224, 221, 221),
                                ),
                              ),
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      width: 50,
                                      height: 30,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Colors.green.withOpacity(0.2),
                                      ),
                                      child: Center(
                                        child: Text(
                                          category.name!.substring(0, 1),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      margin: EdgeInsets.all(5),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Text(
                                        category.name!,
                                        style: const TextStyle(
                                            fontWeight: FontWeight.w700),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      )),
                    ),
                  )
                ],
              ),
      ),
    );
  }
}
