class EquipmentItem {
  final String id;
  final String name;
  final String serial;
  final bool isAvailable;
  final double ratePerHour;

  const EquipmentItem({
    required this.id,
    required this.name,
    required this.serial,
    required this.isAvailable,
    required this.ratePerHour,
  });
}
