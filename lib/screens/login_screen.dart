import 'package:doctor_system/blocs/authentication/authentication_cubit.dart';
import 'package:doctor_system/models/login_model.dart';
import 'package:doctor_system/screens/appointments.dart';
import 'package:doctor_system/screens/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../components/my_text.dart';
import '../components/text_login_register_field.dart';
import '../service/shared_prefrence_helper.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfffcfcfc),
      resizeToAvoidBottomInset: true,
      body: BlocConsumer<AuthenticationCubit, AuthenticationState>(
        listener: (context, state) {
          if (state is UserLoginSuccessState) {
            ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Login Successful'),
                  backgroundColor: Color(0xff18a7d1),));
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const AppointmentsScreen(),
                ));}
          else if (state is UserLoginErrorState){
            ScaffoldMessenger.of(context).showSnackBar(
                 SnackBar(content: Text(state.error),backgroundColor: const Color(0xff18a7d1),));
          }
        },
        builder: (context, state) {
          var cubit = AuthenticationCubit.get(context);
          return Form(
            key: cubit.formKey,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(
                    height: 80,
                  ),
                  Align(
                      alignment: Alignment.center,
                      child: MyText(
                        size: 20,
                        color: const Color(0xff18a7d1),
                        isBold: true,
                        text: 'Hello , please login into your account',
                      )),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    padding: const EdgeInsets.all(5),
                   color: const Color(0xfffcfcfc),
                    child: Column(
                      children: [
                        const SizedBox(height: 30),
                        const Image(
                            image: AssetImage('assets/login_image.png'),
                            width: 400,
                            height: 250),
                        const SizedBox(
                          height: 20,
                        ),
                        TextLoginRegisterField(icon: Icons.email,text: 'Email',validator:  (value) {
                          if (value == null || value.isEmpty) {
                            return 'Email is required' ;}
                          else if (!value.endsWith('.com')) {
                            return 'Email must end with .com';}
                        }, controller:cubit.emailController),
                        const SizedBox(
                          height: 10,
                        ),
                        TextLoginRegisterField(icon:Icons.lock, text: 'Password',validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Password is required';}
                         //else if (value.length < 8) {
                         //  return 'password must be 8 characters or more';}
                        }, controller: cubit.passwordController),
                        const SizedBox(
                          height: 40,
                        ),
                      state is UserLoginLoadingState ?
                      const CircularProgressIndicator() :
                        Container(
                          height: 40,
                          width: 200,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: const Color(0xff18a7d1)),
                          child: MaterialButton(
                            onPressed: () {
                              if (cubit.formKey.currentState!.validate()) {
                                LoginRequestModel l = LoginRequestModel(
                                    cubit.emailController.text,
                                    cubit.passwordController.text);
                                cubit.userLogin(l);
                                //SharedPreferenceHelper.saveData(
                                //    key: 'Email',
                                //    value: cubit.emailController.text);
                              }
                            },
                            child: MyText(
                                text: 'Login',
                                isBold: true,
                                color: Colors.white,
                                size: 20),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          textDirection: TextDirection.ltr,
                          children: [
                            MyText(
                                size: 15,
                                color: Colors.black,
                                isBold: true,
                                text: 'you don`t have an account yet ?'),
                            TextButton(
                                onPressed: () {
                                  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder:
                                      (BuildContext context)=>const RegisterScreen()), (route) => false);
                                },
                                child: MyText(
                                  text: 'Register',
                                  color: const Color(0xff18a7d1),
                                  size: 15,
                                  isBold: true,
                                ))
                          ],
                        ),
                        const SizedBox(
                          height: 70,
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
