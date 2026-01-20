class CustomerModel {
  final int idCustomer;
  final String nama;
  final String email;

  CustomerModel({required this.idCustomer, required this.nama, required this.email});

  factory CustomerModel.fromJson(Map<String, dynamic> json) {
    return CustomerModel(
      // Pastikan key ini sama dengan nama kolom di database Anda
      idCustomer: json['id_customer'] ?? 0, 
      nama: json['nama'] ?? '',
      email: json['email'] ?? '',
    );
  }
}