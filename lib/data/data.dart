import 'package:chess_shop/model/explore_model.dart';
import 'package:chess_shop/model/item_model.dart';

List<exploreModel> getExploreData() {
  List<exploreModel> exploredata = new List();
  exploreModel exModel = new exploreModel();
  //1
  exModel.productName = "Chess Board";
  exModel.price = "\$10";
  exModel.size = "Fixed";
  exModel.color = "BlueWhite";
  exModel.imgURL = "images/chess.jpg";
  exploredata.add(exModel);
  exModel = new exploreModel();

  //2
  exModel.productName = "Chess Clock1";
  exModel.price = "\$28";
  exModel.size = "Medium";
  exModel.color = "Silver";
  exModel.imgURL = "images/chessclock1.png";
  exploredata.add(exModel);
  exModel = new exploreModel();

  //3
  exModel.productName = "Magnetic Chess Board";
  exModel.price = "\$12";
  exModel.size = "Medium";
  exModel.color = "BlackWhite";
  exModel.imgURL = "images/magneticchess.png";
  exploredata.add(exModel);
  exModel = new exploreModel();

  //4
  exModel.productName = "Chess Clock2";
  exModel.price = "\$30";
  exModel.size = "Medium";
  exModel.color = "Brown";
  exModel.imgURL = "images/digiclock.png";
  exploredata.add(exModel);
  exModel = new exploreModel();

  //5
  exModel.productName = "Chess Bag";
  exModel.price = "\$5";
  exModel.size = "Medium";
  exModel.color = "Black";
  exModel.imgURL = "images/bag.png";
  exploredata.add(exModel);
  exModel = new exploreModel();

  return exploredata;
}

List<itemModel> getItemData() {
  List<itemModel> itemdata = new List();
  itemModel itModel = new itemModel();
  //1
  itModel.price = "\$20";
  itModel.productName = "Rule Book";
  itModel.imgURL = "images/chessbook.jpg";
  itemdata.add(itModel);
  itModel = new itemModel();

  //2
  itModel.price = "\$28";
  itModel.productName = "Endgame Book";
  itModel.imgURL = "images/chessbook1.jpg";
  itemdata.add(itModel);
  itModel = new itemModel();

  //3
  itModel.price = "\$38";
  itModel.productName = "Ultimate Guide";
  itModel.imgURL = "images/chessbook2.png";
  itemdata.add(itModel);
  itModel = new itemModel();

  //4
  itModel.price = "\$18";
  itModel.productName = "Chess Book";
  itModel.imgURL = "images/chessbook3.png";
  itemdata.add(itModel);
  itModel = new itemModel();

  //5
  itModel.price = "\$22";
  itModel.productName = "Chess 101";
  itModel.imgURL = "images/chessbook4.jpg";
  itemdata.add(itModel);
  itModel = new itemModel();

  //6
  itModel.price = "\$30";
  itModel.productName = "ChessBase";
  itModel.imgURL = "images/chessbase.png";
  itemdata.add(itModel);
  itModel = new itemModel();

  //7
  itModel.price = "\$25";
  itModel.productName = "Fritz12";
  itModel.imgURL = "images/fritz.png";
  itemdata.add(itModel);
  itModel = new itemModel();

  return itemdata;
}
