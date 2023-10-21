part of 'registration_cubit.dart';

@immutable
abstract class RegistrationState {}

class RegistrationInitial extends RegistrationState {}
class GenderChangedChanged extends RegistrationState {}
class UserRegisterLoadingState extends RegistrationState {}
class UserRegisterSuccessState extends RegistrationState {}
class UserRegisterErrorState extends RegistrationState {
  final String error;

  UserRegisterErrorState(this.error);
}
