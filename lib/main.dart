import 'package:diabetes_predictor_application/presentation/screens/prediction_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(DiabetesPredictorApp());
}

class DiabetesPredictorApp extends StatelessWidget {
  const DiabetesPredictorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: PredictionScreen());
  }
}
