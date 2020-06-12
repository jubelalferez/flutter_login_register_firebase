import 'package:cloud_firestore/cloud_firestore.dart';

class Database {
  final CollectionReference userCollection =
      Firestore.instance.collection('User');

  Future getLoginData(String username, String password) async {
    bool isAccountValid = false;
    try {
      QuerySnapshot user =
          await userCollection.getDocuments(source: Source.server);
      if (user.documents.length > 0) {
        for (var userAccount in user.documents) {
          if (username == userAccount.data['username'] &&
              password == userAccount.data['password']) {
            isAccountValid = true;
          }
        }

        return isAccountValid;
      } else {
        return isAccountValid;
      }
    } catch (e) {
      print(e);
      return 'error';
    }
  }
}
