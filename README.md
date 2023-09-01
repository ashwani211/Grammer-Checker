# Grammar Corrector

An application for correcting grammatical errors in a text.


## Features

- Grammar Correction
- Light/dark mode toggle
- Cross platform - Android, iOS, Web and Desktop.


## Tech Used

**Server**: Flask, python

**Client**: Flutter, GetX


## Working

The app corrects grammar with the help of a machine learning model trained on a small dataset to correct grammatical errors in a sentence. The model is hosted on a server which returns the corrected value in JSON format.


## Installation

After cloning the repository, proceed with the following steps:

Hosting the API Server:
---|

- Host the [Grammar Corrector API](https://github.com/ashwani211/grammar-checker-api) on a local or web server.

Stablishing connection to the API:
---|

- Modify the String **apiUrl** in 
  
  **\[Project]/lib/features/grammar/screen/grammar_check.dart** 
  
  to the hosted API url string (for virtual machine use 10.0.2.2:[PORT]/api).

Running the Application:
--|
- Install flutter and set-up all the required variables.
- Test run the app on chrome:

```bash
  flutter pub get
  flutter run -d chrome
```
- Select IDE and the platform.
- Follow flutter guidelines to run app on the platform
    
## FAQ

#### How does the app fixes grammatical errors?

The error detection and correction is done by a ML model trained on a small dataset.

#### Does the app Works offline?

Currently the app works through model returning corrected text through an API, which need to be hosted. We are working on the the offline feature.

#### Is the app ready to be deployed?

The ML model is currently trained on a small dataset and hence, prone to errors. So the app is currently not in production stage.

## Author

- [Ashwani Kumar Singh](https://github.com/ashwani211)
## Acknowledgement

 - [Prithviraj Damodaran](https://github.com/PrithivirajDamodaran/Gramformer)


## Feedback

If you have any feedback, please reach out to us at ashwanikumarsingh.varanasi@gmaii.com

