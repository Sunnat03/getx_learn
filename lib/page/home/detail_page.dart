import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learn_getx/page/home/detall_controller.dart';

class DetailPages extends StatelessWidget {
  const DetailPages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DetailController>(
      init: DetailController(),
      builder: (controller){
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            actions: [
              if(controller.state == DetailState.read)
                IconButton(onPressed: controller.pressedEdit, icon: Icon(Icons.edit,color: Colors.black,)
                )else IconButton(onPressed: controller.pressedSave, icon: Icon(Icons.check,color: Colors.black,))


            ],
          ),
          body: Container(
            height: Get.height,
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                TextField(
                  readOnly: controller.readOnly,
                  controller: controller.titleController,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 20
                  ),
                  decoration: InputDecoration(
                    hintText: "Title",
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey)
                    )
                  ),
                  textInputAction: TextInputAction.next,
                ),
                SizedBox(height: 20,),
                Expanded(child: TextField(
                  readOnly: controller.readOnly,
                    expands: true,
                  maxLines: null,
                  controller: controller.bodyController,
                  style: TextStyle(
                    fontSize: 16,
                  ),
                  decoration: InputDecoration(
                    hintText: "Content",
                    border: InputBorder.none,

                  ),
                ))
              ],
            ),
          ),
        );
    }
    );
  }
}
