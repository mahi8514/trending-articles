# trending-articles
A simple SwiftUI app to list most popular articles using NY times API.


## How to Run the App?

    1.    Clone the App
        •    Clone the repository to your local system.
    
    2.    Generate an API Key
        •    Visit developer.nytimes.com and create an API key where the “Most Popular” feature is enabled.
        
    3.    Configure the App
        •    Navigate to trending_articlesApp and locate the init method.
        •    Paste the following code:
        
    ```
        ArticleStoreImpl.activate(baseUrl: "base-url", apiKey: "your-api-key")
    ```
    Replace:
        •    base-url with api.nytimes.com.
        •    your-api-key with the key generated in the previous step.
        
    Note: For better security:
        •    Store the API key inside config.xcconfig instead of hardcoding it directly in the app to avoid pushing sensitive information to version control.
        
    4.    Run the App
        •    Open the project in Xcode and run it using the simulator or your connected device.
        
        
## How to Test?

    1.    After running the full test suite:
        •    Go to the Reports Navigator in Xcode.
        •    Select the most recent test run.
        •    Click on the Coverage option to view the detailed coverage report for each file.
        
    2.    Alternatively:
        •    Locate the test report file in DerivedData/your_project_name/Logs/Test/{test_file}.xcresult.
        •    Double-click on the .xcresult file to open and view the report in Xcode.
        
        
## How to View the Generated Report?

    1.    After running the full test suite:
        •    Go to the Reports Navigator in Xcode.
        •    Select the most recent test run.
        •    Click on the Coverage option to view the detailed coverage report for each file.
        
    2.    Alternatively:
        •    Locate the test report file in DerivedData/your_project_name/Logs/Test/{test_file}.xcresult.
        •    Double-click on the .xcresult file to open and view the report in Xcode.
        
