import 'package:appscrip_demo/anim.dart';
import 'package:appscrip_demo/screen/user_list/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../model/user_model.dart';
import '../widget/user_list_item.dart';

class UserListScreen extends StatelessWidget {

  UserListScreen({super.key});
  final UserController userController = Get.put(UserController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Center(child: Text("User List"))),
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: userController.fetchUsers,
          child: Obx(() {
            if (!userController.hasInternet.value) {
              return Expanded(
                child: ListView(
                  children: const [
                    Center(child: Text('No internet connection')),
                  ],
                ),
              );
            } else if (userController.isLoading.value) {
              return const Center(child: CircularProgressIndicator());
            }else if (userController.users.isEmpty) {
              return Expanded(
                child: ListView(
                  children: const [
                    Center(child: Text("No users found")),
                  ],
                ),
              );
            }
            return ListView.builder(
              itemCount: userController.users.length,
              itemBuilder: (context, index) {
                User user = userController.users[index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: FadeInAnimation(
                    delay: 0.6 * index,
                    direction: 'down',
                    child: userListItem(user: user),
                  ),
                );
              },
            );

          }),
        ),
      ),
    );
  }
}