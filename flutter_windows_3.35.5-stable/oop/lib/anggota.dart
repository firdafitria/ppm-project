class Anggota {
  String _nama;
  String _id;

  Anggota(this._nama, this._id);

  // Getter
  String get nama => _nama;
  String get id => _id;

  // Metode untuk menampilkan informasi anggota
  void info() {
    print('Nama Anggota: $_nama, ID: $_id');
  }
}