import 'package:diabetes_predictor_application/data/rules.dart';
import 'package:diabetes_predictor_application/presentation/widgets/input_field.dart';
import 'package:diabetes_predictor_application/presentation/widgets/result_card.dart';
import 'package:flutter/material.dart';

class PredictionScreen extends StatefulWidget {
  const PredictionScreen({super.key});

  @override
  State<PredictionScreen> createState() => _PredictionScreenState();
}

class _PredictionScreenState extends State<PredictionScreen> {
  final _formKey = GlobalKey<FormState>();

  final _ageController = TextEditingController();
  final _glucoseController = TextEditingController();
  final _bmiController = TextEditingController();
  final _dpfController = TextEditingController();

  bool _isPredicting = false;
  DiabetesResult? _prediction;

  void _predict() {
    if (!_formKey.currentState!.validate()) return;

    setState(() {
      _isPredicting = true;
      _prediction = null;
    });

    Future.delayed(const Duration(milliseconds: 600), () {
      final age = int.tryParse(_ageController.text.trim());
      final glucose = double.tryParse(_glucoseController.text.trim());
      final bmi = double.tryParse(_bmiController.text.trim());
      final dpf = double.tryParse(_dpfController.text.trim());

      if (age == null || glucose == null || bmi == null || dpf == null) {
        _showError("Please enter valid numbers.");
        setState(() => _isPredicting = false);
        return;
      }

      final result = classifyDiabetes(
        age: age,
        glucose: glucose,
        bmi: bmi,
        dpf: dpf,
      );

      setState(() {
        _prediction = _prediction = result;
        _isPredicting = false;
      });
    });
  }

  void _showError(String msg) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(msg),
        backgroundColor: Colors.red[700],
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F9FC),
      appBar: AppBar(
        title: const Text(
          'Diabetes Predictor',
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
      ),
      body: SafeArea(
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 500),
          transitionBuilder: (child, animation) => FadeTransition(
            opacity: animation,
            child: ScaleTransition(scale: animation, child: child),
          ),
          child: _prediction == null ? _buildFormView() : _buildResultView(),
        ),
      ),
    );
  }

  Widget _buildFormView() {
    return Padding(
      key: const ValueKey('form'),
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Form(
        key: _formKey,
        child: ListView(
          children: [
            const SizedBox(height: 12),
            InputField(
              controller: _ageController,
              label: 'Age',
              hint: ' 10 – 80',
            ),
            InputField(
              controller: _glucoseController,
              label: 'Glucose',
              hint: '60 – 200',
            ),
            InputField(
              controller: _bmiController,
              label: 'BMI',
              hint: '15 – 50',
            ),
            InputField(
              controller: _dpfController,
              label: 'Diabetes Pedigree Function',
              hint: '0.1 – 2.5',
            ),
            const SizedBox(height: 32),
            SizedBox(
              height: 56,
              child: ElevatedButton(
                onPressed: _isPredicting ? null : _predict,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF4361EE),
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                child: _isPredicting
                    ? const CircularProgressIndicator(color: Colors.white)
                    : const Text(
                        'Predict',
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
              ),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  Widget _buildResultView() {
    return Padding(
      key: const ValueKey('result'),
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Expanded(child: ResultCard(result: _prediction!)),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              setState(() {
                _prediction = null;
                _ageController.clear();
                _glucoseController.clear();
                _bmiController.clear();
                _dpfController.clear();
              });
            },
            child: Text('Predict Again'),
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF4361EE),
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
