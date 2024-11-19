import 'package:firebase_database/firebase_database.dart';

class DatabaseService {
  final DatabaseReference _dbRef = FirebaseDatabase.instance.ref();

  // Write data
  Future<void> addObat(String userId, Map<String, dynamic> obatData) async {
    final userObatRef = _dbRef.child('users/$userId/obat').push();
    await userObatRef.set(obatData);
  }

  // Read data as a stream
  Stream<DatabaseEvent> getObatStream(String userId) {
    return _dbRef.child('users/$userId/obat').onValue;
  }

  // Delete data
  Future<void> deleteObat(String userId, String obatId) async {
    await _dbRef.child('users/$userId/obat/$obatId').remove();
  }
}
