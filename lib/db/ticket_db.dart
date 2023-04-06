import 'package:booking_ticket/model/ticket.dart';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static const String _dbName = "ticket_database.db";

  static Future<Database> get_database_ticket() async {
    return openDatabase(
      join(await getDatabasesPath(), _dbName),
      onCreate: (db, version) async {
        await db.execute(
            "CREATE TABLE Ticket (id INTEGER PRIMARY KEY, moviename TEXT NOT NULL, datetime TEXT NOT NULL, theater TEXT NOT NULL, seat TEXT NOT NULL, cinema TEXT NOT NULL);");
      },
      version: 3,
    );
  }

  static Future<int> insertTicket(TicketData ticket) async {
    final db = await get_database_ticket();
    return await db.insert(
      "Ticket",
      ticket.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  static Future<int> updateTicket(TicketData ticket) async {
    final db = await get_database_ticket();
    return await db.update(
      "Ticket",
      ticket.toJson(),
      where: 'id = ?',
      whereArgs: [ticket.id],
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  static Future<int> deleteTicket(TicketData ticket) async {
    final db = await get_database_ticket();
    return await db.delete(
      "Ticket",
      where: 'id = ?',
      whereArgs: [ticket.id],
    );
  }

  static Future<List<TicketData>?> getAllTicket() async {
    try {
      final db = await get_database_ticket();
      final List<Map<String, dynamic>> maps = await db.query("Ticket");
      if (maps.isEmpty) {
        return null;
      }
      return List.generate(
        maps.length,
        (index) => TicketData.fromJson(maps[index]),
      );
    } catch (e) {
      print("Error while getting tickets: $e");
      return null;
    }
  }
}
