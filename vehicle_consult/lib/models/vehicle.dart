class Vehicle {
  final String? plate;
  final String model;
  final String status;
  final String chassi;
  final String motor;

  Vehicle({
    this.plate,
    required this.model,
    required this.status,
    required this.chassi,
    required this.motor,
  });

  factory Vehicle.fromJson(Map<String, dynamic> json) {
    return Vehicle(
      plate: json['plate'],
      model: json['model'],
      status: json['status'],
      chassi: json['chassi'],
      motor: json['motor'],
    );
  }
}
