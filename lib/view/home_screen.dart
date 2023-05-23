import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rive/rive.dart';

import '../view_model/data_view_model.dart';

class HomeScreen extends StatelessWidget {
  final DataViewModel _dataViewModel = Get.put(DataViewModel());

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Flutter Test App'),
      ),
      body: Obx(
        () {
          if (_dataViewModel.isLoading.value ||
              _dataViewModel.isFetching.value) {
            return const Center(
              child: SizedBox(
                height: 200,
                width: 200,
                child: RiveAnimation.asset(
                  'assets/loading_new.riv',
                  fit: BoxFit.fill,
                ),
              ),
            );
          } else {
            return Center(
              child: Container(
                height: 400,
                width: 350,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 200,
                        width: 200,
                        child: Image.network(
                          _dataViewModel.userData.value.avatar,
                        ),
                      ),
                      Text(
                        'Name: ${_dataViewModel.userData.value.firstName} ${_dataViewModel.userData.value.lastName}',
                        style:
                            const TextStyle(color: Colors.black, fontSize: 20),
                      ),
                      Text(
                        'Phone: ${_dataViewModel.userData.value.phoneNumber}',
                        style:
                            const TextStyle(color: Colors.black, fontSize: 20),
                      ),
                      Text(
                        'Date of Birth: ${_dataViewModel.userData.value.dob}',
                        style:
                            const TextStyle(color: Colors.black, fontSize: 20),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (!_dataViewModel.isFetching.value) {
            _dataViewModel.fetchData();
          }
        },
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
