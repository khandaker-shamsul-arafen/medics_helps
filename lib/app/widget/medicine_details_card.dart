import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../modules/addmedicin/controllers/addmedicin_controller.dart';
import '../modules/addmedicin/views/addmedicin_view.dart';

class MedecineDetailsCard extends StatefulWidget {
  final int id;
  final String medecinename;
  final String time;
  final String sign;

  final int index;

  const MedecineDetailsCard({
    Key? key,
    required this.medecinename,
    required this.time,
    required this.index,
    required this.id,
    required this.sign,
  }) : super(key: key);

  @override
  State<MedecineDetailsCard> createState() => _MedecineDetailsCard();
}

class _MedecineDetailsCard extends State<MedecineDetailsCard> {
  final data = Get.find<AddmedicinController>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.amber,
          boxShadow: const [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 2.0,
            ),
          ],
          borderRadius: BorderRadius.circular(10),
        ),
        padding: const EdgeInsets.only(top: 16, bottom: 16, left: 16),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                widget.medecinename,
              ),
              Text(
                widget.time,
              ),
              Text(
                widget.sign,
              ),
              IconButton(
                icon: const Icon(
                  Icons.edit,
                  color: Colors.white,
                ),
                onPressed: () => const AddmedicinView()
                    .showForm(data.medecineData[widget.index]['id'], context),
              ),
              IconButton(
                  icon: const Icon(
                    Icons.delete,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    data.deleteItem(
                        data.medecineData[widget.index]['id'], context);
                  }),
              IconButton(
                icon: const Icon(
                  Icons.volume_up_sharp,
                  color: Colors.white,
                ),
                onPressed: () => data.ftts
                    .speak(data.medecineData[widget.index]['medecinename']),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
