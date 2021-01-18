class SUserModel {
  int id = 122;
  int groupId;
  String firstName;
  String lastName;
  String name;
  String profileImage;
  String socialProfileImage;
  String mobile;
  String callingCode;
  String email;
  String gender;
  String dob;
  String pcode;
  String clevel;
  String cposition;
  String salary;
  String resume;
  String rsize;
  String provider;
  String providerId;
  String description;
  int business;
  String industry;
  String userCity;
  String userState;
  String userCountry;
  String appCountry;
  String language;
  int showname;
  String fcmId;
  int accountStatus;
  int forgotStatus;
  String emailVerifiedAt;
  int verified;
  int mverified;
  String deviceType;
  String educationLevel;
  String experience;
  String salaryExpectation;
  String officeAddress;
  String noOfEmployees;
  String since;
  String vat;
  String useOfApp;
  String createdAt;
  String updatedAt;

  SUserModel({
    this.id,
    this.groupId,
    this.firstName,
    this.lastName,
    this.name,
    this.profileImage,
    this.socialProfileImage,
    this.mobile,
    this.callingCode,
    this.email,
    this.gender,
    this.dob,
    this.pcode,
    this.clevel,
    this.cposition,
    this.salary,
    this.resume,
    this.rsize,
    this.provider,
    this.providerId,
    this.description,
    this.business,
    this.industry,
    this.userCity,
    this.userState,
    this.userCountry,
    this.appCountry,
    this.language,
    this.showname,
    this.fcmId,
    this.accountStatus,
    this.forgotStatus,
    this.emailVerifiedAt,
    this.verified,
    this.mverified,
    this.deviceType,
    this.educationLevel,
    this.experience,
    this.salaryExpectation,
    this.officeAddress,
    this.noOfEmployees,
    this.since,
    this.vat,
    this.useOfApp,
    this.createdAt,
    this.updatedAt,
  });

  SUserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    groupId = json['group_id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    name = json['name'];
    profileImage = json['profile_image'];
    socialProfileImage = json['social_profile_image'];
    mobile = json['mobile'];
    callingCode = json['calling_code'];
    email = json['email'];
    gender = json['gender'];
    dob = json['dob'];
    pcode = json['pcode'];
    clevel = json['clevel'];
    cposition = json['cposition'];
    salary = json['salary'];
    resume = json['resume'];
    rsize = json['rsize'];
    provider = json['provider'];
    providerId = json['provider_id'];
    description = json['description'];
    business = json['business'];
    industry = json['industry'];
    userCity = json['user_city'];
    userState = json['user_state'];
    userCountry = json['user_country'];
    appCountry = json['app_country'];
    language = json['language'];
    showname = json['showname'];
    fcmId = json['fcm_id'];
    accountStatus = json['account_status'];
    forgotStatus = json['forgot_status'];
    emailVerifiedAt = json['email_verified_at'];
    verified = json['verified'];
    mverified = json['mverified'];
    deviceType = json['device_type'];
    educationLevel = json['education_level'];
    experience = json['experience'];
    salaryExpectation = json['salary_expectation'];
    officeAddress = json['office_address'];
    noOfEmployees = json['no_of_employees'];
    since = json['since'];
    vat = json['vat'];
    useOfApp = json['use_of_app'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['id'] = this.id;
  //   data['group_id'] = this.groupId;
  //   data['first_name'] = this.firstName;
  //   data['last_name'] = this.lastName;
  //   data['name'] = this.name;
  //   data['profile_image'] = this.profileImage;
  //   data['social_profile_image'] = this.socialProfileImage;
  //   data['mobile'] = this.mobile;
  //   data['calling_code'] = this.callingCode;
  //   data['email'] = this.email;
  //   data['gender'] = this.gender;
  //   data['dob'] = this.dob;
  //   data['pcode'] = this.pcode;
  //   data['clevel'] = this.clevel;
  //   data['cposition'] = this.cposition;
  //   data['salary'] = this.salary;
  //   data['resume'] = this.resume;
  //   data['rsize'] = this.rsize;
  //   data['provider'] = this.provider;
  //   data['provider_id'] = this.providerId;
  //   data['description'] = this.description;
  //   data['business'] = this.business;
  //   data['industry'] = this.industry;
  //   data['user_city'] = this.userCity;
  //   data['user_state'] = this.userState;
  //   data['user_country'] = this.userCountry;
  //   data['app_country'] = this.appCountry;
  //   data['language'] = this.language;
  //   data['showname'] = this.showname;
  //   data['fcm_id'] = this.fcmId;
  //   data['account_status'] = this.accountStatus;
  //   data['forgot_status'] = this.forgotStatus;
  //   data['email_verified_at'] = this.emailVerifiedAt;
  //   data['verified'] = this.verified;
  //   data['mverified'] = this.mverified;
  //   data['device_type'] = this.deviceType;
  //   data['education_level'] = this.educationLevel;
  //   data['experience'] = this.experience;
  //   data['salary_expectation'] = this.salaryExpectation;
  //   data['office_address'] = this.officeAddress;
  //   data['no_of_employees'] = this.noOfEmployees;
  //   data['since'] = this.since;
  //   data['vat'] = this.vat;
  //   data['use_of_app'] = this.useOfApp;
  //   data['created_at'] = this.createdAt;
  //   data['updated_at'] = this.updatedAt;
  //   return data;
  // }
}
