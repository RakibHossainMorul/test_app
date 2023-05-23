import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:get/get.dart';

import '../model/user_data_model.dart';

class DataViewModel extends GetxController {
  RxBool isLoading = true.obs;
  RxBool isFetching = false.obs;
  var userData = UserData(
    firstName: '',
    lastName: '',
    phoneNumber: '',
    avatar: '',
    dob: '',
  ).obs;

  @override
  void onInit() {
    fetchData();
    super.onInit();
  }

  void fetchData() async {
    isFetching.value = true;
    isLoading.value = true;
    try {
      final response =
          await http.get(Uri.parse('https://random-data-api.com/api/v2/users'));

      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);

        userData.value = UserData(
          firstName: jsonData['first_name'],
          lastName: jsonData['last_name'],
          phoneNumber: jsonData['phone_number'],
          avatar: jsonData['avatar'],
          dob: jsonData['date_of_birth'],
        );
        isLoading.value = false;
      } else {
        print('Failed to fetch data. Status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching data: $e');
    } finally {
      isFetching.value = false;
    }
  }
}
