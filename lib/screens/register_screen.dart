import 'package:doctor_system/blocs/registration/registration_cubit.dart';
import 'package:doctor_system/components/my_text.dart';
import 'package:doctor_system/components/text_login_register_field.dart';
import 'package:doctor_system/core/size_config.dart';
import 'package:doctor_system/enums/gender_enum.dart';
import 'package:doctor_system/models/register_model.dart';
import 'package:doctor_system/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterScreen extends StatelessWidget {

  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: BlocConsumer<RegistrationCubit, RegistrationState>(
        listener: (context, state) {
          if (state is UserRegisterSuccessState) {
            ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Registered Successfully'),
                backgroundColor:Color(0xff18a7d1) ,));
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => LoginScreen(),
                ));}
          else if (state is UserRegisterErrorState){
            ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.error),backgroundColor: const Color(0xff18a7d1),));
          }
        },
        builder: (context, state) {
          var cubit = RegistrationCubit.get(context);
          return SingleChildScrollView(

            child: SafeArea(
              child: Form(
                key: cubit.formKey,
                child: Container(
                  height: SizeConfig.screenHeight,
                  color: const Color(0xfffcfcfc),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: SizeConfig.screenHeight! * 0.03,
                          ),
                          MyText(
                              size: 30,
                              color: const Color(0xff18a7d1),
                              isBold: true,
                              text: 'Create Account'),
                          SizedBox(
                            height: SizeConfig.screenHeight! * 0.04,
                          ),
                          TextLoginRegisterField(icon: Icons.person,text:  'user name',validator:  (value) {
                            if (value == null || value.isEmpty) {
                              return 'User name is required';
                            }
                          },controller:  cubit.userNameController),
                          SizedBox(
                            height: SizeConfig.screenHeight! * 0.02,
                          ),
                          TextLoginRegisterField(icon: Icons.email,text:  'Email',validator:  (value) {
                            if (value == null || value.isEmpty) {
                              return 'Email is required';
                            }
                            else if (!value.endsWith('.com')) {
                              return 'Email must end with .com';}
                            }
                          , controller: cubit.emailController),
                          SizedBox(
                            height: SizeConfig.screenHeight! * 0.02,
                          ),
                          TextLoginRegisterField(icon: Icons.phone,text:'Phone',validator:(value) {
                            if (value == null || value.isEmpty) {
                              return 'phone is required';
                            }
                            else if (value.length < 10) {
                              return 'Phone must be 10 numbers or more';}
                          },controller:  cubit.phoneController,keyboardType: TextInputType.number),
                          SizedBox(
                            height: SizeConfig.screenHeight! * 0.02,
                          ),
                          TextLoginRegisterField(icon:Icons.lock, text: 'Password',validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Password is required';}
                            //else if (value.length < 8) {
                            //  return 'password must be 8 characters or more';}
                          }, controller: cubit.passwordController),
                          SizedBox(
                            height: SizeConfig.screenHeight! * 0.02,
                          ),
                          TextLoginRegisterField(icon:Icons.lock, text: 'Confirm password',validator: (value) {
                            if (value == null || value.isEmpty) {
                              return ' Confirm password is required';}
                            else if (value != cubit.passwordController.text) {
                              return ' Password don`t match';}
                          }, controller: cubit.passwordConfirmController),
                          SizedBox(
                            height: SizeConfig.screenHeight! * 0.02,
                          ),
                          RadioListTile(title: const Text('Male'),
                              value: 0, groupValue: cubit.selectedGender, onChanged:cubit.genderChanged),
                          RadioListTile(title: const Text('Female'),
                              value: 1, groupValue: cubit.selectedGender, onChanged:cubit.genderChanged),
                          SizedBox(
                            height: SizeConfig.screenHeight! * 0.05,
                          ),
                           Container(
                             height: 40,
                             width: 200,
                             decoration: BoxDecoration(
                                 borderRadius: BorderRadius.circular(15),
                                 color: const Color(0xff18a7d1)),
                             child: MaterialButton(
                               onPressed: (){
                                 if (cubit.formKey.currentState!.validate()) {
                                   RegisterRequestModel r = RegisterRequestModel(
                                       email: cubit.emailController.text,
                                       name: cubit.userNameController.text,
                                       gender: cubit.selectedGender,
                                       phone: cubit.phoneController.text,
                                       confirmation: cubit.passwordConfirmController.text,
                                       pass: cubit.passwordController.text);
                                      cubit.userRegister(r);
                                   }
                                 },
                                 child: MyText(text: 'Register',
                                 isBold: true,
                                 color: Colors.white,
                                 size: 20),
                             ),
                           )





                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
