import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../ViewModel/home_view_model.dart';

class PostView extends StatelessWidget {
  final int id;

  PostView({
    super.key,
    required this.id,
  });
  final homeVM = Get.put(HomeViewModel());
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.symmetric(horizontal: 10),
      itemCount: homeVM.posts.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(
            'Title',
            style: TextStyle(
                color: homeVM.posts[index].userId == id
                    ? Color(0xffAF0917)
                    : Colors.black),
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.65,
                child: Text(
                  homeVM.posts[index].title,
                  style: TextStyle(
                      color: homeVM.posts[index].userId == id
                          ? Colors.black
                          : Colors.black.withAlpha(150)),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                height: 2,
                color: Colors.grey.withAlpha(50),
              )
            ],
          ),
        );
      },
    );
  }
}