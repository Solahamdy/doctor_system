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
    Appointments('Salma Hamdy', '10:50'),
    Appointments('Ahmed Mohamed', '13:00'),
    Appointments('Mahmoud Tamami', '15:20'),
    Appointments('Nada gamal', '7:40'),
    Appointments('Mohamed Karim', '8:10'),
    Appointments('Yasmin Mater', '16:00'),
    Appointments('Mariam Badr', '11:30'),
  ];


}
