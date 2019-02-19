/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pages;

import java.io.File;

/**
 * Who gonna be notified of the wanted files
 * @author ehernandez
 */
public interface PageScannerListener {
    
    /**
     * When a wanted file was found
     * @param pageFound 
     */
    public void onPageFound(MarkdownPageModel pageFound);
    
}
