import 'package:boilerplate/di/service_locator.dart';
import 'package:boilerplate/presentation/login/store/login_store.dart';
import 'package:mobx/mobx.dart';

part 'profile.g.dart';

class Profile = ProfileBase with _$Profile;

abstract class ProfileBase with Store {
  bool isSetEmail = false;

  UserStore userStore = getIt<UserStore>();

  ProfileBase(this.userStore) {
    print('ss');
    print(userStore);
    if (userStore.loginParams != null) {
      email = userStore.loginParams!.username;
      print(email);
      print('1313');
    }
  }

  @observable
  String email = "";

  @observable
  String firstName = "Hai";

  @observable
  String lastName = "Ly";

  @action
  void updateUserProfile(String email, String firstName, String lastName) {
    this.email = email;
    this.firstName = firstName;
    this.lastName = lastName;
  }

  @action
  void setEmail(String email) {
    if (this.isSetEmail == false) {
      this.email = email;
      this.isSetEmail = true;
    }
  }

  @computed
  String get fullName {
    return "$firstName $lastName";
  }
}
