import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_login_register_firebase/model/account.dart';
import 'package:flutter_login_register_firebase/service/database.dart';

part 'verification_event.dart';
part 'verification_state.dart';

class VerificationBloc extends Bloc<VerificationEvent, VerificationState> {
  Database database = Database();
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  AuthCredential authCredential;
  String googleCode;
  bool canTransferToNextPage = true;

  @override
  VerificationState get initialState => VerificationInitial();

  @override
  Stream<VerificationState> mapEventToState(
    VerificationEvent event,
  ) async* {
    if (event is OnSendPhoneNumber) {
      yield VerificationLoading();
      await firebaseAuth.verifyPhoneNumber(
          phoneNumber: '+63' + event.phoneNumber,
          timeout: Duration(seconds: 0),
          verificationCompleted: (authCredential) async {
            this.authCredential = authCredential;
          },
          verificationFailed: (authException) {
            print(authException.message);
          },
          codeSent: (verifyID, [forceResend]) {
            googleCode = verifyID;
          },
          codeAutoRetrievalTimeout: (verifyID) {
            googleCode = verifyID;
          });
      await Future.delayed(Duration(seconds: 5), () async {
        await FirebaseAuth.instance
            .signInWithCredential(authCredential)
            .whenComplete(() {
          canTransferToNextPage = true;
        }).catchError((onError) {
          canTransferToNextPage = false;
        });
      });
      if (canTransferToNextPage == true) {
        yield VerificationSuccess();
      } else if (canTransferToNextPage == false) {
        yield VerificationLoading();
      }
    } else if (event is OnVerifyCode) {
      yield VerificationLoading();
      authCredential = PhoneAuthProvider.getCredential(
          verificationId: googleCode, smsCode: event.verificationCode);
      await Future.delayed(Duration(seconds: 5), () async {
        await FirebaseAuth.instance
            .signInWithCredential(authCredential)
            .whenComplete(() {
          canTransferToNextPage = true;
        }).catchError((onError) {
          canTransferToNextPage = false;
          print('Invalid code');
        });
      });
      if (canTransferToNextPage == true) {
        await database.createAccount(Account.registrationUsername,
            Account.registrationPassword, '+63' + Account.verifyPhoneNumber);
        yield VerificationSuccess();
      } else {
        yield VerificationInitial();
        print('Verification Error');
      }
    }
  }
}
