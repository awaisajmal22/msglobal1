import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../ViewModel/home_view_model.dart';
import 'component/posts.dart';
import 'component/profile.dart';

class HomeView extends StatelessWidget {
  final int id;
  final String username;
  final String name;
  final String address;
  final String zipCode;
  HomeView(
      {super.key,
      required this.username,
      required this.id,
      required this.name,
      required this.address,
      required this.zipCode});
  final homeVM = Get.put(HomeViewModel());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: Container(
          height: 48,
          width: 48,
          decoration:
             const BoxDecoration(shape: BoxShape.circle, color: Color(0xffE43228)),
          child: Center(
            child: Icon(
              Icons.add,
              color: Colors.white,
            ),
          ),
        ),
        drawer: Drawer(),
        appBar: AppBar(
          elevation: 40,
          bottom: TabBar(
              indicatorSize: TabBarIndicatorSize.tab,
              indicatorColor: Colors.white,
              labelStyle: const TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.bold),
              indicator: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(width: 3, color: Colors.white))),
              controller: homeVM.tabController,
              tabs: [
                Tab(
                  text: 'All Posts'.toUpperCase(),
                ),
                Tab(text: 'Profile'.toUpperCase()),
              ]),
          title: Text(
            name,
            style: const TextStyle(
                color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
          ),
          actions: const [
            Icon(Icons.search),
            SizedBox(
              width: 30,
            )
          ],
        ),
        body: TabBarView(controller: homeVM.tabController, children: [
          PostView(
            id: id,
          ),
          ProfileView(
            address: address,
            zipCode: zipCode,
            id: id,
            name: name,
            username: username,
          )
        ]));
  }
}
