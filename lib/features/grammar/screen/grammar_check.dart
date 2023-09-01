import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:grammarchecker/common/config/colors.dart';
import 'package:grammarchecker/common/util/dialog/alert_dialog.dart';
import 'package:grammarchecker/common/widgets/buttons/custom_buttons.dart';
import 'package:grammarchecker/common/widgets/containers/border_containers.dart';
import 'package:grammarchecker/common/widgets/images/custom_images.dart';
import 'package:grammarchecker/common/widgets/texts/custom_text_style.dart';
import 'package:http/http.dart' as http;

class GrammarCheckerScreen extends StatefulWidget {
  const GrammarCheckerScreen({super.key});

  @override
  State<GrammarCheckerScreen> createState() => _GrammarCheckerScreenState();
}

class _GrammarCheckerScreenState extends State<GrammarCheckerScreen> {
  FocusNode? inputFocus;
  FocusNode? outputFocus;

  TextEditingController? inputTextController;
  TextEditingController? outputTextController;

  bool isThemeDark = false;

  // api link
  String apiUrl = 'http://10.0.2.2:5000';

  Future getCorrectedString(String inputText) async {
    String textAfterURL = inputText.replaceAll(" ", "%20");

    String url = "$apiUrl/api/$textAfterURL";

    try {
      var response = await http.get(
        Uri.parse(url),
      );
      Map<String, dynamic> x = json.decode(response.body);
      return x["corrected"];
    } catch (e) {
      return "Some Error Occured";
    }
  }

  void showInfo() {
    simpleAlertDialog(context, "Grammer Checker",
        "Say goodbye to grammatical uncertainties and hello to eloquence, as our app employs advanced algorithms to ensure your words shine with clarity.");
  }

  void messageCopiedToClipboard() {
    simpleAlertDialog(context, "Success", "Copied to Clipboard");
  }

  @override
  void initState() {
    super.initState();

    inputFocus = FocusNode();
    outputFocus = FocusNode();
    inputTextController = TextEditingController();
    outputTextController = TextEditingController();
  }

  @override
  void dispose() {
    inputFocus?.dispose();
    outputFocus?.dispose();

    inputTextController?.dispose();
    outputTextController?.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: isThemeDark ? Colors.grey[850] : customWhiteColor,
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
              color: isThemeDark ? customWhiteColor : customGreyColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          actions: [
            IconButton(
              iconSize: 24,
              onPressed: () {
                showInfo();
              },
              icon: Stack(
                children: [
                  Center(
                    child: Container(
                      height: 12,
                      width: 12,
                      color: Colors.white,
                    ),
                  ),
                  const Center(child: Icon(Icons.info)),
                ],
              ),
              color: customGreenLight,
            ),
          ],
        ),
        body: Center(
          child: Column(
            children: [
              const SizedBox(height: 12),
              CupertinoSwitch(
                value: isThemeDark,
                activeColor: customGreenLight,
                onChanged: (value) {
                  Get.changeTheme(value ? ThemeData.dark() : ThemeData.light());
                  setState(() {
                    isThemeDark = value;
                  });
                },
              ),
              const SizedBox(height: 12),
              customHeadingText(
                color: isThemeDark ? customWhiteColor : customGreyColor,
                text: "Free Grammar Checker",
              ),
              const SizedBox(
                height: 16,
              ),
              customText(
                color: isThemeDark ? customWhiteColor : customGreyColor,
                text: "Ensure your English writing is mistake-free.",
              ),
              const SizedBox(
                height: 4,
              ),
              Expanded(
                child: customBorderContainer(
                  width: double.infinity,
                  child: Column(
                    children: [
                      Align(
                          alignment: Alignment.topRight,
                          child: IconButton(
                            iconSize: 16,
                            icon: const Icon(Icons.cancel_outlined),
                            onPressed: () {
                              inputTextController!.clear();
                              outputTextController!.clear();
                            },
                          )),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 16.0,
                          right: 16,
                        ),
                        child: TextField(
                          controller: inputTextController!,
                          focusNode: inputFocus!,
                          minLines: 6,
                          maxLines: 8,
                          decoration: const InputDecoration.collapsed(
                              hintText: "Start typing..."),
                          cursorColor: customGreenColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              customGreenButton(
                height: 60,
                width: double.infinity,
                padding: const EdgeInsets.only(left: 20, right: 20),
                buttonText: "Check",
                onPressed: () async {
                  outputTextController!.text =
                      await getCorrectedString(inputTextController!.text);
                },
              ),
              Expanded(
                child: customBorderContainer(
                  width: double.infinity,
                  child: Column(
                    children: [
                      Align(
                          alignment: Alignment.topRight,
                          child: IconButton(
                            iconSize: 16,
                            icon: const Icon(Icons.copy),
                            onPressed: () async {
                              await Clipboard.setData(ClipboardData(
                                  text: outputTextController!.text));

                              messageCopiedToClipboard();
                            },
                          )),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 16.0,
                          right: 16,
                        ),
                        child: TextField(
                          controller: outputTextController!,
                          readOnly: true,
                          minLines: 6,
                          maxLines: 8,
                          decoration: const InputDecoration.collapsed(
                              hintText: "Corrected text here..."),
                          cursorColor: customGreenColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
