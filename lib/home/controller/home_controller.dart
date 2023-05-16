import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../model/company.dart';
import '../repository/home_repository.dart';

class HomeController extends GetxController{

  var isLoading = false.obs;
  var company = Company().obs;

  var companyName = "".obs;
  var email = "".obs;
  var password = "".obs;
  var phone = "".obs;


  @override
  void onInit() {
    super.onInit();
    fetchCompanyList();

  }

  Future<void> fetchCompanyList() async {
    isLoading.value = true;
    try {

      await HomeRepository().getCompanyList().then((value) => {
        company.value = value!
      });
      isLoading.value = false;
    }

    catch(e){
      print(e.toString());
    }
    isLoading.value = false;
  }

  Future<dynamic?> addNewCompany() async {

    var status;

    try {

      status = await HomeRepository().uploadNewCompany(companyName.value.toString(), email.value.toString(),
          password.value.toString(), phone.value.toString());
    }

    catch(e){
      print(e.toString());
    }

    return status;
  }




}