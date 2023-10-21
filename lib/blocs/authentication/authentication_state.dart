part of 'authentication_cubit.dart';

@immutable
abstract class AuthenticationState {}

class AuthenticationInitial extends AuthenticationState {}
class UserLoginLoadingState extends AuthenticationState {}
class UserLoginSuccessState extends AuthenticationState {}
class UserLoginErrorState extends AuthenticationState {
  final String error;

  UserLoginErrorState(this.error);
}
