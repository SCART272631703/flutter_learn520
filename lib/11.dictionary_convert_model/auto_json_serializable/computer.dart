import 'package:json_annotation/json_annotation.dart';
part 'computer.g.dart';

@JsonSerializable()
class Computer {
  String brand;
  double price;
  Computer(this.brand, this.price);
  
  factory Computer.fromJson(Map<String, dynamic> json) => _$ComputerFromJson(json);
  Map<String, dynamic> toJson() => _$ComputerToJson(this);

  @override
  String toString() {
    return 'Computer{brand: $brand, price: $price}';
  }
}
