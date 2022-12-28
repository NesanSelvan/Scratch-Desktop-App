enum ProductSort {
  category,
  productNumber,
  createdAt,
  productName;

  String get type {
    switch (this) {
      case ProductSort.category:
        return "Category";
      case ProductSort.productNumber:
        return "Product Number";
      case ProductSort.createdAt:
        return "Created At";
      case ProductSort.productName:
        return "Product Name";
      default:
        return "Category";
    }
  }
}
