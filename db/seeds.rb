#
# users, vendors, wellists, categories, care_types, care_sub_types
#

Wellist.delete_all
User.delete_all
Vendor.delete_all
Category.delete_all
CareType.delete_all
CareSubType.delete_all


# -----------------------
#    Category
# -----------------------
['Bronze', 'Silver', 'Gold', 'Platinum'].each do |s|
  Category.create!(name: s)
end

# -----------------------
#    CareType
# -----------------------
['Acute care', 'Polyclinic','Hospice','Adult daycare center','Online pharmacy','Sanatorium' ].each do |s|
  CareType.create!(name: s)
end

# -----------------------
#    CareSubType
# -----------------------
['OTC Oral Medicines', 'OTC Applications', 'OTC Products Devices', 'Nutraceuticals', 'Other' ].each do |s|
  CareSubType.create!(name: s)
end

# -----------------------
#    Users
# -----------------------
User.create!(fullname: 'John Henry',   email: 'jh@example.com', care_type_id: CareType.find_by( name: 'Acute care').id,      care_sub_type_id: CareSubType.find_by( name: 'OTC Oral Medicines').id )
User.create!(fullname: 'Mary Stevens', email: 'ms@example.com', care_type_id: CareType.find_by( name: 'Hospice').id,         care_sub_type_id: CareSubType.find_by( name: 'OTC Applications').id )
User.create!(fullname: 'Moe Howard',   email: 'mh@example.com', care_type_id: CareType.find_by( name: 'Polyclinic').id,      care_sub_type_id: CareSubType.find_by( name: 'OTC Products Devices').id )
User.create!(fullname: 'Larry Fine',   email: 'lf@example.com', care_type_id: CareType.find_by( name: 'Online pharmacy').id, care_sub_type_id: CareSubType.find_by( name: 'Nutraceuticals').id )
User.create!(fullname: 'Curly Howard', email: 'ch@example.com', care_type_id: CareType.find_by( name: 'Sanatorium').id,      care_sub_type_id: CareSubType.find_by( name: 'Other').id )


# -----------------------
#    Vendors
# -----------------------      
Vendor.create!( name: 'Synegratia',         category_id: Category.find_by( name: 'Gold').id,     care_type_id: CareType.find_by( name: 'Online pharmacy').id,      care_sub_type_id: CareSubType.find_by( name: 'Other').id,                address: '39 E. Fifth Circle ',  city: 'Dearborn', state: 'MI', zip: '12345', price_rating: 5 )
Vendor.create!( name: 'City Auto Plaza',    category_id: Category.find_by( name: 'Silver').id,   care_type_id: CareType.find_by( name: 'Sanatorium').id,           care_sub_type_id: CareSubType.find_by( name: 'Nutraceuticals').id,       address: '315 Glenholme St. ',   city: 'Herndon',  state: 'VA', zip: '34567', price_rating: 5 )
Vendor.create!( name: 'Beyond Performance', category_id: Category.find_by( name: 'Bronze').id,   care_type_id: CareType.find_by( name: 'Online pharmacy').id,      care_sub_type_id: CareSubType.find_by( name: 'OTC Products Devices').id, address: '7584 Oklahoma St. ',   city: 'Flushing', state: 'NY', zip: '23456', price_rating: 2 )
Vendor.create!( name: 'Bahia Mar Marine',   category_id: Category.find_by( name: 'Platinum').id, care_type_id: CareType.find_by( name: 'Adult daycare center').id, care_sub_type_id: CareSubType.find_by( name: 'OTC Products Devices').id, address: '20 Constitution St. ', city: 'Traverse', state: 'WI', zip: '12345', price_rating: 7)
Vendor.create!( name: 'Jacks Campers',      category_id: Category.find_by( name: 'Gold').id,     care_type_id: CareType.find_by( name: 'Hospice').id,              care_sub_type_id: CareSubType.find_by( name: 'OTC Applications').id,     address: '21 Somerset Avenue ',  city: 'Menasha',  state: 'CA', zip: '54952', price_rating: 6 )
Vendor.create!( name: 'Ed Bargy',           category_id: Category.find_by( name: 'Bronze').id,   care_type_id: CareType.find_by( name: 'Polyclinic').id,           care_sub_type_id: CareSubType.find_by( name: 'OTC Oral Medicines').id,   address: '60 Pearl Dr. ',        city: 'Glendora', state: 'NY', zip: '49684', price_rating: 9 )
Vendor.create!( name: 'NP Volkswagen',      category_id: Category.find_by( name: 'Silver').id,   care_type_id: CareType.find_by( name: 'Sanatorium').id,           care_sub_type_id: CareSubType.find_by( name: 'OTC Oral Medicines').id,   address: '447 Wayne St. ',       city: 'Hialeah',  state: 'CA', zip: '11354', price_rating: 9 )
Vendor.create!( name: 'Bales Motor CO',     category_id: Category.find_by( name: 'Platinum').id, care_type_id: CareType.find_by( name: 'Online pharmacy').id,      care_sub_type_id: CareSubType.find_by( name: 'Other').id,                address: '66 Alderwood Rd. ',    city: 'Jersey',   state: 'NJ', zip: '48124', price_rating: 1 )


# -----------------------
#    Wellists
# -----------------------
Wellist.create!( user_id: User.find_by( fullname: 'John Henry').id,  vendor_id: Vendor.find_by(name: 'Synegratia').id,       public_list: true, public_vendor: true )
Wellist.create!( user_id: User.find_by( fullname: 'John Henry').id,  vendor_id: Vendor.find_by(name: 'Bales Motor CO').id,   public_list: true, public_vendor: true )
Wellist.create!( user_id: User.find_by( fullname: 'John Henry').id,  vendor_id: Vendor.find_by(name: 'Bahia Mar Marine').id, public_list: true, public_vendor: true )
Wellist.create!( user_id: User.find_by( fullname: 'John Henry').id,  vendor_id: Vendor.find_by(name: 'City Auto Plaza').id,  public_list: true, public_vendor: true )


Wellist.create!( user_id: User.find_by( fullname: 'Mary Stevens').id,  vendor_id: Vendor.find_by(name: 'City Auto Plaza').id,    public_list: true, public_vendor: true )
Wellist.create!( user_id: User.find_by( fullname: 'Mary Stevens').id,  vendor_id: Vendor.find_by(name: 'Beyond Performance').id, public_list: true, public_vendor: true )
Wellist.create!( user_id: User.find_by( fullname: 'Mary Stevens').id,  vendor_id: Vendor.find_by(name: 'Jacks Campers').id,      public_list: true, public_vendor: true )
Wellist.create!( user_id: User.find_by( fullname: 'Mary Stevens').id,  vendor_id: Vendor.find_by(name: 'Ed Bargy').id,           public_list: true, public_vendor: true )


Wellist.create!( user_id: User.find_by( fullname: 'Moe Howard').id,  vendor_id: Vendor.find_by(name: 'Ed Bargy').id,           public_list: true, public_vendor: true )
Wellist.create!( user_id: User.find_by( fullname: 'Moe Howard').id,  vendor_id: Vendor.find_by(name: 'Beyond Performance').id, public_list: true, public_vendor: true )
Wellist.create!( user_id: User.find_by( fullname: 'Moe Howard').id,  vendor_id: Vendor.find_by(name: 'Synegratia').id,         public_list: true, public_vendor: true )


Wellist.create!( user_id: User.find_by( fullname: 'Larry Fine').id,  vendor_id: Vendor.find_by(name: 'Synegratia').id ,        public_list: true, public_vendor: true )
Wellist.create!( user_id: User.find_by( fullname: 'Larry Fine').id,  vendor_id: Vendor.find_by(name: 'City Auto Plaza').id,    public_list: true, public_vendor: true )
Wellist.create!( user_id: User.find_by( fullname: 'Larry Fine').id,  vendor_id: Vendor.find_by(name: 'Beyond Performance').id, public_list: true, public_vendor: true )
Wellist.create!( user_id: User.find_by( fullname: 'Larry Fine').id,  vendor_id: Vendor.find_by(name: 'Bahia Mar Marine').id,   public_list: true, public_vendor: true )
Wellist.create!( user_id: User.find_by( fullname: 'Larry Fine').id,  vendor_id: Vendor.find_by(name: 'NP Volkswagen').id,      public_list: true, public_vendor: true )


Wellist.create!( user_id: User.find_by( fullname: 'Curly Howard').id,  vendor_id: Vendor.find_by(name: 'Beyond Performance').id, public_list: true, public_vendor: true )
Wellist.create!( user_id: User.find_by( fullname: 'Curly Howard').id,  vendor_id: Vendor.find_by(name: 'NP Volkswagen').id,      public_list: true, public_vendor: true )
Wellist.create!( user_id: User.find_by( fullname: 'Curly Howard').id,  vendor_id: Vendor.find_by(name: 'Synegratia').id,         public_list: true, public_vendor: true )










