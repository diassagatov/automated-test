# Demo Blaze Test Automation Project

This project contains automated test cases for the Demo Blaze website using Robot Framework and Selenium Library.

## Project Structure

```
testing-ass2/
├── tests/                       # Test case files
│   ├── test_basic_functionality.robot   # Smoke checks
│   └── test_final_suite.robot           # Modal regression test
├── resources/                   # Resource files
│   ├── variables.robot         # Test variables and constants
│   └── keywords.robot          # Custom keywords
├── results/                     # Test execution results
├── logs/                       # Test execution logs
├── venv/                       # Python virtual environment
├── requirements.txt            # Python dependencies
├── test_case_descriptions.txt  # Detailed test descriptions
└── README.md                   # This file
```

## Prerequisites

- Python 3.7 or higher
- Chrome browser installed (Selenium Manager will pull the matching driver automatically)

## Setup Instructions

1. **Create & Activate Virtual Environment**
   ```bash
   python -m venv venv
   venv\Scripts\activate
   ```

2. **Install Dependencies**
   ```bash
   pip install -r requirements.txt
   ```

   > Эквивалентно можно выполнить `pip install robotframework robotframework-seleniumlibrary selenium`, если не используется `requirements.txt`.

## Running Tests

### Run All Tests
```bash
robot tests/
```

### Run Specific Test
```bash
robot tests/test_basic_functionality.robot
```

### Run with Output Directory
```bash
robot -d results tests/
```

### Run with Debug Logging
```bash
robot -L DEBUG tests/
```

### Run Smoke Suite Only
```bash
robot tests/test_basic_functionality.robot
```

### Run Remotely on BrowserStack
1. Экспортируйте учётные данные (или задайте их в Jenkins credentials):
   ```bash
   export BROWSERSTACK_USERNAME=diassagatov_LcB1nj
   export BROWSERSTACK_ACCESS_KEY=nuPZvU9EM9xuax4YpHyb
   ```
   > На Windows используйте `set` или PowerShell `Set-Item Env:...`.

2. Включите удалённый запуск:
   ```bash
   robot --variable USE_BROWSERSTACK:True -d results tests/
   ```
   По умолчанию будет выбран Windows 11 + Chrome latest; параметры можно переопределить переменными `BROWSERSTACK_OS`, `BROWSERSTACK_BROWSER_VERSION` и т.д. из `resources/variables.robot`.

## Test Cases

### 1. Website Loads Successfully
- **File**: `tests/test_basic_functionality.robot`
- **Purpose**: Smoke-check that the site opens and key header elements are visible.
- **Tags**: basic, smoke

### 2. Navigation Elements Present
- **File**: `tests/test_basic_functionality.robot`
- **Purpose**: Validate primary navigation links exist on the landing page.
- **Tags**: basic, navigation

### 3. Product Categories Visible
- **File**: `tests/test_basic_functionality.robot`
- **Purpose**: Ensure Phones/Laptops/Monitors categories are rendered.
- **Tags**: basic, products

### 4. Demo Blaze Modal Functionality Test
- **File**: `tests/test_final_suite.robot`
- **Purpose**: Exercise the login/sign-up modals (open/close) to ensure UI elements render.
- **Tags**: modal, ui

## Test Data

The test uses the following data:
- **Valid User**: testuser123 / testpass123
- **New User**: newuser456 / newpass456
- **Product**: Samsung galaxy s6
- **Order Details**: Test User, Test Country, Test City, etc.

## Reports

After test execution, reports are generated in the `results/` directory:
- `log.html` - Detailed test execution log
- `report.html` - Test execution summary
- `output.xml` - Machine-readable test results

## Configuration

Key configuration settings in `resources/variables.robot`:
- Base URL: https://www.demoblaze.com
- Browser: Chrome
- Implicit Wait: 10 seconds
- Page Load Timeout: 30 seconds

## Troubleshooting

1. **Browser/Driver Issues**: Ensure Chrome is installed and up to date so Selenium Manager can fetch a compatible driver, or verify BrowserStack credentials when running remotely.
2. **Element Not Found**: Check if the website structure has changed.
3. **Timeout Issues**: Increase wait times in `resources/variables.robot`.

## Contributing

1. Follow Robot Framework best practices
2. Use descriptive test names and documentation
3. Keep test cases independent and atomic
4. Update test data as needed

## License

This project is for educational purposes as part of Software Test Automation coursework.
