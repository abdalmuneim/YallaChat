import 'package:yalla_chat/core/language/app_translations.dart';
import 'package:yalla_chat/core/resources/colors_manager.dart';
import 'package:yalla_chat/core/resources/font_manager.dart';
import 'package:yalla_chat/core/util/widgets/custom_app_bar.dart';
import 'package:yalla_chat/core/util/widgets/custom_circle_avatar.dart';
import 'package:yalla_chat/core/util/widgets/custom_text.dart';
import 'package:yalla_chat/core/util/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MessagesView extends StatelessWidget {
  const MessagesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            SizedBox(
              height: 100,
              child: ListView.separated(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                scrollDirection: Axis.horizontal,
                separatorBuilder: (context, index) => const SizedBox(width: 10),
                itemBuilder: (BuildContext context, int index) {
                  return const CustomCircleAvatar(
                    imgURL:
                        'https://images.unsplash.com/photo-1614130946015-d5a7a3276fea?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8YXJhYiUyMHdvbWFufGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60',
                  );
                },
                itemCount: 9,
              ),
            ),

            /// messages
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
            SizedBox(
              height: 600,
              child: ListView.separated(
                itemBuilder: (context, index) {
                  return Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const CustomCircleAvatar(
                          imgURL:
                              'https://images.unsplash.com/photo-1614130946015-d5a7a3276fea?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8YXJhYiUyMHdvbWFufGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60',
                        ),
                        const SizedBox(width: 10),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            CustomText(
                              text: 'Name Here',
                              fontWeight: FontWeightManager.bold,
                            ),
                            SizedBox(height: 10),
                            CustomText(
                              text: 'Message Here',
                              fontWeight: FontWeightManager.regular,
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
                  );
                },
                separatorBuilder: (context, index) {
                  return const SizedBox(height: 10);
                },
                itemCount: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
