import 'package:appscrip_demo/model/user_model.dart';
import 'package:appscrip_demo/screen/user_detail/user_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget userListItem({required User user}){
  return Material(elevation: 5, borderRadius: BorderRadius.circular(10),
    child: Container(
      padding: const EdgeInsets.all(10),
      child: Row(
        children: [
          Expanded(
            child: Column(mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Icon(Icons.person, size: 20, color: Colors.blueAccent),
                    const SizedBox(width: 8),
                    Text(
                      user.name,
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    const Icon(Icons.email, size: 20, color: Colors.blueAccent),
                    const SizedBox(width: 8),
                    Text(user.email.toLowerCase()),
                  ],
                ),
              ],
            ),
          ),
          IconButton(onPressed: (){
            Get.to(UserDetailScreen(user: user));
          }, icon: const Icon(Icons.arrow_forward_ios, size: 15, color: Colors.blueAccent,)),
        ],
      ),
    ),
  );
}