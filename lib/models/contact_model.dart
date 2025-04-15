// File: lib/models/contact_model.dart
class ContactModel {
  int? id;
  String name;
  String phone;
  String email;
  String notes;
  bool isMain;

  ContactModel({
    this.id,
    this.name = '',
    this.phone = '',
    this.email = '',
    this.notes = '',
    this.isMain = false,
  });
}
