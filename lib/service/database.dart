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

  Future checkExistingUsername(String username) async {
    bool isUsernameExist = false;
    try {
      QuerySnapshot user =
          await userCollection.getDocuments(source: Source.server);
      for (var userAccount in user.documents) {
        if (username == userAccount.data['username']) {
          isUsernameExist = true;
        }
      }
      return isUsernameExist;
    } catch (e) {
      print(e);
      return 'error';
    }
  }

  Future checkExistingPhoneNumber(String phoneNumber) async {
    bool isPhoneNumberExist = false;
    try {
      QuerySnapshot user =
          await userCollection.getDocuments(source: Source.server);
      if (phoneNumber.startsWith('9') == true && phoneNumber.length == 10) {
        phoneNumber = phoneNumber.replaceFirst('9', '+639', 0);
        for (var userAccount in user.documents) {
          if (phoneNumber == userAccount.data['phoneNumber']) {
            isPhoneNumberExist = true;
          }
        }
        return isPhoneNumberExist;
      } else {
        return 'error';
      }
    } catch (e) {
      print(e);
      return 'error';
    }
  }

  Future createAccount(
      String username, String password, String phoneNumber) async {
    try {
      await userCollection.document(username).setData({
        'username': username,
        'password': password,
        'phoneNumber': phoneNumber,
      });
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }
}
