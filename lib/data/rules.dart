class DiabetesResult {
  final int prediction;
  final String rule;
  final double riskLevel;

  DiabetesResult(this.prediction, this.rule, this.riskLevel);
}

DiabetesResult classifyDiabetes({
  required int age,
  required double glucose,
  required double bmi,
  required double dpf,
}) {
  //
  if (glucose > 154) {
    return DiabetesResult(1, "Rule 2 → Glucose > 154", 0.9);
  }
  if (glucose > 101 && glucose <= 154 && bmi > 43.3 && age > 29) {
    return DiabetesResult(
      1,
      "Rule 1 → Glucose>101 ≤154, BMI>43.3, Age>29",
      0.8,
    );
  }

  //
  if (glucose > 101 && bmi > 26.7 && dpf > 0.464 && age > 29) {
    return DiabetesResult(2, "Moderate Risk → Rule 3 for 1.0", 0.5);
  }

  //
  if (glucose <= 101) {
    return DiabetesResult(0, "Rule 2 for 0.0 → Glucose ≤101", 0.2);
  }
  if (glucose <= 154 && age <= 29) {
    return DiabetesResult(0, "Rule 3 for 0.0 → Glucose ≤154, Age ≤29", 0.25);
  }
  if (glucose <= 154 && bmi <= 26.7) {
    return DiabetesResult(0, "Rule 1 for 0.0 → Glucose ≤154, BMI ≤26.7", 0.3);
  }

  return DiabetesResult(0, "Default → No matching rule", 0.3);
}
