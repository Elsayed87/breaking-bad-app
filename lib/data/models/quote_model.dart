class Quote {
  late String quote;
  Quote.fromJson(json) {
    quote = json['quote'];
  }
}
