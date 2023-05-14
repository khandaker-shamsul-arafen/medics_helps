import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../widget/medicine_details_card.dart';
import '../controllers/addmedicin_controller.dart';

class AddmedicinView extends GetView<AddmedicinController> {
  const AddmedicinView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AddmedicinView'),
        centerTitle: true,
      ),
      body: Padding(
          padding: const EdgeInsets.only(top: 16.0, left: 16.0),
          child: Obx(() {
            return controller.isLoading.value
                ? Center(
                    child: ElevatedButton(
                        onPressed: () {
                          showForm(null, context);
                        },
                        child: Text("Add Medecine")))
                : Column(
                    children: [
                      Expanded(
                          child: ListView(
                        children: [
                          ListView.builder(
                              physics: const BouncingScrollPhysics(),
                              scrollDirection: Axis.vertical,
                              shrinkWrap: true,
                              itemCount: controller.medecineData.length,
                              itemBuilder: (context, index) =>
                                  MedecineDetailsCard(
                                    medecinename: controller.medecineData[index]
                                        ['medecinename'],
                                    time: controller.medecineData[index]
                                        ['time'],
                                    id: controller.medecineData[index]['id'],
                                    index: index,
                                    sign: controller.medecineData[index]
                                        ['sign'],
                                  )),
                          ElevatedButton(
                              onPressed: () {
                                showForm(null, context);
                              },
                              child: const Text("Add Medecine"))
                        ],
                      )),
                    ],
                  );
          })),
    );
  }

  void showForm(int? id, context) async {
    if (id != null) {
      final existingData =
          controller.medecineData.firstWhere((element) => element['id'] == id);
      controller.medecinenameController.text = existingData['medecinename'];
      controller.timeController.text = existingData['time'];
    }

    showModalBottomSheet(
        context: context,
        elevation: 5,
        isScrollControlled: true,
        builder: (_) => Container(
              padding: EdgeInsets.only(
                top: 15,
                left: 15,
                right: 15,
                // this will prevent the soft keyboard from covering the text fields
                bottom: MediaQuery.of(context).viewInsets.bottom + 120,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  TextField(
                    controller: controller.medecinenameController,
                    decoration: const InputDecoration(hintText: 'medecinename'),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: controller.timeController,
                    decoration: const InputDecoration(hintText: 'time'),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextField(
                    controller: controller.signController,
                    decoration: const InputDecoration(hintText: 'time'),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      // Save new journal
                      if (id == null) {
                        await controller.addItem();
                      }
                      if (id != null) {
                        await controller.updateItem(id);
                      }

                      // Clear the text fields
                      controller.medecinenameController.text = '';
                      controller.timeController.text = '';

                      // Close the bottom sheet
                      Navigator.of(context).pop();
                    },
                    child: Text(id == null ? 'Create New' : 'Update'),
                  )
                ],
              ),
            ));
  }
}
