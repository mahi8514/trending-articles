# Trending Articles
A **SwiftUI app** to explore the most popular articles using the New York Times API.

---

## 🛠 How to Run the App?

### 1. Clone the Repository
```bash
$ git clone https://github.com/mahi8514/trending-articles.git
```

### 2. Get an API Key
1. Visit the [New York Times Developer Portal](https://developer.nytimes.com/).
2. Create an API key and ensure the "Most Popular" feature is enabled.

### 3. Configure the App
1. Open the `trending_articlesApp` file and locate the `init` method.
2. Add the following code:

    ```swift
    ArticleStoreImpl.activate(baseUrl: "base-url", apiKey: "your-api-key")
    ```

3. Replace:
   - `base-url` with `api.nytimes.com`
   - `your-api-key` with the key generated in the previous step.

💡 **Pro Tip**: For enhanced security, store the API key in `config.xcconfig` instead of hardcoding it to avoid exposing sensitive information in version control.

### 4. Run the App
- Open the project in Xcode.
- Select a simulator or connect your device.
- Click **Run** to start the app!

---

## ✅ How to Test?

### 1. Running Tests
- Open the Test Navigator in Xcode.
- Click the Run button next to 'test-articlesTest' to run all 17 tests.
- You can also:
    - Run tests for a specific file.
    - Run tests individually if needed.
    
---

## 📊 Viewing the Coverage Report

1. Open Xcode's **Reports Navigator** after running the full suite tests.
2. Select the latest run and click **Coverage** for detailed insights.

Alternatively:
- Locate the test report file: `DerivedData/your_project_name/Logs/Test/{test_file}.xcresult`
- Double-click the `.xcresult` file to view the report directly in Xcode.

---
