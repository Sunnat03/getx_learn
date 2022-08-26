import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:learn_getx/page/home/detail_page.dart';
import 'package:learn_getx/page/home/detall_controller.dart';

import '../../models/post model.dart';
import '../../services/network_service.dart';
import '../../services/util_service.dart';

class HomeController extends GetxController {
  // fields
  List<Post> items = [];
  bool isLoading = false;

  // logic method
  @override
  void onInit() {
    super.onInit();
    getDataFromNetwork();
  }

  void getDataFromNetwork() async {
    isLoading = true;
    update();

    NetworkService.GET(NetworkService.API_POST, NetworkService.emptyParams()).then((response) => _checkData(response));
  }

  void _checkData(String? response) {
    if(response != null) {
      _showData(response);
    } else {
      Utils.fireSnackGetX("Please try again! Something went error!");
    }
    isLoading = false;
    update();
  }

  void _showData(String response) {
    items = NetworkService.parsePostList(response);
    update();
  }

  void createPost(){
  var detailController =  Get.find<DetailController>();
  detailController.clearOldData();
  Get.to(()=> DetailPages());

  }
}