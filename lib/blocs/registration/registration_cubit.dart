import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:doctor_system/enums/gender_enum.dart';
import 'package:doctor_system/models/register_model.dart';
import 'package:doctor_system/service/end_points.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import '../../service/dio_helper.dart';
import '../../service/shared_prefrence_helper.dart';
part 'registration_state.dart';

class RegistrationCubit extends Cubit<RegistrationState> {
  RegistrationCubit() : super(RegistrationInitial());
  static RegistrationCubit get(context) => BlocProvider.of(context);
  final formKey = GlobalKey<FormState>();
  var userNameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var passwordConfirmController = TextEditingController();
  var phoneController = TextEditingController();

  int selectedGender = 0 ;
 void genderChanged(gender){
  selectedGender = gender ;
  emit(GenderChangedChanged());
 }





  RegisterResponseModel registerResponseModel = RegisterResponseModel();
  void userRegister(RegisterRequestModel registerRequestModel){
    emit(UserRegisterLoadingState());
    print(registerRequestModel.toJson());
    DioHelper.postData(url: postUserRegister,
        data:registerRequestModel.toJson()).then((value) {
      if(value.statusCode == 200 || value.statusCode == 201){
        var jsonData = jsonDecode(value.data);
        emit(UserRegisterSuccessState());
      }
      else {
        var jsonData = jsonDecode(value.data);
        print(jsonData);
        emit(UserRegisterErrorState(jsonData['data'].toString()));
      }
    }).catchError((onError){
      emit(UserRegisterErrorState(onError.toString()));
    });

  }







}
