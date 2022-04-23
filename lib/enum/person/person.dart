enum PersonEnum {
  Employee,
  Customer,
  Manager,
  Admin,
  SuperAdmin,
  SoftwareOwner
}

String getStrFromPersonEnum(PersonEnum personEnum) {
  switch (personEnum) {
    case PersonEnum.Admin:
      return "Admin";
    case PersonEnum.Manager:
      return "Manager";
    case PersonEnum.Customer:
      return "Customer";
    case PersonEnum.Employee:
      return "Employee";
    case PersonEnum.SuperAdmin:
      return "Super Admin";
    case PersonEnum.SoftwareOwner:
      return "Software Owner";
    default:
      return "Customer";
  }
}

PersonEnum getPersonEnumFromStr(String str) {
  switch (str) {
    case "Admin":
      return PersonEnum.Admin;
    case "Manager":
      return PersonEnum.Manager;
    case "Customer":
      return PersonEnum.Customer;
    case "Employee":
      return PersonEnum.Employee;
    case "Super Admin":
      return PersonEnum.SuperAdmin;
    case "Software Owner":
      return PersonEnum.SoftwareOwner;
    default:
      return PersonEnum.Customer;
  }
}
