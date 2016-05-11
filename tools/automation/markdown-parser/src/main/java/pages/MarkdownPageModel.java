package pages;

import common.Utils;
import java.io.File;
import org.apache.commons.io.FilenameUtils;

/**
 * Describes some markdown file and relates its local file to its remote
 * location
 *
 * @author ehernandez
 */
public class MarkdownPageModel {

    private final String remoteServerUrl;

    private final String baseRepoPath;

    private final File file;

    private final String remoteUrl;

    private final String name;
    
    private final String relativePath;

    public MarkdownPageModel(String remoteServerUrl, String baseRepoPath, File file) {
        this.remoteServerUrl = remoteServerUrl;
        this.baseRepoPath = baseRepoPath;
        this.file = file;
        relativePath = Utils.relativePath(baseRepoPath, file.getAbsolutePath());
        name = FilenameUtils.removeExtension(file.getName()).toLowerCase();
        String suffix = name.equals("index") ? File.separator + "index.md" : ".md";
        this.remoteUrl = remoteServerUrl + "/" + Utils.removeSuffix(relativePath, suffix).toLowerCase();
    }

    public String getRemoteServerUrl() {
        return remoteServerUrl;
    }

    public File getFile() {
        return file;
    }

    public String getRemoteUrl() {
        return remoteUrl;
    }

    public String getbaseRepoPath() {
        return baseRepoPath;
    }

    public String getName() {
        return name;
    }

    public String getRelativePath() {
        return relativePath;
    }
    
}
