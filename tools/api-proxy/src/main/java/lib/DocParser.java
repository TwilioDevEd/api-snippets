package lib;

import java.io.File;
import java.io.IOException;
import java.nio.charset.Charset;
import java.util.Collection;
import java.util.HashMap;

import org.apache.commons.io.FileUtils;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

public class DocParser {
  private Collection<File> fileCollection;
  private Collection<ResourceModel> endpointCollection;

  public DocParser(File basePath) {
    fileCollection = FileUtils.listFiles(basePath, null, true);
    populateEndPointCollection();
  }

  public Collection getEndpointCollection() {
    return this.endpointCollection;
  }

  public void populateEndPointCollection() {
    for (File file : fileCollection) {
      HashMap<String, HashMap<String, Object>> resources = new HashMap<>();
      String fileContent = "";
      JSONObject apiJson = new JSONObject();
      JSONParser parser = new JSONParser();

      try {
        fileContent = FileUtils.readFileToString(file, Charset.defaultCharset());
        apiJson = (JSONObject) parser.parse(fileContent);
      } catch (IOException e) {
        e.printStackTrace();
        System.out.println("Error reading: " + file.toString());
      } catch (ParseException e) {
        System.out.println("Unable to parse json file: " + file.toString());
        e.printStackTrace();
      }


      for (Object key : apiJson.keySet()) {
        String keyString = (String) key;
        JSONObject resource = (JSONObject) apiJson.get(keyString);
        resources.put(keyString, getResourceMethod(keyString, resource));
      }
      break;
    }

  }

  private HashMap<String, Object> getResourceMethod(String key, JSONObject apiJson) {
    switch ((String) key) {
      case "read":
        break;
      case "fetch":
        break;
      case "create":
        break;
      case "update":
        break;
      case "delete":
        break;
      default:
        break;

    }
    HashMap<String, Object> resource = new HashMap<>();
    return resource;
  }
}
