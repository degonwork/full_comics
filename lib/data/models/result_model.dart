

class ResultModel {
  final int responseCode;
  final String reponseMessage;
  final dynamic responseData;
  ResultModel({required this.reponseMessage, required this.responseCode ,required this.responseData});
  factory ResultModel.fromJson(Map<String, dynamic> jsonMap){
    var list = jsonMap['responseData'] as List;
    final data = ResultModel(reponseMessage: jsonMap['responseMessage'], responseCode: jsonMap['responeCode'], responseData: list);
    return data;
  }
}