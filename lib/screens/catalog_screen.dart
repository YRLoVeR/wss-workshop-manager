import 'package:flutter/material.dart';

import '../models/equipment_item.dart';
import '../utils/app_colors.dart';
import '../widgets/custom_badge.dart';
import '../widgets/equipment_card.dart';
import 'detail_screen.dart';

class CatalogScreen extends StatelessWidget {
  const CatalogScreen({super.key});

  final List<EquipmentItem> equipmentList = const [
    EquipmentItem(
      id: '1',
      name: 'Creality Ender-3 Pro 3D Printer',
      serial: 'WSS-3DP-01',
      isAvailable: true,
      ratePerHour: 12.00,
    ),
    EquipmentItem(
      id: '2',
      name: 'Epilog Zing 24 Laser Cutter',
      serial: 'WSS-LC-04',
      isAvailable: true,
      ratePerHour: 25.00,
    ),
    EquipmentItem(
      id: '3',
      name: 'Shapeoko 4 CNC Router Mill',
      serial: 'WSS-CNC-09',
      isAvailable: false,
      ratePerHour: 18.00,
    ),
    EquipmentItem(
      id: '4',
      name: 'Rigol 100MHz Digital Oscilloscope',
      serial: 'WSS-OSC-12',
      isAvailable: true,
      ratePerHour: 8.00,
    ),
    EquipmentItem(
      id: '5',
      name: 'Hakko FX-888D Soldering Station',
      serial: 'WSS-SOL-05',
      isAvailable: true,
      ratePerHour: 5.00,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('Workshop Equipment'),
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          // Decorated Dashboard Banner
          Container(
            width: double.infinity,
            margin: const EdgeInsets.all(16),
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [AppColors.primary, AppColors.primaryAccent],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: AppColors.primaryAccent.withOpacity(0.3),
                  blurRadius: 12,
                  offset: const Offset(0, 6),
                ),
              ],
            ),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'WORKSHOP FLEET HEALTH',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  'Workshop Status: 85% Operational',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),

          // Scrollable Equipment List
          Expanded(
            child: ListView.builder(
              itemCount: equipmentList.length,
              itemBuilder: (context, index) {
                final item = equipmentList[index];
                return EquipmentCard(
                  item: item,
                  statusBadge: CustomBadge(isAvailable: item.isAvailable),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailScreen(item: item),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
