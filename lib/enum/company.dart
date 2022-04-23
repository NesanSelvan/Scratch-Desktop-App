enum CompanyEnum {
  Name,
  MobileNo,
  Address,
  PlaceOfDispatch,
  PAN,
  GSTIN,
  DateTime
}

String companyEnumToStr(CompanyEnum categoryEnum) {
  switch (categoryEnum) {
    case CompanyEnum.Name:
      return "Name";
    case CompanyEnum.PAN:
      return "PAN";
    case CompanyEnum.GSTIN:
      return "GSTIN";
    case CompanyEnum.PlaceOfDispatch:
      return "Place Of Dispatch";
    case CompanyEnum.MobileNo:
      return "Mobile No";
    case CompanyEnum.Address:
      return "Address";
    default:
      return "Date Time";
  }
}

CompanyEnum strToCompanyEnum(String str) {
  if (str == "Name") {
    return CompanyEnum.Name;
  } else if (str == "Mobile No") {
    return CompanyEnum.MobileNo;
  } else if (str == "Address") {
    return CompanyEnum.Address;
  } else if (str == "Place Of Dispatch") {
    return CompanyEnum.PlaceOfDispatch;
  } else if (str == "PAN") {
    return CompanyEnum.PAN;
  } else if (str == "GSTIN") {
    return CompanyEnum.GSTIN;
  }
  return CompanyEnum.DateTime;
}
