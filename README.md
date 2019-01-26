# TextDetect
This app detects the text from a picture input using camera or photos gallery of the iPhone/Simulator. The app uses on device <a href="https://firebase.google.com/docs/ml-kit/ios/recognize-text"> Text Recognition </a> in iOS using <a href = "https://firebase.google.com/docs/ml-kit/"> MLKit </a> in <a href = "https://firebase.google.com/"> Firebase </a> by Google.
<br><br>
Before you run the project, open <b>terminal</b> and go to the root folder of the project and type:<br>
<b><i>$ pod install</b></i><br>
This will install the following required pods: <br>
'Firebase/Core' <br>
'Firebase/MLVision' <br>
'Firebase/MLVisionTextModel'
<br><br>
You would also need to add GoogleService-Info.plist file to your project for firebase integration in order to use MLKit.
Refer <a href="https://console.firebase.google.com/u/1/project/mlkit-in-ios/overview">these </a> easy steps for the same. You will have to login to your gmail account for accessing the console to firebase.
<br><br>
If cocoapods is not already installed, install it with following gem command.<br>
<b><i>$ sudo gem install cocoapods</b></i><br>
<br>
![textdetect](https://user-images.githubusercontent.com/14230368/41650378-89a77834-749b-11e8-8d25-a72a2eb4b157.gif)
