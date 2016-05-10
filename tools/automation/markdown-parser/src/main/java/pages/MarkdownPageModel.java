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

    private final File baseRepositoryFolder;

    private final File file;

    private final String remoteUrl;

    private final String name;

    public MarkdownPageModel(String remoteServerUrl, File baseRepositoryFolder, File file) {
        this.remoteServerUrl = remoteServerUrl;
        this.baseRepositoryFolder = baseRepositoryFolder;
        this.file = file;
        String relativePath = Utils.relativePath(baseRepositoryFolder.getAbsolutePath(), file.getAbsolutePath());
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

    public File getBaseRepositoryFolder() {
        return baseRepositoryFolder;
    }

    public String getName() {
        return name;
    }
}
