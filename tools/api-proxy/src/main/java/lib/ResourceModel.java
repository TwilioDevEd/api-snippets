package lib;

import java.util.HashMap;

public class ResourceModel {
  private String resourcePath;
  private HashMap<String, HashMap<String, Object>> resourceTransactions;

  public ResourceModel(String resourcePath,
      HashMap<String, HashMap<String, Object>> resourceTransactions) {
    this.resourcePath = resourcePath;
    this.resourceTransactions = resourceTransactions;
  }

  public String getResourcePath() {
    return resourcePath;
  }

  public HashMap<String, HashMap<String, Object>> getResourceTransactions() {
    return resourceTransactions;
  }

  public String toString() {
    return this.resourcePath + ": " + this.resourceTransactions;
  }
}
