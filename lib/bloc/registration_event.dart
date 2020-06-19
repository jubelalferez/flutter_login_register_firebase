part of 'registration_bloc.dart';

abstract class RegistrationEvent extends Equatable {
  const RegistrationEvent();
}

class OnClickRegister extends RegistrationEvent {
  final String username;
  final String password;
  final String phoneNumber;

  OnClickRegister(this.username, this.password, this.phoneNumber);

  @override
  List<Object> get props => [username, password, phoneNumber];
}
