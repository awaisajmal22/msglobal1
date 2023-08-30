import 'package:flutter/material.dart';

class ProfileView extends StatelessWidget {
  final int id;
  final String username;
  final String name;
  final String address;
  final String zipCode;
  ProfileView(
      {super.key,
      required this.username,
      required this.id,
      required this.name,
      required this.address,
      required this.zipCode});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        widgetTile(title: 'Name', data: name),
        Container(
          height: 2,
          color: Colors.grey.withAlpha(50),
        ),
        widgetTile(title: 'Username', data: username),
        Container(
          height: 2,
          color: Colors.grey.withAlpha(50),
        ),
        widgetTile(title: 'Address', data: address),
        Container(
          height: 2,
          color: Colors.grey.withAlpha(50),
        ),
        widgetTile(title: 'Zip Code', data: zipCode),
        Container(
          height: 2,
          color: Colors.grey.withAlpha(50),
        ),
      ],
    );
  }

  Widget widgetTile({required String title, required String data}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
            ),
          ),
          Text(
            data,
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
            ),
          )
        ],
      ),
    );
  }
}
