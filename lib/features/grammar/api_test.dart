import 'dart:convert';

import 'package:http/http.dart' as http;

Future<String> newResponse(String text) async {
  return checkResponse(text);
  // try {
  //   String translatedText = await translateText('Hello, world!', 'fr');
  //   print('Translated text: $translatedText');
  // } catch (e) {
  //   print('Error: $e');
  // }
}

// Future<String> translateText(String sourceText, String targetLanguage) async {
//   // final apiKey = 'YOUR_GOOGLE_TRANSLATE_API_KEY';
//   final url = 'https://translate.googleapis.com/v3beta1/{parent=projects/*}:translateText';
//   // final response = await http.post( Uri( path:
//   //   '$baseUrl?q=${Uri.encodeQueryComponent(sourceText)}&target=$targetLanguage&key=$apiKey',
//   // ));
//   // if (response.statusCode == 200) {
//   //   final jsonResponse = json.decode(response.body);
//   //   final translatedText =
//   //       jsonResponse['data']['translations'][0]['translatedText'];
//   //   return translatedText;
//   // } else {
//   //   throw Exception('Failed to translate text');
//   // }
//   // String url = 'https://textgears-textgears-v1.p.rapidapi.com/detect';
//   // var headers = {
//   //         'content-type': 'application/x-www-form-urlencoded',
//   //         'X-RapidAPI-Key': '22e940ae02mshf49db416af486a1p1a6dcdjsndf9bf479cd41',
//   //         'X-RapidAPI-Host': 'textgears-textgears-v1.p.rapidapi.com',    
//   //       };
//   var body = {
//     "contents": sourceText,
//     // "mimeType": string,
//     // "sourceLanguageCode": string,
//     "targetLanguageCode": targetLanguage,
//     // "model": string,
//     // "glossaryConfig": {
//     //   object (TranslateTextGlossaryConfig)
//     // },
//     // "labels": {
//     //   string: string,
//     //   ...
//     // }
//   };
//   try {
//     var response = await http.post(Uri.parse(url), body: body);
//     print(response.body);
//   } catch (e) {
//     print("Error:" + e.toString());
//   }
//   return "trying";
// }


Future<String> checkResponse(String inputText) async {


  // const url = "https://catfact.ninja/fact";
  String textAfterURL = inputText.replaceAll(" ", "%20");
  
  String url = 'http://127.0.0.1:5000/api/$textAfterURL';

  print(url);
  // return;
  // const url = 'http://127.0.0.1:5000/api/I%20am%20tester%20this%20apu';
  // const url = 'http://127.0.0.1:5000/api/I%20lie%20you';
  // const url = 'https://grammar-checker3.p.rapidapi.com/%7BPATH%7D';
  // const options = {method: 'GET'};

  // try {
  //   const response = await fetch(url, options);
  //   const result = await response.text();
  //   console.log(result);
  // } catch (error) {
  //   console.error(error);
  // }
  // var headers = {
  //     // 'content-type': 'text/json',
  //     'X-RapidAPI-Key': '22e940ae02mshf49db416af486a1p1a6dcdjsndf9bf479cd41',
  //     'X-RapidAPI-Host': 'grammarbot-neural.p.rapidapi.com'
  //   };
    
    
  // var data = {
  //     "text": 'This are some wel-written text.',
  //     "lang": 'en'
  //   };

  try {
    // var response = await http.get(Uri.parse(url), headers: headers);
    print("Waiting");
    // var response = await http.get(Uri.parse(url));
    var response = await http.get(Uri.parse(url),);
    print("success");
    // Map<String, dynamic> data = json.decode(response);
    Map<String, dynamic> x = json.decode(response.body);
    print(x["corrected"]);
    return x["corrected"];
  } catch (e) {
    print("Error : ");
    print(e.toString());
  }
  return "Some Error Occured.";
}

// void checkResponse(String inputText) async {

//   String url = 'https://textgears-textgears-v1.p.rapidapi.com/detect';

//   var headers = {
//           'content-type': 'application/x-www-form-urlencoded',
//           'X-RapidAPI-Key': '22e940ae02mshf49db416af486a1p1a6dcdjsndf9bf479cd41',
//           'X-RapidAPI-Host': 'textgears-textgears-v1.p.rapidapi.com',
          
//         };
    
//   var data = {
//           "text" : inputText
//         };

//   try {
//     var response = await http.post(Uri.parse(url), headers: headers, body: data);

//     print(response.body);
//   } catch (e) {
//     print(e.toString());
//   }
// }

// void newResponse() async {

//   const url = 'https://text-analyzer.p.rapidapi.com/analyze-text/text?url=https%3A%2F%2Fen.wikipedia.org%2Fwiki%2FNarendra_Modi';

//   var headers = {
// 		'X-RapidAPI-Key': '22e940ae02mshf49db416af486a1p1a6dcdjsndf9bf479cd41',
// 		'X-RapidAPI-Host': 'text-analyzer.p.rapidapi.com'
// 	};
// // const options = {
// // 	method: 'GET',
// // 	headers: {
// // 		'X-RapidAPI-Key': '22e940ae02mshf49db416af486a1p1a6dcdjsndf9bf479cd41',
// // 		'X-RapidAPI-Host': 'text-analyzer.p.rapidapi.com'
// // 	}
// // };

// // try {
// // 	const response = await fetch(url, options);
// // 	const result = await response.text();
// // 	console.log(result);
// // } catch (error) {
// // 	console.error(error);
// // }

//   // my method
//   try {
//     var response = await http.get(Uri.parse(url), headers: headers,);

//     print(response.body);
//   } catch (e) {
//     print(e.toString());
//   }
// }
