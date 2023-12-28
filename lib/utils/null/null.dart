// ignore: avoid_classes_with_only_static_members
import 'package:annai_store/extensions/type.dart';
import 'package:annai_store/models/category/category.dart';
import 'package:annai_store/models/company/company.dart';
import 'package:annai_store/models/customer/customer.dart';
import 'package:annai_store/models/persons/employee/employee.dart';
import 'package:annai_store/models/product/product.dart';
import 'package:annai_store/models/unit/unit.dart';

// ignore: avoid_classes_with_only_static_members
class NullCheckUtilities {
  static CategoryModel getDummyCategory() {
    return CategoryModel(
        tax: 0, category: '', hsnCode: 0000, dateTime: DateTime.now(), id: '');
  }

  static UnitModel getDummyUnit() {
    return UnitModel("id", "symbol", "formalName", null, DateTime.now());
  }

  static CustomerModel getDummyCustomer() {
    return CustomerModel(
        id: "id",
        name: "name",
        address: "address",
        pincode: 123456,
        state: "state",
        type: "type",
        isPending: false,
        mobileNo: 123465);
  }

  static ProductModel getDummyProduct() {
    return ProductModel(
        id: "id",
        code: "code",
        productName: "productName",
        categoryId: "categoryId",
        unitId: "unitId",
        purchasePrice: 3,
        sellingPrice: 3,
        wholesale: 3,
        retail: 3,
        companyId: "companyId",
        createdAt: DateTime.now());
  }

  static EmployeeModel getDummyEmployee({String? employeeName}) {
    return EmployeeModel(
        id: "id",
        name: employeeName ?? "",
        email: "email",
        address: "address",
        pincode: 123456789,
        state: "state",
        type: "Type",
        mobileNo: 123456789,
        password: "password");
  }

  static CompanyModel getDummyCompany() {
    return CompanyModel(
        id: "id",
        name: "",
        mobileNoList: "",
        email: "email",
        address: "address",
        createdAt: DateTime.now());
  }
}
