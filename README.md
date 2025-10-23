# Demo Blaze Test Automation Project

This project contains automated test cases for the Demo Blaze website using Robot Framework and Selenium Library.

## Project Structure

```
testing-ass2/
├── chromedriver/                 # ChromeDriver executable
│   ├── chromedriver.exe
│   ├── LICENSE.chromedriver
│   └── THIRD_PARTY_NOTICES.chromedriver
├── tests/                       # Test case files
│   ├── test_signup.robot       # User sign up test
│   ├── test_login.robot        # User login test
│   ├── test_logout.robot       # User logout test
│   ├── test_purchase.robot     # Product purchase test
│   └── test_suite.robot        # Complete test suite
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
- Chrome browser installed
- ChromeDriver (included in chromedriver/ folder)

## Setup Instructions

1. **Activate Virtual Environment**
   ```bash
   venv\Scripts\activate
   ```

2. **Install Dependencies**
   ```bash
   pip install -r requirements.txt
   ```

## Running Tests

### Run All Tests
```bash
robot tests/
```

### Run Specific Test
```bash
robot tests/test_login.robot
```

### Run with Output Directory
```bash
robot -d results tests/
```

### Run with Debug Logging
```bash
robot -L DEBUG tests/
```

### Run Complete Test Suite
```bash
robot tests/test_suite.robot
```

## Test Cases

### 1. User Sign Up Test
- **File**: `tests/test_signup.robot`
- **Purpose**: Verify new user registration
- **Tags**: signup, registration

### 2. User Login Test
- **File**: `tests/test_login.robot`
- **Purpose**: Verify user authentication
- **Tags**: login, authentication

### 3. User Logout Test
- **File**: `tests/test_logout.robot`
- **Purpose**: Verify user logout functionality
- **Tags**: logout, authentication

### 4. Product Purchase Test
- **File**: `tests/test_purchase.robot`
- **Purpose**: Verify complete purchase flow
- **Tags**: purchase, ecommerce, cart

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

1. **ChromeDriver Issues**: Ensure ChromeDriver is compatible with your Chrome version
2. **Element Not Found**: Check if the website structure has changed
3. **Timeout Issues**: Increase wait times in variables.robot

## Contributing

1. Follow Robot Framework best practices
2. Use descriptive test names and documentation
3. Keep test cases independent and atomic
4. Update test data as needed

## License

This project is for educational purposes as part of Software Test Automation coursework.
