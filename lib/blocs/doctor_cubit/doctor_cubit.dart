import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:meta/meta.dart';

import '../../models/appointments_model.dart';

part 'doctor_state.dart';

class DoctorCubit extends Cubit<DoctorState> {
  DoctorCubit() : super(DoctorInitial());
  static DoctorCubit get(context) => BlocProvider.of(context);
  List<Appointments> appointments = [
    Appointments(patientName: 'Salma Hamdy',time: '10:50',completed: true),
    Appointments(patientName:'Ahmed Mohamed',time: '13:00',completed: false),
    Appointments(patientName:'Mahmoud Tamami',time: '15:20',completed: false),
    Appointments(patientName:'Nada gamal', time: '7:40',completed: false),
    Appointments(patientName:'Mohamed Karim',time: '8:10',completed: true),
    Appointments(patientName:'Yasmin Mater', time: '16:00',completed: false),
    Appointments(patientName:'Mariam Badr', time: '11:30',completed: true),
  ];

  void changeCompleted(index) {
    appointments[index].completed =! appointments[index].completed;
    emit(ChangeCompletedState());
}
}
