import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:grammarlyclone/common/config/colors.dart';
import 'package:grammarlyclone/common/widgets/buttons/custom_buttons.dart';
import 'package:grammarlyclone/common/widgets/containers/border_containers.dart';
import 'package:grammarlyclone/common/widgets/images/custom_images.dart';
import 'package:grammarlyclone/common/widgets/texts/custom_text_style.dart';
import 'package:grammarlyclone/features/grammar/api_test.dart';

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
              icon: const Icon(Icons.info),
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
                        padding: const EdgeInsets.only(left: 16.0, right: 16,),
                        child: TextField(
                          controller: inputTextController!,
                          focusNode: inputFocus!,
                          minLines: 10,
                          maxLines: 10,
                          decoration: const InputDecoration.collapsed(hintText: "Start typing..."),
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
                  // checkResponse("Testor the programming");
                  outputTextController!.text = await newResponse(inputTextController!.text);
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
                              await Clipboard.setData(ClipboardData(text: outputTextController!.text));
                            },
                          )),
                      Padding(
                        padding: const EdgeInsets.only(left: 16.0, right: 16,),
                        child: TextField(
                          controller: outputTextController!,
                          readOnly: true,
                          minLines: 10,
                          maxLines: 10,
                          decoration: const InputDecoration.collapsed(hintText: "Corrected text here..."),
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
