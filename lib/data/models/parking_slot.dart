import 'package:cloud_firestore/cloud_firestore.dart';

class ParkingSlot {
  final String slotId;
  final String slotName;
  final bool isParked;
  final bool isBooked;
  final String time;

  ParkingSlot({
    required this.slotId,
    required this.slotName,
    required this.isParked,
    required this.isBooked,
    required this.time,
  });

  factory ParkingSlot.fromFirestore(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    return ParkingSlot(
      slotId: doc.id,
      slotName: data['slotName'] ?? '',
      isParked: data['isParked'] ?? false,
      isBooked: data['isBooked'] ?? false,
      time: data['time'] ?? '',
    );
  }
}
