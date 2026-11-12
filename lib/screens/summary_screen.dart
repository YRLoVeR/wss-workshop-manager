import 'package:flutter/material.dart';

import '../models/equipment_item.dart';
import '../utils/app_colors.dart';

class SummaryScreen extends StatelessWidget {
  final EquipmentItem item;
  final int hours;
  final int throttlePercent;
  final double totalCost;

  const SummaryScreen({
    super.key,
    required this.item,
    required this.hours,
    required this.throttlePercent,
    required this.totalCost,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('Checkout Invoice'),
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: AppColors.surface,
                borderRadius: BorderRadius.circular(14),
                border: Border.all(color: const Color(0xFFCBD5E1)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'RESERVATION SUMMARY',
                    style: TextStyle(
                      color: AppColors.primaryAccent,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Divider(height: 24),
                  _invoiceRow('Equipment', item.name),
                  _invoiceRow('Serial', item.serial),
                  _invoiceRow('Duration', '$hours Hours'),
                  _invoiceRow('Power Limit', '$throttlePercent%'),
                  _invoiceRow(
                    'Hourly Rate',
                    '\$${item.ratePerHour.toStringAsFixed(2)}/hr',
                  ),
                  const Divider(height: 24),
                  _invoiceRow(
                    'TOTAL DUE',
                    '\$${totalCost.toStringAsFixed(2)} SGD',
                    isTotal: true,
                  ),
                ],
              ),
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF10B981),
                  foregroundColor: Colors.white,
                ),
                onPressed: () {
                  // Clears intermediate routes and returns cleanly to Screen 1
                  Navigator.of(context).popUntil((route) => route.isFirst);
                },
                child: const Text('Order Finalized'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _invoiceRow(String label, String value, {bool isTotal = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              color: isTotal ? AppColors.text : AppColors.textMuted,
              fontWeight: isTotal ? FontWeight.bold : FontWeight.normal,
            ),
          ),
          Flexible(
            child: Text(
              value,
              textAlign: TextAlign.right,
              style: TextStyle(
                fontWeight: isTotal ? FontWeight.bold : FontWeight.w600,
                fontSize: isTotal ? 18 : 14,
                color: isTotal ? const Color(0xFF059669) : AppColors.text,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
