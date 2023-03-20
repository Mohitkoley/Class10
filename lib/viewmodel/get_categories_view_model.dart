import 'dart:developer';
import 'package:flutter/Material.dart';
import 'package:pdfclass/Utils/constant.dart';
import 'package:pdfclass/Utils/utils.dart';
import 'package:pdfclass/model/get_all_category_model.dart';
import 'package:pdfclass/model/get_resource_model.dart';
import 'package:pdfclass/model/subject_model.dart';
import 'package:pdfclass/repository/category_repository.dart';

class GetCategoriesAndSubCategoriesViewModel extends ChangeNotifier {
  bool _isLoading = true;
  bool get isLoading => _isLoading;

  bool _isLoadingSubject = true;
  bool get isLoadingSubject => _isLoadingSubject;

  bool _isLoadingResource = true;
  bool get isLoadingResource => _isLoadingResource;

  List<DataCategory> categoryList = [];
  List<DataSubject> dataSubjects = [];
  List<DataChapter> dataChapters = [];

  final CategoryRepository _repo = CategoryRepository();
  Future getAllCategoriesApi(BuildContext context) async {
    _isLoading = true;
    notifyListeners();
    _repo.getAllCategories().then((value) {
      GetAllCategoryModel model = GetAllCategoryModel.fromJson(value);
      categoryList = model.dataCategories!;
      _isLoading = false;
      log(categoryList.toString());
      notifyListeners();
    }).onError((error, stackTrace) {
      _isLoading = false;
      notifyListeners();
      //Utils.showSnackBar(context, error.toString(), red);
    });
  }

  Future getSubjectByCategoryApi(BuildContext context, String id) async {
    _isLoadingSubject = true;
    notifyListeners();
    _repo.getSubjectByCategory(id).then((value) {
      SubjectModel model = SubjectModel.fromJson(value);
      dataSubjects = model.dataSubject;
      _isLoadingSubject = false;
      //log(categoryList.toString());
      notifyListeners();
    }).onError((error, stackTrace) {
      _isLoadingSubject = false;
      notifyListeners();
      //Utils.showSnackBar(context, error.toString(), red);
    });
  }

  Future getResourceBySubjectApi(BuildContext context, String id) async {
    _isLoadingResource = true;
    notifyListeners();
    _repo.getChapterBySubject(id).then((value) {
      ResourceModel model = ResourceModel.fromJson(value);
      dataChapters = model.dataChapter;
      _isLoadingResource = false;
      //log(categoryList.toString());
      notifyListeners();
    }).onError((error, stackTrace) {
      _isLoadingResource = false;
      notifyListeners();
      //Utils.showSnackBar(context, error.toString(), red);
    });
  }
}
