import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:doctor_system/models/login_model.dart';
import 'package:doctor_system/service/dio_helper.dart';
import 'package:doctor_system/service/end_points.dart';
import 'package:doctor_system/service/shared_prefrence_helper.dart';
import 'package:doctor_system/service/token.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
part 'authentication_state.dart';

class AuthenticationCubit extends Cubit<AuthenticationState> {
  AuthenticationCubit() : super(AuthenticationInitial());
  static AuthenticationCubit get(context) => BlocProvider.of(context);


  final formKey = GlobalKey<FormState>();

  var emailController = TextEditingController();

  var passwordController = TextEditingController();

 LoginResponseModel loginResponseModel = LoginResponseModel();
  void userLogin(LoginRequestModel loginRequestModel){
    emit(UserLoginLoadingState());
    DioHelper.postData(url: postUserLogin,
        data:loginRequestModel.toJson()).then((value) {
          if(value.statusCode == 200 || value.statusCode == 201){
            var jsonData = jsonDecode(value.data);
            LoginResponseModel loginResponseModel =LoginResponseModel.fromJson(jsonData);
            SharedPreferenceHelper.saveData(key: tokenKey, value: loginResponseModel.data!.token!);
            SharedPreferenceHelper.saveData(key: userName, value: loginResponseModel.data!.username!);
            emit(UserLoginSuccessState());
          }
          else {
            var jsonData = jsonDecode(value.data);
            print(jsonData);
            emit(UserLoginErrorState(jsonData['data'].toString()));
          }
        }).catchError((onError){
      emit(UserLoginErrorState(onError.toString()));
    });

  }
}
