package pages;

import org.apache.commons.io.FileUtils;
import java.io.File;

/**
 * For scanning markdown files
 *
 * @author ehernandez
 */
public class PagesScanner{
    
    private final String baseFolderPath;
    
    private final String baseUrl;
    
    private final String[] extensions;
    
    private final PageScannerListener listener;

    public PagesScanner(PageScannerListener listener, String baseUrl, String baseFolderPath, String[] extensions) {
        this.baseFolderPath = baseFolderPath;
        this.listener = listener;
        this.baseUrl = baseUrl;
        this.extensions = extensions;
    }

    public void test(String rootFolderPath) {
        File rootFolder = new File(baseFolderPath + rootFolderPath);
        System.out.println("Scanning all markdowns located at " + rootFolder.getAbsolutePath());
        FileUtils.listFiles(rootFolder, extensions, true).stream().map(mdFile -> new MarkdownPageModel(baseUrl, baseFolderPath, mdFile)).forEach(listener::onPageFound);
    }

}
