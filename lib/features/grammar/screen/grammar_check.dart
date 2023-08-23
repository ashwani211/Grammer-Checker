import 'package:flutter/material.dart';
import 'package:grammarlyclone/common/config/colors.dart';
import 'package:grammarlyclone/common/widgets/buttons/custom_buttons.dart';
import 'package:grammarlyclone/common/widgets/containers/border_containers.dart';
import 'package:grammarlyclone/common/widgets/images/custom_images.dart';
import 'package:grammarlyclone/common/widgets/texts/custom_text_style.dart';

class GrammarCheckerScreen extends StatelessWidget {
  const GrammarCheckerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: customWhiteColor,
          elevation: 1,
          leading: IconButton(
            iconSize: 24,
            onPressed: () {},
            icon: SizedBox(
              width: 24,
              height: 24,
              child: customIconImage(),
            ),
          ),
          title: Text(
            "Grammar Checker",
            style: TextStyle(
              color: customGreyColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          actions: [
            IconButton(
              iconSize: 24,
              onPressed: () {},
              icon: Icon(Icons.info),
              color: customGreyColor,
            ),
          ],
        ),
        body: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 24,
              ),
              customHeadingText(
                color: customGreyColor,
                text: "Free Grammar Checker",
              ),
              const SizedBox(
                height: 16,
              ),
              customText(text: "Ensure your English writing is mistake-free."),
              const SizedBox(
                height: 4,
              ),
              Expanded(
                child: customBorderContainer(
                  width: double.infinity,
                  child: SizedBox(
                    height: 20,
                  ),
                ),
              ),
              customButton(
                height: 60,
                width: double.infinity,
                padding: const EdgeInsets.only(left: 20, right: 20),
                buttonText: "Verify",
                onPressed: () {},
              ),
              Expanded(
                child: customBorderContainer(
                    width: double.infinity,
                    child: SizedBox(
                      height: 20,
                    )),
              ),
            ],
          ),
        ));
  }
}
