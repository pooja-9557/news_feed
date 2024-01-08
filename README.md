
Flutter News Feed App
This Flutter application features two screens: a splash screen and a news feed screen. The news feed screen displays a list of news articles fetched using a public News API.

Instructions
Setup
Download and Open: Download the project folder and open it in Android Studio or Visual Studio Code.

NewsAPI Key: Obtain your API key from NewsAPI( https://newsapi.org/ ). Insert the key into the news_feed.dart file.

In news_feed.dart file change api key with your key.
final String apiUrl = 'https://newsapi.org/v2/top-headlines?country=us&apiKey=ADD_YOUR_KEY_HERE';
Replace ADD_YOUR_KEY_HERE with your NewsAPI key.

Running the App
Configure Emulator/Device: Launch your preferred emulator or connect your physical device.

Run the Application: Use the following command in the terminal from the project root directory:

Note
Ensure you've inserted your NewsAPI key in the designated location within the news_feed.dart file to fetch news data.

The application contains a splash screen and a news feed screen. Check the respective files for code and design details.

Access the NewsAPI documentation here for more information on their endpoints and usage.

Steps Recap:
Download the project folder.
Open it in your preferred development environment.
Get your NewsAPI key.
Insert the API key in news_feed.dart.
Run the application on your emulator/device.

Thank You!


