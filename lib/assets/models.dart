class Models {
  Meta meta;
  List<Data> data;

  Models({this.meta, this.data});

  Models.fromJson(Map<String, dynamic> json) {
    meta = json['meta'] != null ? new Meta.fromJson(json['meta']) : null;
    if (json['data'] != null) {
      data = new List<Data>();
      json['data'].forEach((v) {
        data.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.meta != null) {
      data['meta'] = this.meta.toJson();
    }
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Meta {
  String dataType;
  String itemType;
  int total;
  int count;
  int skip;
  int limit;

  Meta(
      {this.dataType,
        this.itemType,
        this.total,
        this.count,
        this.skip,
        this.limit});

  Meta.fromJson(Map<String, dynamic> json) {
    dataType = json['data_type'];
    itemType = json['item_type'];
    total = json['total'];
    count = json['count'];
    skip = json['skip'];
    limit = json['limit'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['data_type'] = this.dataType;
    data['item_type'] = this.itemType;
    data['total'] = this.total;
    data['count'] = this.count;
    data['skip'] = this.skip;
    data['limit'] = this.limit;
    return data;
  }
}

class Data {
  List<Practices> practices;
  List<Educations> educations;
  Profile profile;
  List<Ratings> ratings;
  List<Insurances> insurances;
  List<Specialties> specialties;
  List<Licenses> licenses;
  String uid;
  String npi;

  Data(
      {this.practices,
        this.educations,
        this.profile,
        this.ratings,
        this.insurances,
        this.specialties,
        this.licenses,
        this.uid,
        this.npi});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['practices'] != null) {
      practices = new List<Practices>();
      json['practices'].forEach((v) {
        practices.add(new Practices.fromJson(v));
      });
    }
    if (json['educations'] != null) {
      educations = new List<Educations>();
      json['educations'].forEach((v) {
        educations.add(new Educations.fromJson(v));
      });
    }
    profile =
    json['profile'] != null ? new Profile.fromJson(json['profile']) : null;
    if (json['ratings'] != null) {
      ratings = new List<Ratings>();
      json['ratings'].forEach((v) {
        ratings.add(new Ratings.fromJson(v));
      });
    }
    if (json['insurances'] != null) {
      insurances = new List<Insurances>();
      json['insurances'].forEach((v) {
        insurances.add(new Insurances.fromJson(v));
      });
    }
    if (json['specialties'] != null) {
      specialties = new List<Specialties>();
      json['specialties'].forEach((v) {
        specialties.add(new Specialties.fromJson(v));
      });
    }
    if (json['licenses'] != null) {
      licenses = new List<Licenses>();
      json['licenses'].forEach((v) {
        licenses.add(new Licenses.fromJson(v));
      });
    }
    uid = json['uid'];
    npi = json['npi'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.practices != null) {
      data['practices'] = this.practices.map((v) => v.toJson()).toList();
    }
    if (this.educations != null) {
      data['educations'] = this.educations.map((v) => v.toJson()).toList();
    }
    if (this.profile != null) {
      data['profile'] = this.profile.toJson();
    }
    if (this.ratings != null) {
      data['ratings'] = this.ratings.map((v) => v.toJson()).toList();
    }
    if (this.insurances != null) {
      data['insurances'] = this.insurances.map((v) => v.toJson()).toList();
    }
    if (this.specialties != null) {
      data['specialties'] = this.specialties.map((v) => v.toJson()).toList();
    }
    if (this.licenses != null) {
      data['licenses'] = this.licenses.map((v) => v.toJson()).toList();
    }
    data['uid'] = this.uid;
    data['npi'] = this.npi;
    return data;
  }
}

class Practices {
  String locationSlug;
  bool withinSearchArea;
  double distance;
  double lat;
  double lon;
  String uid;
  String name;
  String website;
  bool acceptsNewPatients;
  List<String> insuranceUids;
  List<Insurances> insurances;
  VisitAddress visitAddress;
  List<Null> officeHours;
  List<Phones> phones;
  List<Languages> languages;
  List<Media> media;
  String description;
  List<String> imageUrls;

  Practices(
      {this.locationSlug,
        this.withinSearchArea,
        this.distance,
        this.lat,
        this.lon,
        this.uid,
        this.name,
        this.website,
        this.acceptsNewPatients,
        this.insuranceUids,
        this.insurances,
        this.visitAddress,
        this.officeHours,
        this.phones,
        this.languages,
        this.media,
        this.description,
        this.imageUrls});

  Practices.fromJson(Map<String, dynamic> json) {
    locationSlug = json['location_slug'];
    withinSearchArea = json['within_search_area'];
    distance = json['distance'];
    lat = json['lat'];
    lon = json['lon'];
    uid = json['uid'];
    name = json['name'];
    website = json['website'];
    acceptsNewPatients = json['accepts_new_patients'];
    insuranceUids = json['insurance_uids'].cast<String>();
    if (json['insurances'] != null) {
      insurances = new List<Insurances>();
      json['insurances'].forEach((v) {
        insurances.add(new Insurances.fromJson(v));
      });
    }
    visitAddress = json['visit_address'] != null
        ? new VisitAddress.fromJson(json['visit_address'])
        : null;
   /* if (json['office_hours'] != null) {
      officeHours = new List<Null>();
      json['office_hours'].forEach((v) {
        officeHours.add(new Null.fromJson(v));
      });
    }*/
    if (json['phones'] != null) {
      phones = new List<Phones>();
      json['phones'].forEach((v) {
        phones.add(new Phones.fromJson(v));
      });
    }
    if (json['languages'] != null) {
      languages = new List<Languages>();
      json['languages'].forEach((v) {
        languages.add(new Languages.fromJson(v));
      });
    }
    if (json['media'] != null) {
      media = new List<Media>();
      json['media'].forEach((v) {
        media.add(new Media.fromJson(v));
      });
    }
    description = json['description'];
   // imageUrls = json['image_urls'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['location_slug'] = this.locationSlug;
    data['within_search_area'] = this.withinSearchArea;
    data['distance'] = this.distance;
    data['lat'] = this.lat;
    data['lon'] = this.lon;
    data['uid'] = this.uid;
    data['name'] = this.name;
    data['website'] = this.website;
    data['accepts_new_patients'] = this.acceptsNewPatients;
    data['insurance_uids'] = this.insuranceUids;
    if (this.insurances != null) {
      data['insurances'] = this.insurances.map((v) => v.toJson()).toList();
    }
    if (this.visitAddress != null) {
      data['visit_address'] = this.visitAddress.toJson();
    }
    /*if (this.officeHours != null) {
      data['office_hours'] = this.officeHours.map((v) => v.toJson()).toList();
    }*/
    if (this.phones != null) {
      data['phones'] = this.phones.map((v) => v.toJson()).toList();
    }
    if (this.languages != null) {
      data['languages'] = this.languages.map((v) => v.toJson()).toList();
    }
    if (this.media != null) {
      data['media'] = this.media.map((v) => v.toJson()).toList();
    }
    data['description'] = this.description;
    data['image_urls'] = this.imageUrls;
    return data;
  }
}

class Insurances {
  InsurancePlan insurancePlan;
  InsuranceProvider insuranceProvider;

  Insurances({this.insurancePlan, this.insuranceProvider});

  Insurances.fromJson(Map<String, dynamic> json) {
    insurancePlan = json['insurance_plan'] != null
        ? new InsurancePlan.fromJson(json['insurance_plan'])
        : null;
    insuranceProvider = json['insurance_provider'] != null
        ? new InsuranceProvider.fromJson(json['insurance_provider'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.insurancePlan != null) {
      data['insurance_plan'] = this.insurancePlan.toJson();
    }
    if (this.insuranceProvider != null) {
      data['insurance_provider'] = this.insuranceProvider.toJson();
    }
    return data;
  }
}

class InsurancePlan {
  String uid;
  String name;
  List<String> category;
  List<Null> programTypes;

  InsurancePlan({this.uid, this.name, this.category, this.programTypes});

  InsurancePlan.fromJson(Map<String, dynamic> json) {
    uid = json['uid'];
    name = json['name'];
    category = json['category'].cast<String>();
    /*if (json['program_types'] != null) {
      programTypes = new List<Null>();
      json['program_types'].forEach((v) {
        programTypes.add(new Null.fromJson(v));
      });
    }*/
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['uid'] = this.uid;
    data['name'] = this.name;
    data['category'] = this.category;
   /* if (this.programTypes != null) {
      data['program_types'] = this.programTypes.map((v) => v.toJson()).toList();
    }*/
    return data;
  }
}

class InsuranceProvider {
  String uid;
  String name;

  InsuranceProvider({this.uid, this.name});

  InsuranceProvider.fromJson(Map<String, dynamic> json) {
    uid = json['uid'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['uid'] = this.uid;
    data['name'] = this.name;
    return data;
  }
}

class VisitAddress {
  String city;
  double lat;
  double lon;
  String state;
  String stateLong;
  String street;
  String zip;
  String street2;

  VisitAddress(
      {this.city,
        this.lat,
        this.lon,
        this.state,
        this.stateLong,
        this.street,
        this.zip,
        this.street2});

  VisitAddress.fromJson(Map<String, dynamic> json) {
    city = json['city'];
    lat = json['lat'];
    lon = json['lon'];
    state = json['state'];
    stateLong = json['state_long'];
    street = json['street'];
    zip = json['zip'];
    street2 = json['street2'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['city'] = this.city;
    data['lat'] = this.lat;
    data['lon'] = this.lon;
    data['state'] = this.state;
    data['state_long'] = this.stateLong;
    data['street'] = this.street;
    data['zip'] = this.zip;
    data['street2'] = this.street2;
    return data;
  }
}

class Phones {
  String number;
  String type;

  Phones({this.number, this.type});

  Phones.fromJson(Map<String, dynamic> json) {
    number = json['number'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['number'] = this.number;
    data['type'] = this.type;
    return data;
  }
}

class Languages {
  String name;
  String code;

  Languages({this.name, this.code});

  Languages.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['code'] = this.code;
    return data;
  }
}

class Media {
  String uid;
  String status;
  String url;
  List<String> tags;
  Versions versions;

  Media({this.uid, this.status, this.url, this.tags, this.versions});

  Media.fromJson(Map<String, dynamic> json) {
    uid = json['uid'];
    status = json['status'];
    url = json['url'];
    tags = json['tags'].cast<String>();
    versions = json['versions'] != null
        ? new Versions.fromJson(json['versions'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['uid'] = this.uid;
    data['status'] = this.status;
    data['url'] = this.url;
    data['tags'] = this.tags;
    if (this.versions != null) {
      data['versions'] = this.versions.toJson();
    }
    return data;
  }
}

class Versions {
  String small;
  String medium;
  String large;
  String hero;

  Versions({this.small, this.medium, this.large, this.hero});

  Versions.fromJson(Map<String, dynamic> json) {
    small = json['small'];
    medium = json['medium'];
    large = json['large'];
    hero = json['hero'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['small'] = this.small;
    data['medium'] = this.medium;
    data['large'] = this.large;
    data['hero'] = this.hero;
    return data;
  }
}

class Educations {
  String school;
  String degree;
  String graduationYear;

  Educations({this.school, this.degree, this.graduationYear});

  Educations.fromJson(Map<String, dynamic> json) {
    school = json['school'];
    degree = json['degree'];
    graduationYear = json['graduation_year'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['school'] = this.school;
    data['degree'] = this.degree;
    data['graduation_year'] = this.graduationYear;
    return data;
  }
}

class Profile {
  String firstName;
  String middleName;
  String lastName;
  String slug;
  String title;
  String imageUrl;
  String gender;
  List<Languages> languages;
  String bio;

  Profile(
      {this.firstName,
        this.middleName,
        this.lastName,
        this.slug,
        this.title,
        this.imageUrl,
        this.gender,
        this.languages,
        this.bio});

  Profile.fromJson(Map<String, dynamic> json) {
    firstName = json['first_name'];
    middleName = json['middle_name'];
    lastName = json['last_name'];
    slug = json['slug'];
    title = json['title'];
    imageUrl = json['image_url'];
    gender = json['gender'];
    if (json['languages'] != null) {
      languages = new List<Languages>();
      json['languages'].forEach((v) {
        languages.add(new Languages.fromJson(v));
      });
    }
    bio = json['bio'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['first_name'] = this.firstName;
    data['middle_name'] = this.middleName;
    data['last_name'] = this.lastName;
    data['slug'] = this.slug;
    data['title'] = this.title;
    data['image_url'] = this.imageUrl;
    data['gender'] = this.gender;
    if (this.languages != null) {
      data['languages'] = this.languages.map((v) => v.toJson()).toList();
    }
    data['bio'] = this.bio;
    return data;
  }
}

class Ratings {
  bool active;
  String provider;
  String providerUid;
  String providerUrl;
  double rating;
  int reviewCount;
  String imageUrlSmall;
  String imageUrlSmall2x;
  String imageUrlLarge;
  String imageUrlLarge2x;

  Ratings(
      {this.active,
        this.provider,
        this.providerUid,
        this.providerUrl,
        this.rating,
        this.reviewCount,
        this.imageUrlSmall,
        this.imageUrlSmall2x,
        this.imageUrlLarge,
        this.imageUrlLarge2x});

  Ratings.fromJson(Map<String, dynamic> json) {
    active = json['active'];
    provider = json['provider'];
    providerUid = json['provider_uid'];
    providerUrl = json['provider_url'];
   // rating = json['rating'];
    reviewCount = json['review_count'];
    imageUrlSmall = json['image_url_small'];
    imageUrlSmall2x = json['image_url_small_2x'];
    imageUrlLarge = json['image_url_large'];
    imageUrlLarge2x = json['image_url_large_2x'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['active'] = this.active;
    data['provider'] = this.provider;
    data['provider_uid'] = this.providerUid;
    data['provider_url'] = this.providerUrl;
    data['rating'] = this.rating;
    data['review_count'] = this.reviewCount;
    data['image_url_small'] = this.imageUrlSmall;
    data['image_url_small_2x'] = this.imageUrlSmall2x;
    data['image_url_large'] = this.imageUrlLarge;
    data['image_url_large_2x'] = this.imageUrlLarge2x;
    return data;
  }
}

class Specialties {
  String uid;
  String name;
  String description;
  String category;
  String actor;
  String actors;

  Specialties(
      {this.uid,
        this.name,
        this.description,
        this.category,
        this.actor,
        this.actors});

  Specialties.fromJson(Map<String, dynamic> json) {
    uid = json['uid'];
    name = json['name'];
    description = json['description'];
    category = json['category'];
    actor = json['actor'];
    actors = json['actors'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['uid'] = this.uid;
    data['name'] = this.name;
    data['description'] = this.description;
    data['category'] = this.category;
    data['actor'] = this.actor;
    data['actors'] = this.actors;
    return data;
  }
}

class Licenses {
  String state;
  String number;
  String endDate;

  Licenses({this.state, this.number, this.endDate});

  Licenses.fromJson(Map<String, dynamic> json) {
    state = json['state'];
    number = json['number'];
    endDate = json['end_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['state'] = this.state;
    data['number'] = this.number;
    data['end_date'] = this.endDate;
    return data;
  }
}
