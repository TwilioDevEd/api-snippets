HttpRequest request = HttpRequest.newBuilder()
    .uri(URI.create("https://api-sbox.dnlsrv.com/cigateway/id/v1/phoneIdResult"))
    .header("Authorization", "y5jBqXWLzEF4OgK61EbJ4jbEesmxE5No")
    .header("Content-Type", "application/json")
    .header("Accept", "application/json")
    .header("RequestTime", "2022-08-01T09:33:43+00:00")
    .method("POST", HttpRequest.BodyPublishers.ofString("{\"merchantId\":\"02200013919FB4\",\"subMerchantId\":\"00DF00000016\",\"correlationId\":\"984681AFDB698C67\",\"associationKey\":\"244464DFCB537E56\",\"match\":{\"consumerMdn\":\"+14085040458\"}}"))
    .build();
HttpResponse<String> response = HttpClient.newHttpClient().send(request, HttpResponse.BodyHandlers.ofString());
System.out.println(response.body());
