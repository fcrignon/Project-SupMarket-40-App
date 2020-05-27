class CalcPrices {
  List<double> itemsPriceList = [];

  double getTotalItemsPrices(int quantity, double itemPrice) {
    double totalItemPrice = quantity * itemPrice;
    itemsPriceList.add(totalItemPrice);
    return totalItemPrice;
  }

  double getTotalPrice(List<double> itemsPriceList) {
    double totalPrice = 0.0;

    for (var prices in itemsPriceList) {
      totalPrice = totalPrice + prices;
    }
    //totalPrice = totalPrice + getTaxPrice(tax, totalPrice);
    return totalPrice;
  }

  double getTaxPrice(int tax, double totalPrice) {
    double taxPrice = totalPrice * (tax / 100);
    return taxPrice;
  }

  double getTotalPriceWithTax(double taxPrice, double totalPrice) {
    double total = taxPrice + totalPrice;
    return total;
  }
}
