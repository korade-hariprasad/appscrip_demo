import 'package:get/get.dart';
import '../../model/user_model.dart';
import '../../network/api_helper.dart';
import '../../network/network_util.dart';

class UserController extends GetxController {
  final ApiHelper _apiHelper = ApiHelper();
  var users = <User>[].obs;
  RxBool isLoading = true.obs;
  RxBool hasInternet = true.obs;

  @override
  void onInit() {
    super.onInit();
    fetchUsers();
  }

  Future<void> fetchUsers() async {
    isLoading(true);
    hasInternet(await NetworkUtil.checkInternetConnection());
    if (hasInternet.value) {
      try {
        users.value = await _apiHelper.fetchUsers();
        isLoading(false);
      } catch (e) {
        users.clear();
        isLoading(false);
        print("Error fetching users: $e");
      }
    }
  }
}