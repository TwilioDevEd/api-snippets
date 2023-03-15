//Installation
//dotnet add package RestSharp

//Request
var client = new RestClient("https://api-sbox.dnlsrv.com/cigateway/id/v1/phoneIdResult");
var request = new RestRequest(Method.POST);
request.AddHeader("Authorization", "y5jBqXWLzEF4OgK61EbJ4jbEesmxE5No");
request.AddHeader("Content-Type", "application/json");
request.AddHeader("Accept", "application/json");
request.AddHeader("RequestTime", "2022-08-01T09:33:43+00:00");
request.AddParameter(
    "application/json",
    "{\"merchantId\":\"02200013919FB4\",\"subMerchantId\":\"00DF00000016\",\"correlationId\":\"984681AFDB698C67\",\"associationKey\":\"244464DFCB537E56\",\"match\":{\"consumerMdn\":\"+14085040458\"}}",
    ParameterType.RequestBody
);
IRestResponse response = client.Execute(request);
