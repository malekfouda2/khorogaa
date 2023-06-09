import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khoroga/core/service/home_services.dart';
import 'package:khoroga/model/category_model.dart';

import '../../model/place_model.dart';
import '../../model/top_rated_model.dart';

class HomeViewModel extends GetxController{
  
  List<CategoryModel>? get categoryModel=>_categoryModel;
  List<CategoryModel>? _categoryModel=[];
  List<TopRatedModel>? get topRatedModel=>_top_ratedModel;
  List<TopRatedModel>? _top_ratedModel=[];
  List<PlaceModel>? get placesmodel=>_placesmodel;
  List<PlaceModel>? _placesmodel=[];

  ValueNotifier<bool> get loading => _loading;
  final ValueNotifier<bool> _loading = ValueNotifier(false);
  RxList<PlaceModel>? placesByCategory = <PlaceModel>[].obs;
  HomeViewModel(){
    getCategory();
    getTopRated();
  }
  void fetchPlacesByCategory(String categoryName) async {
  _loading.value = true;
  _placesmodel?.clear(); // Clear the existing places
  HomeService().getPlacesByCategory(categoryName).then((value) {
    for (int i = 0; i < value.length; i++) {
      _placesmodel?.add(PlaceModel.fromJson(value[i].data() as Map<dynamic, dynamic>));
      _loading.value = false;
    }
    update();
  });
}


  getCategory() async{
    _loading.value=true;
    HomeService().getCategory().then((value) {
      for(int i=0;i<value.length;i++){
        _categoryModel?.add(CategoryModel.fromJson(value[i].data() as Map<dynamic,dynamic>));
        _loading.value=false;
      }
      update();
    });
  }

  getTopRated() async{
    _loading.value=true;
    HomeService().getTopRated().then((value) {
      for(int i=0;i<value.length;i++){
        _top_ratedModel?.add(TopRatedModel.fromJson(value[i].data() as Map<dynamic,dynamic>));
        
        _loading.value=false;
      }
      // print(_top_ratedModel !.length);
      update();
    });
  }
}