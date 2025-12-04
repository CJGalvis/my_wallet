import 'package:cloud_firestore/cloud_firestore.dart';

class CloudFirestoreService {
  final String _userCollection = 'users';
  final String _pocketsCollection = 'pockets';
  final String _userKeyField = 'email';
  final String _ownerKeyField = 'owner';

  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<List<Map<String, dynamic>>> getData({
    required String collection,
  }) async {
    try {
      QuerySnapshot snapshot = await _db.collection(collection).get();
      return snapshot.docs.map((doc) {
        final data = doc.data() as Map<String, dynamic>;
        data['id'] = doc.id;
        return data;
      }).toList();
    } catch (e) {
      throw Exception('Error fetching data: $e');
    }
  }

  Future<List<Map<String, dynamic>>> queryData({
    required String collection,
    required String field,
    required dynamic value,
  }) async {
    try {
      QuerySnapshot snapshot = await _db
          .collection(collection)
          .where(field, isEqualTo: value)
          .get();

      return snapshot.docs.map((doc) {
        final data = doc.data() as Map<String, dynamic>;
        data['id'] = doc.id;
        return data;
      }).toList();
    } catch (e) {
      throw Exception('Error querying data: $e');
    }
  }

  Future<Map<String, dynamic>?> getUser(String email) async {
    QuerySnapshot snapshot = await _db
        .collection(_userCollection)
        .where(_userKeyField, isEqualTo: email)
        .get();

    final results = snapshot.docs.map((doc) {
      final data = doc.data() as Map<String, dynamic>;
      data['id'] = doc.id;
      return data;
    }).toList();

    return results.isNotEmpty ? results.first : null;
  }

  Future<void> saveNewUser(
    Map<String, dynamic> data,
  ) async {
    try {
      await _db.collection(_userCollection).add(data);
    } catch (e) {
      throw Exception('Error inserting data: $e');
    }
  }

  Future<Map<String, dynamic>> saveNewPocket(
    Map<String, dynamic> data,
  ) async {
    try {
      DocumentReference ref =
          await _db.collection(_pocketsCollection).add(data);
      final snapshot = await ref.get();

      final result = snapshot.data() as Map<String, dynamic>;

      return {
        'id': snapshot.id,
        'type': result['type'],
        'name': result['name'],
        'balance': result['balance'],
        'owner': result['owner'],
        'created': result['created'],
      };
    } catch (e) {
      throw Exception('Error inserting data: $e');
    }
  }

  Future<List<Map<String, dynamic>>> queryPockets(
    String owner,
  ) async {
    try {
      QuerySnapshot snapshot = await _db
          .collection(_pocketsCollection)
          .where(_ownerKeyField, isEqualTo: owner)
          .get();

      return snapshot.docs.map((doc) {
        final data = doc.data() as Map<String, dynamic>;
        data['id'] = doc.id;
        return data;
      }).toList();
    } catch (e) {
      throw Exception('Error querying data: $e');
    }
  }
}
