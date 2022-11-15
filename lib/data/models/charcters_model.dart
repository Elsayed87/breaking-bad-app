

class CharactersModel{
  late int char_id;
  late String name;
   late String birthday ;
    late String img;
     late String status;
      late String nickname;
       late String portrayed ;
        late String category;
        late List<dynamic> occupation;
          late List<dynamic> appearance;
            late List<dynamic> better_call_saul_appearance;
            CharactersModel.fromJson(json){
              char_id=json['char_id'];
              name=json['name'];
              birthday=json['birthday'];
              img=json['img']??'no image loaded';
              status=json['status'];
              nickname=json['nickname'];
              portrayed=json["portrayed"];
              category=json['category'];
              occupation=json['occupation'];
              appearance=json['appearance'];
              better_call_saul_appearance=json['better_call_saul_appearance'];

            }


}


// {
// "char_id": 1,
// "name": "Walter White",
// "birthday": "09-07-1958",
// "occupation": [
// "High School Chemistry Teacher",
// "Meth King Pin"
// ],
// "img": "https://images.amcnetworks.com/amc.com/wp-content/uploads/2015/04/cast_bb_700x1000_walter-white-lg.jpg",
// "status": "Presumed dead",
// "nickname": "Heisenberg",
// "appearance": [
// 1,
// 2,
// 3,
// 4,
// 5
// ],
// "portrayed": "Bryan Cranston",
// "category": "Breaking Bad",
// "better_call_saul_appearance": []
// }