part of 'verification_bloc.dart';

abstract class VerificationState extends Equatable {
  const VerificationState();
}

class VerificationInitial extends VerificationState {
  @override
  List<Object> get props => [];
}

class VerificationSuccess extends VerificationState {
  @override
  List<Object> get props => [];
}

class VerificationLoading extends VerificationState {
  @override
  List<Object> get props => [];
}
