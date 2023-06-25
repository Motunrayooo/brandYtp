import '../model/product_model.dart';
import 'package:flutter/services.dart' as load;

//this service file is an helper, it helping us to access the data from json


class Helper{
  Future<List <Product>> getTowels() async {
    //rootBundle.loadString  is used because the json is locally embedded inside the asset folder
    //rootBundle.loadString is always a string
    //roadBundle contains the resources that were packaged with the application when it was built, to add a resources to the road bundle for the application it needs to be added to the asset folder and be declared in the pubspec.yaml
    //loadString it retrieves a string from the asset bundle. which means passing the location of the data to be retrieve

    //what is the function of the load?
    final  towelData = await load.rootBundle.loadString('assets/json/towel.json');
    final towelList = productFromJson(towelData);
    return towelList;

  }

 Future<List<Product>> getBathrobes()async{
    final bathrobeData = await load.rootBundle.loadString('assets/json/bathrobe.json');
    final bathrobeList = productFromJson(bathrobeData);
    return bathrobeList;
 }

 Future<List<Product>> getBeddings()async{
    final beddingsData = await load.rootBundle.loadString('assets/json/beddings.json');
    final beddingsList = productFromJson(beddingsData);
    return beddingsList;
 }
 Future<Product> getSingleTowel(String id)async{
    final towelData = await load.rootBundle.loadString('assets/json/towel.json');
    final towelList = productFromJson(towelData);
    //the firstWhere value how did it come about, like can the towel that is passed can it be name anything? if No!, how did the towel passed in the firstWhere come about
    final singleTowel = towelList.firstWhere((towel) => towel.id == id);
    return singleTowel;
 }
  Future<Product> getSingleBathrobe(String id)async{
    final bathrobeData = await load.rootBundle.loadString('assets/json/bathrobe.json');
    final bathrobeList = productFromJson(bathrobeData);
    final singleBathrobe = bathrobeList.firstWhere((bathrobe) => bathrobe.id == id);
    return singleBathrobe;
  }
  Future<Product> getSingleBeddings(String id)async{

    final beddingsData = await load.rootBundle.loadString('assets/json/beddings.json');
    final beddingsList = productFromJson(beddingsData);
    final singleBeddings = beddingsList.firstWhere((beddings) => beddings.id == id);
    return singleBeddings;

  }
}