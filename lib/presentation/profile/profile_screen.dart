import 'package:boilerplate/di/service_locator.dart';
import 'package:boilerplate/presentation/login/store/login_store.dart';
import 'package:boilerplate/presentation/profile/store/profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});

  Profile profile = getIt<Profile>();
  UserStore userStore = getIt<UserStore>();

  @override
  Widget build(BuildContext context) {
    if (profile.isSetEmail == false) {
      profile.setEmail(userStore.loginParams!.username);
    }
    TextEditingController emailController =
        TextEditingController(text: profile.email);
    TextEditingController firstNameController =
        TextEditingController(text: profile.firstName);
    TextEditingController lastNameController =
        TextEditingController(text: profile.lastName);
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: Observer(builder: (context) {
        return Column(
          children: [
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                labelText: 'Email',
              ),
            ),
            TextField(
              controller: firstNameController,
              decoration: InputDecoration(
                labelText: 'First Name',
              ),
            ),
            TextField(
              controller: lastNameController,
              decoration: InputDecoration(
                labelText: 'Last Name',
              ),
            ),
            ElevatedButton(
              onPressed: () {
                profile.updateUserProfile(emailController.text,
                    firstNameController.text, lastNameController.text);

                Navigator.pop(context);
              },
              child: Text('Update'),
            ),
          ],
        );
      }),
    );
  }
}
