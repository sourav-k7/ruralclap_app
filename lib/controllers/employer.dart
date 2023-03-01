import 'package:get/get.dart';
import 'package:ruralclap_app/models/employer.dart';

class EmployerController extends GetxController {
  final Rx<Employer> _employer = Employer().obs;
  Employer get employer => _employer.value;
}
