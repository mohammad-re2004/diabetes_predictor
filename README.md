# Diabetes Risk Predictor (Flutter App)

A simple **Diabetes Risk Predictor** mobile app built with **Flutter** that uses rule-based logic to estimate a user’s diabetes risk level. This app is designed for **educational and testing purposes only**—it is **not a medical diagnosis tool**. Always consult a healthcare professional for real health concerns.

---

## Features

* Predicts **diabetes risk** based on user input:

  * Age
  * Glucose
  * Weight (kg)
  * Height (cm)
  * Diabetes Pedigree Function (DPF)
* **Interactive Gauge** showing risk level visually:

  * Low Risk (Green)
  * Moderate Risk (Orange)
  * High Risk (Red)
* Percentage and label below the Gauge update dynamically with the result.
* Supports **Light & Dark Mode** based on the user’s device theme.
* Input validation ensures only valid numbers are accepted.
* Clean, modern UI with Material 3 design.

---


## Screenshots
<img src="./assets/sc1.png" alt="Home Screen" width="300"/>
<img src="./assets/sc2.png" alt="Home Screen" width="300"/>
<img src="./assets/sc3.png" alt="Home Screen" width="300"/>
<img src="./assets/sc4.png" alt="Home Screen" width="300"/>


---

## Installation

1. Clone the repository:

```bash
git clone https://github.com/mohammad-re2004/diabetes_predictor.git
```

2. Navigate to the project folder:

```bash
cd diabetes-risk-predictor
```

3. Install dependencies:

```bash
flutter pub get
```

4. Run the app on your device or emulator:

```bash
flutter run
```

---

## Usage

1. Enter your Age, Glucose, BMI, and Diabetes Pedigree Function.
2. Tap **"Predict Diabetes Risk"**.
3. See your **risk level** on the Gauge along with percentage and label.
4. Tap **Predict** again to reset the input fields.

---

## Sample Test Data🔬

| Risk Level | Age | Glucose | Height (cm) | Weight (kg) | DPF |
|-------------|-----|----------|--------------|--------------|-----|
| 🟢 Low      | 25  | 90       | 175          | 68           | 0.2 |
| 🟠 Moderate | 40  | 130      | 170          | 78           | 0.8 |
| 🔴 High     | 50  | 160      | 165          | 95           | 0.6 |

---

## Disclaimer

⚠️ **This app is for educational purposes only**.
The results are **rule-based predictions**, not medical advice.
Always consult a **healthcare professional** for real health assessments.

---

## Dependencies

* [Flutter](https://flutter.dev/)
* [syncfusion_flutter_gauges](https://pub.dev/packages/syncfusion_flutter_gauges) for Gauge visualization

---

## License

MIT License © mohammadreza ebadi
