import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constants/app_colors.dart';

class MyPayrollSlipsScreen extends StatelessWidget {
  const MyPayrollSlipsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context, 'Payroll Slips'),
      body: ListView.builder(
        padding: const EdgeInsets.all(20),
        itemCount: 5,
        itemBuilder: (context, index) {
            return Card(child: ListTile(title: Text('Payslip Month ${index+1}')));
        },
      ),
    );
  }
}

class AllowancesDeductionsScreen extends StatelessWidget {
  const AllowancesDeductionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context, 'Allowances & Deductions'),
      body: Center(child: Text('Details Placeholder')),
    );
  }
}

PreferredSizeWidget _buildAppBar(BuildContext context, String title) {
  return AppBar(
    title: Text(
      title,
      style: GoogleFonts.poppins(
        color: AppColors.primaryText,
        fontWeight: FontWeight.bold,
      ),
    ),
    backgroundColor: Colors.white,
    elevation: 0,
    leading: IconButton(
      icon: const Icon(Icons.arrow_back, color: AppColors.primaryText),
      onPressed: () => Navigator.pop(context),
    ),
  );
}
