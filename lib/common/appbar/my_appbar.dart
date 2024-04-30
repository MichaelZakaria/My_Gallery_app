import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:my_gallery_app/common/containers/curved_edges.dart';
import 'package:my_gallery_app/controllers/user_image_controller.dart';

import '../../utils/cloud_helper_functions.dart';
import '../dialogs/my_dialog.dart';

class MyAppBar extends StatelessWidget {
  const MyAppBar({super.key,});


  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserImageController());

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [

        /// User
        const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Welcome', style: TextStyle(fontSize: 26, color: Color(0xFF4A4A4A)),),
            Text('Michael', style: TextStyle(fontSize: 26, color: Color(0xFF4A4A4A)),),
          ],
        ),


        /// User Image
        ClipPath(
          //clipper: MyCustomCurvedEdges(),
          child: Container(
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), color: const Color(0xfff3afe4),),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: GestureDetector(
                          onTap: () {
                            showGeneralDialog(
                                context: context,
                                pageBuilder: (_,__,___) {
                                  return MyDialog(controller: controller);
                                },
                                barrierDismissible: true,
                                barrierLabel: MaterialLocalizations.of(context)
                                    .modalBarrierDismissLabel,
                                barrierColor: Colors.transparent,
                                transitionDuration: const Duration(milliseconds: 150));
                          },
                          child:

                          Obx(
                           () => FutureBuilder(
                              // Use Key to trigger a refresh
                              key: Key(controller.refreshData.value.toString()),
                              future: controller.getAUserImage(),
                              builder: (context, snapshot) {

                                // Handle loader, No record or error message
                                final widget = MyCloudHelperFunction.checkSingleRecordState(snapshot);
                                if (widget != null) return widget;

                                // Record is found
                                final image = snapshot.data!;

                                return ClipRRect(
                                  borderRadius: BorderRadius.circular(68),
                                  child: Container(
                                            height: 68,
                                            width: 68,
                                            color: Colors.white,
                                            child: Image.network(controller.userImage.value, fit: BoxFit.fill,)
                                            ),
                                );
                              },
                            ),
                          ),

                      ),
            ),
          ),
        )
      ],
    );
  }
}