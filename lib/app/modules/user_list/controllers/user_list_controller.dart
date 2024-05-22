import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:ttt/app/modules/user_list/model/user.dart';

class UserListController extends GetxController {
  RxList<OfflineUser> users = RxList.empty(growable: true);
  Rx<User?> user = Rx(null);

  @override
  void onInit() {
    super.onInit();
    FirebaseAuth.instance.authStateChanges().listen((User? u) {
      user.value = u;
      if (user.value != null) {
        fetchUsers();
      }
    });
  }

  Future<void> fetchUsers() async {
    FirebaseFirestore.instance
        .collection('users')
        .snapshots()
        .listen((snapshot) {
      users.clear();
      for (var doc in snapshot.docs) {
        var data = doc.data();
        if (doc.id == user.value!.uid) {
          continue;
        }
        users.add(OfflineUser(
          uid: doc.id,
          name: data['name'],
          email: data['email'],
          played: data['played'],
          won: data['won'],
        ));
      }
    });
  }
}
