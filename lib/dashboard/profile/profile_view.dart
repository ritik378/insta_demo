import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Profile'),
            IconButton(onPressed: (){
              GetStorage().write('isLogged', false);
              Get.offAllNamed('/login');
            }, icon: const Icon(Icons.logout, color: Colors.red,))
          ],
        ),
      ),
    );
  }
}
