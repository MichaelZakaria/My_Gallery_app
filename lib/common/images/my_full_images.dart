import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import '../../controllers/image_controller.dart';
import '../../utils/cloud_helper_functions.dart';

class MyFullImages extends StatelessWidget {
  const MyFullImages({super.key,});



  @override
  Widget build(BuildContext context) {
    final controller = ImageController.instance;

    return Obx(
       () => FutureBuilder(
        // Use Key to trigger a refresh
        key: Key(controller.refreshData.value.toString()),
        future: controller.getAllUserImages(),
        builder: (context, snapshot) {

          // Handle loader, No record or error message
          final widget = MyCloudHelperFunction.checkMultipleRecordState(snapshot: snapshot);
          if (widget != null) return widget;

          // Record is found
          final images = snapshot.data!;

          return GridView.builder(
            itemCount: images.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: EdgeInsets.zero,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisSpacing: 20,
              crossAxisSpacing: 10,
              mainAxisExtent: 100,
            ),
            itemBuilder: (_, index) => Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.white,
                  boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.2), offset: Offset(2, 2))]
              ),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.network(images[index], fit: BoxFit.fill,)
              ),
            ),
          );
        },
      ),
    );
  }
}