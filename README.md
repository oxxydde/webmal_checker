# Website Malicious Checker

Welcome to our simple Flutter project. The objective for building this app is to check a website, whether is safe or malicious.

Provider used in this project are from [VirusTotal.com](https://virustotal.com) using their free API.

For early testing, you can download the APK <a href="https://drive.google.com/file/d/1QaXzWSh9kuF7Cc30ftZ8gARnh5xTCg0b/view?usp=sharing">here</a>

## <b>How to build this project</b>
#
1. Do `git pull` to your local drive by execute this command below on your empty repo folder
<br></br>
`cd /FILE/TO_YOUR/DIRPATH`
<br></br>
`git pull https://github.com/oxxydde/webmal_checker.git`

2. Go to the `config.dart` in `lib/components` folder and paste your API token at the `"token"` value. 
3. Build the project to APK file with this command.
<br></br>
`flutter build apk`
4. The APK file will appear as `app-release.apk` in `build/app/outputs/flutter-apk` directory.

## <b>How to get your VirusTotal API Token</b>
#
1. Create your VirusTotal account
2. Click on your account and select API Key
   <br></br>
   ![API Key Button](https://i.ibb.co/wKH6F3x/Screenshot-2022-01-30-105215.png)
   <br></br>
3. API Token will appear there
   <br></br>
   ![API Token](https://i.ibb.co/Jrr8HgV/Screenshot-2022-01-30-105731.png)

4. Paste your token to `"token"` value (Explained on "How to build this project" number 2)