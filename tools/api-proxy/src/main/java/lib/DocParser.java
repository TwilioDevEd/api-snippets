package lib;

import java.io.File;
import java.io.IOException;
import java.nio.charset.Charset;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;

import org.apache.commons.io.FileUtils;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

public class DocParser {
  private Collection<File> fileCollection;
  private ArrayList<ResourceModel> resourceList;

  public DocParser(File basePath) {
    fileCollection = FileUtils.listFiles(basePath, null, true);
    populateResourceList();
  }

  public ArrayList getResourceList() {
    return this.resourceList;
  }

  public void populateResourceList() {
    this.resourceList = new ArrayList<>();
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
        HashMap<String, Object> resource = getResourceProperties(keyString, apiJson);

        resources.put((String) resource.get(ResourceParser.RESOURCE_NAME), resource);
      }
      resourceList.add(new ResourceModel(file.toString(), resources));
    }
  }

  private HashMap<String, Object> getResourceProperties(String key, JSONObject apiJson) {
    JSONArray resourceArray = (JSONArray) apiJson.get(key);
    ResourceParser resourceParser = new ResourceParser(key, resourceArray);

    return resourceParser.getResourceProperties();
  }
}
