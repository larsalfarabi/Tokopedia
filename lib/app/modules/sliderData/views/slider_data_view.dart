import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:tokopedia/app/controllers/slider_controller.dart';
import 'package:tokopedia/app/routes/app_pages.dart';

import '../controllers/slider_data_controller.dart';

class SliderDataView extends GetView<SliderDataController> {
  final controller = Get.put(SliderDataController());
  final controllerSlider = Get.put(SliderController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<QuerySnapshot<Object?>>(
          future: controllerSlider.getData(),
          builder: (context, Snapshot) {
            if (Snapshot.connectionState == ConnectionState.done) {
              var listData = Snapshot.data!.docs;
              return ListView.builder(
                itemCount: listData.length,
                itemBuilder: (context, index) => Container(
                  margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.black54.withOpacity(0.2),
                  ),
                  child: ListTile(
                    style: ListTileStyle.drawer,
                    onTap: () => Get.toNamed(Routes.UPDATE_DATA,
                        arguments: listData[index]),
                    leading: Image.network(
                      (listData[index].data()
                          as Map<String, dynamic>)["gambarSlider"],
                    ),
                    title: Text((listData[index].data()
                        as Map<String, dynamic>)["ketSlider"]),
                    subtitle: Text(
                      (listData[index].data()
                              as Map<String, dynamic>)['activeSlider']
                          .toString(),
                      style: TextStyle(
                          color: (listData[index].data()
                                  as Map<String, dynamic>)['activeSlider']
                              ? Colors.green
                              : Colors.red),
                    ),
                    trailing: InkWell(
                      onTap: () =>
                          controllerSlider.deleteData(listData[index].id),
                      child: Icon(
                        IconlyLight.delete,
                        color: Colors.red,
                      ),
                    ),
                  ),
                ),
              );
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () => controllerSlider.addData(true, "youtube",
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR6XvTRjeslELtVvuiRlHwGKV74kfSALID31g&usqp=CAU"),
        child: Icon(Icons.add),
      ),
    );
  }
}
