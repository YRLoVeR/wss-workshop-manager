import 'package:flutter/material.dart';

import 'package:wss_workshop_manager/models/equipment_item.dart';
import 'package:wss_workshop_manager/utils/app_colors.dart';

import 'summary_screen.dart';

class DetailScreen extends StatefulWidget {
  final EquipmentItem item;

  const DetailScreen({super.key, required this.item});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  int hours = 1;
  double throttlePercent = 50.0;
  bool isSafetyInducted = false;

  @override
  Widget build(BuildContext context) {
    final double totalCost = hours * widget.item.ratePerHour;

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('Device Config & Reserve'),
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppColors.surface,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.item.name,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'SN: ${widget.item.serial} • Base Rate: \$${widget.item.ratePerHour.toStringAsFixed(2)}/hr',
                    style: const TextStyle(color: AppColors.textMuted),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),

            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: AppColors.surface,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Rental Duration (1–8 hrs)',
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                  Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.remove_circle_outline),
                        onPressed: hours > 1
                            ? () => setState(() => hours--)
                            : null,
                      ),
                      Text(
                        '$hours hr${hours > 1 ? 's' : ''}',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.add_circle_outline),
                        onPressed: hours < 8
                            ? () => setState(() => hours++)
                            : null,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),

            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppColors.surface,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Power Limit Throttle',
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                      Text(
                        '${throttlePercent.round()}%',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: AppColors.primaryAccent,
                        ),
                      ),
                    ],
                  ),
                  Slider(
                    value: throttlePercent,
                    min: 0,
                    max: 100,
                    divisions: 20,
                    onChanged: (val) => setState(() => throttlePercent = val),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),

            Container(
              decoration: BoxDecoration(
                color: AppColors.surface,
                borderRadius: BorderRadius.circular(12),
              ),
              child: SwitchListTile(
                title: const Text(
                  'Safety Induction Acknowledged',
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                subtitle: const Text('Required before equipment checkout'),
                value: isSafetyInducted,
                onChanged: (val) => setState(() => isSafetyInducted = val),
              ),
            ),
            const Spacer(),

            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryAccent,
                  foregroundColor: Colors.white,
                ),
                onPressed: isSafetyInducted
                    ? () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SummaryScreen(
                              item: widget.item,
                              hours: hours,
                              throttlePercent: throttlePercent.round(),
                              totalCost: totalCost,
                            ),
                          ),
                        );
                      }
                    : null,
                child: Text(
                  'Proceed to Checkout (\$${totalCost.toStringAsFixed(2)})',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
