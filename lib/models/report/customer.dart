class CustomerReport {
  final DateTime createdAt;
  final String particulars;
  final VchType vchType;
  final String vchNo;
  final double debit;
  final double credit;

  CustomerReport(this.createdAt, this.particulars, this.vchType, this.vchNo,
      this.debit, this.credit);
}

enum VchType {
  gst,
  receipt,
}
