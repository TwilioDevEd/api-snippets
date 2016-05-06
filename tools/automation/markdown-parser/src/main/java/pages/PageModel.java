package pages;

import common.Utils;
import javafx.util.Pair;

import java.io.File;
import java.nio.charset.StandardCharsets;

/**
 * Created by ehernandez on 28/04/16.
 */
public class PageModel {

    private final String title;

    private final String body;

    private final String urlTag;

    public PageModel(File pageFile) throws ParsingFileException {
        String content;
        try{
            content = Utils.readFile(pageFile.getPath(), StandardCharsets.UTF_8);
        }catch(Exception ex)
        {
            throw new ParsingFileException(String.format("Error while reading file '%s': %s", pageFile.getName(), ex.getMessage()));
        }
        //Parseando contenido
        Pair<String, String> split = Utils.extractFirstLineFromString(content);
        title = Utils.removeMarkdown(split.getKey());
        body = Utils.formatMarkdownContent(split.getValue());
        urlTag = "urlTag";
    }

    public String getBody() {
        return body;
    }


    public String getUrlTag()
    {
        return urlTag;
    }

    public String getTitle()
    {
        return title;
    }

    @Override
    public String toString() {
        return getTitle();
    }
}
