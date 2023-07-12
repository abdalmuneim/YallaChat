import 'package:yalla_chat/core/language/app_translations.dart';
import 'package:yalla_chat/core/resources/colors_manager.dart';
import 'package:yalla_chat/core/resources/font_manager.dart';
import 'package:yalla_chat/core/util/widgets/custom_app_bar.dart';
import 'package:yalla_chat/core/util/widgets/custom_circle_avatar.dart';
import 'package:yalla_chat/core/util/widgets/custom_text.dart';
import 'package:yalla_chat/core/util/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:flutter_firebase_chat_core/flutter_firebase_chat_core.dart';

import 'package:yalla_chat/features/bottom_bar/presentations/rooms_feature/controllers/rooms_controller.dart';

class RoomsView extends GetView<RoomsController> {
  const RoomsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.error.value) {
        return Container();
      }

      if (!controller.initialized) {
        return Container();
      }
      return controller.user != null
          ? Scaffold(
              appBar: CustomerAppBar(
                title: CustomText(
                  text: LocaleKeys.messages.tr,
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
                action: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.border_color_outlined,
                      color: ColorManager.green,
                    ),
                  ),
                ],
                center: false,
                elevation: 0.0,
              ),
              body: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /// search
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CustomTextFormField(
                        hintText: '',
                        elevation: 0.0,
                        labelText: LocaleKeys.search.tr,
                        borderRadius: 50,
                        enabledBorder: false,
                        onChange: (value) {},
                        fillColor: Colors.black12,
                        prefixIcon: const Icon(Icons.search),
                      ),
                    ),
                    const SizedBox(height: 10),

                    /// activities
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: CustomText(
                        text: LocaleKeys.activities.tr,
                        textAlign: TextAlign.start,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    const SizedBox(height: 10),
                    StreamBuilder<List<types.Room>>(
                        builder: (context, snapshot) {
                      return SizedBox(
                        height: 100,
                        child: ListView.separated(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          scrollDirection: Axis.horizontal,
                          separatorBuilder: (context, index) =>
                              const SizedBox(width: 10),
                          itemBuilder: (BuildContext context, int index) {
                            final room = snapshot.data![index];
                            return CustomCircleAvatar(
                              room: room,
                              user: controller.user, // TODO: Add list user here
                            );
                          },
                          itemCount: 9,
                        ),
                      );
                    }),

                    /// rooms
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: CustomText(
                        text: LocaleKeys.messages.tr,
                        textAlign: TextAlign.start,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    const SizedBox(height: 10),
                    StreamBuilder<List<types.Room>>(
                        initialData: const [],
                        stream: FirebaseChatCore.instance.rooms(),
                        builder: (context,
                            AsyncSnapshot<List<types.Room>> snapshot) {
                          /// empty or no has data
                          if (!snapshot.hasData || snapshot.data!.isEmpty) {
                            return const CircularProgressIndicator();
                          }

                          /// has data
                          return SizedBox(
                            height: 200,
                            child: ListView.separated(
                              itemBuilder: (context, index) {
                                types.Room room = snapshot.data![index];

                                return GestureDetector(
                                  onTap: () {},
                                  child: Container(
                                    width: double.infinity,
                                    padding: const EdgeInsets.all(5),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        CustomCircleAvatar(
                                          room: room,
                                          user: controller.user,
                                        ),
                                        const SizedBox(width: 10),
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            CustomText(
                                              text: room.name,
                                              fontWeight:
                                                  FontWeightManager.bold,
                                            ),
                                            const SizedBox(height: 10),
                                            const CustomText(
                                              text: 'last Message Here',
                                              fontWeight:
                                                  FontWeightManager.regular,
                                            ),
                                          ],
                                        ),
                                        const Spacer(),
                                        const CustomText(
                                          text: 'DateTime',
                                          fontWeight: FontWeightManager.regular,
                                          color: ColorManager.green,
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                              separatorBuilder: (context, index) {
                                return const SizedBox(height: 10);
                              },
                              itemCount: 20,
                            ),
                          );
                        }),
                  ],
                ),
              ),
            )
          : Container();
    });
  }
}
