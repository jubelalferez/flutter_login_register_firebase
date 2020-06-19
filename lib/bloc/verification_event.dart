part of 'verification_bloc.dart';

abstract class VerificationEvent extends Equatable {
  const VerificationEvent();
}

class OnSendPhoneNumber extends VerificationEvent {
  final String phoneNumber;

  OnSendPhoneNumber(this.phoneNumber);

  @override
  List<Object> get props => [phoneNumber];
}

class OnVerifyCode extends VerificationEvent {
  final String verificationCode;

  OnVerifyCode(this.verificationCode);

  @override
  List<Object> get props => [verificationCode];
}
