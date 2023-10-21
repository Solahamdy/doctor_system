import 'package:doctor_system/blocs/authentication/authentication_cubit.dart';
import 'package:doctor_system/blocs/registration/registration_cubit.dart';
import 'package:doctor_system/screens/doctor_account_screen.dart';
import 'package:doctor_system/screens/appointments.dart';
import 'package:doctor_system/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/doctor_cubit/doctor_cubit.dart';
import '../screens/patient_account_screen.dart';
class AppRoot extends StatelessWidget {
  const AppRoot({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (BuildContext context)=> DoctorCubit()),
        BlocProvider(create: (BuildContext context)=> AuthenticationCubit()),
        BlocProvider(create: (BuildContext context)=> RegistrationCubit()),
      ],
      child:  MaterialApp(
         home: LoginScreen(),
      ),
    ) ;
  }
}
