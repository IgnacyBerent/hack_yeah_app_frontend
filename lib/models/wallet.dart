class Wallet {
  int money;
  int tokens;

  Wallet({required this.money, required this.tokens});

  factory Wallet.fromJson(Map<String, dynamic> json) {
    return Wallet(
      money: json['money_balance'],
      tokens: json['token_balance'],
    );
  }
}
