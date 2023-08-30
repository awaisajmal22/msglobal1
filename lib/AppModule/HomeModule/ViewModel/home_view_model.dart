import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testwork/Network/api_services.dart';

import '../../../Model/posts_model.dart';

class HomeViewModel extends GetxController
    with GetSingleTickerProviderStateMixin {
  late TabController tabController;
  RxList<PostModel> posts = <PostModel>[].obs;
  @override
  void onInit() {
    super.onInit();
    getPostData();
    tabController = TabController(length: 2, vsync: this);
    @override
    void onClose() {
      tabController.dispose();
      super.onClose();
    }
  }

  getPostData() async {
    final resp = await ApiService().getPosts();
    posts.addAll(postModelFromJson(resp.body));
  }
}
