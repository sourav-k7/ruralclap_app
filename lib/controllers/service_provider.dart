import 'package:get/get.dart';
import 'package:ruralclap_app/models/service_provider.dart';

class ServiceProviderController extends GetxController {
  final Rx<ServiceProvider> _serviceProvider = ServiceProvider().obs;
  ServiceProvider get serviceProvider => _serviceProvider.value;
}
