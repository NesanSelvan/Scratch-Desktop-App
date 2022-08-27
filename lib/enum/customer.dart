enum CustomerEnum {
  Name,
  MobileNo,
  Address,
  State,
  Pincode,
  GSTIN,
  Type,
  DateTime
}

String customerEnumToStr(CustomerEnum categoryEnum) {
  switch (categoryEnum) {
    case CustomerEnum.Name:
      return "Name";
    case CustomerEnum.State:
      return "State";
    case CustomerEnum.Pincode:
      return "Pincode";
    case CustomerEnum.GSTIN:
      return "GSTIN";
    case CustomerEnum.Type:
      return "Type";
    case CustomerEnum.MobileNo:
      return "Mobile No";
    case CustomerEnum.Address:
      return "Address";
    default:
      return "Date Time";
  }
}

CustomerEnum strToCustomerEnum(String str) {
  if (str == "Name") {
    return CustomerEnum.Name;
  } else if (str == "Mobile No") {
    return CustomerEnum.MobileNo;
  } else if (str == "Address") {
    return CustomerEnum.Address;
  } else if (str == "State") {
    return CustomerEnum.State;
  } else if (str == "Pincode") {
    return CustomerEnum.Pincode;
  } else if (str == "Type") {
    return CustomerEnum.Type;
  }
  return CustomerEnum.DateTime;
}

enum EmployeeEnum {
  Name,
  Email,
  MobileNo,
  Address,
  State,
  Pincode,
  Type,
  DateTime
}

String employeeEnumToStr(EmployeeEnum categoryEnum) {
  switch (categoryEnum) {
    case EmployeeEnum.Name:
      return "Name";
    case EmployeeEnum.State:
      return "State";
    case EmployeeEnum.Pincode:
      return "Pincode";
    case EmployeeEnum.Email:
      return "Email";
    case EmployeeEnum.Type:
      return "Type";
    case EmployeeEnum.MobileNo:
      return "Mobile No";
    case EmployeeEnum.Address:
      return "Address";
    default:
      return "Date Time";
  }
}

EmployeeEnum strToEmployeeEnum(String str) {
  if (str == "Name") {
    return EmployeeEnum.Name;
  } else if (str == "Mobile No") {
    return EmployeeEnum.MobileNo;
  } else if (str == "Address") {
    return EmployeeEnum.Address;
  } else if (str == "State") {
    return EmployeeEnum.State;
  } else if (str == "Pincode") {
    return EmployeeEnum.Pincode;
  } else if (str == "Type") {
    return EmployeeEnum.Type;
  }
  return EmployeeEnum.DateTime;
}
