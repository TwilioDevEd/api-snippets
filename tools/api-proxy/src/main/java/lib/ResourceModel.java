package lib;

import java.util.HashMap;

public class ResourceModel {
  private String resourcePath;
  private HashMap<String, HashMap<String, Object>> resources;

  public ResourceModel(String resourcePath, HashMap<String, HashMap<String, Object>> resources) {
    this.resourcePath = resourcePath;
    this.resources = resources;
  }

  public String getResourcePath() {
    return resourcePath;
  }

  public void setResourcePath(String resourcePath) {
    this.resourcePath = resourcePath;
  }

  public HashMap<String, HashMap<String, Object>> getResources() {
    return resources;
  }

  public void setResources(HashMap<String, HashMap<String, Object>> resources) {
    this.resources = resources;
  }
}
