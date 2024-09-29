import 'package:flutter/material.dart';
import 'package:hack_yeah_app_frontend/models/saldo_record.dart';
import 'package:intl/intl.dart';

class MoneyNotifier extends ChangeNotifier {
  int _money = 0;
  final List<SaldoRecord> _saldoRecords = [];

  int get money => _money;
  List<SaldoRecord> get saldoRecords => _saldoRecords;

  void addMoney(int value) {
    _money += value;
    final dateNow = DateTime.now();
    final formattedDate = DateFormat('HH:mm dd/MM/yyyy').format(dateNow);
    _saldoRecords.add(SaldoRecord(
        ammount: value, date: formattedDate, description: 'Doładowanie konta'));
    notifyListeners();
  }

  void subtractMoney(int value) {
    _money -= value;
    final dateNow = DateTime.now();
    final formattedDate = DateFormat('HH/mm dd/MM/yyyy').format(dateNow);
    _saldoRecords.add(SaldoRecord(
        ammount: -value,
        date: formattedDate,
        description: 'Wypłata pieniędzy'));
    notifyListeners();
  }
}
