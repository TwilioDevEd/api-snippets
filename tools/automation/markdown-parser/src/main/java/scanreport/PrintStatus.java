/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package scanreport;

/**
 *
 * @author ehernandez
 */
public enum PrintStatus {
    
    ALL, ONLYCHANGES;
    
    /**
     * Returns a printType base on a specified parameters
     * @param param
     * @return 
     */
    public static PrintStatus fromParam(String param)
    {
        switch(param)
        {
            case "--only-changes":
            case "--onlychanges":
            case "onlychanges":
                return ONLYCHANGES;
            default:
                return ALL;
        }
    }
    
}
