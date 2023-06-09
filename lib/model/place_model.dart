import 'dart:ffi';

class PlaceModel{
  String? image, name, branch,color, placeId,category;
  double? lat,lng;
  PlaceModel({required this.image,required this.name,required this.branch,required this.color,required this.placeId,required this.category, required this.lat, required this.lng});

  PlaceModel.fromJson(Map<dynamic,dynamic> map){
    if(map==null){
      return ;
    }
    image=map['image'];
    name=map['name'];
    branch=map['branch'];
    color=map['color'];
    placeId= map['placeId'];
    category=map['category'];
    lat= double.tryParse(map["lat"].toString());
    lng= double.tryParse(map["lng"].toString());
  }

  toJson(){
    return{
      'image':image,
      'name':name,
      'branch':branch,
      'color':color,
      'category':category,
      'lat':lat as double,
      'lng':lng as double,
      'placeId': placeId,
    };
  }
}