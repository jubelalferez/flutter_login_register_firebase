import 'package:equatable/equatable.dart';

class Account extends Equatable {
  String loginUsername;
  String loginPassword;

  static String registrationUsername;
  static String registrationPassword;

  String registrationPhoneNumber;

  static String verificationCode1 = '';
  static String verificationCode2 = '';
  static String verificationCode3 = '';
  static String verificationCode4 = '';
  static String verificationCode5 = '';
  static String verificationCode6 = '';

  static String verifyPhoneNumber;

  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();
}
