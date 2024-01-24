class WalletModel {
  int? walletId;
  int? userId;
  int? cardId;

  WalletModel.fromJson(Map m) {
    walletId = m['walletId'];
    userId = m['userId'];
    cardId = m['cardId'];
  }
}
