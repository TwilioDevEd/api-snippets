package errorpages;

import javafx.util.Pair;

import java.io.File;
import common.Utils;
import pages.ParsingFileException;

import java.nio.charset.StandardCharsets;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * Created by ehernandez on 28/04/16.
 */
public class ErrorModel {

    private final Integer errorId;

    private final String title;

    private final String body;

    private final String urlTag;

    private static final Pattern FILE_PATTERN = Pattern.compile("(.+?)\\.[md]+$");

    private static final Pattern TITLE_PATTERN = Pattern.compile("[\\# \\\\w+ \\- ][0-9]{4,6}");

    public ErrorModel(File errFile) throws ParsingFileException {
        Matcher m = FILE_PATTERN.matcher(errFile.getName());
        if (m.find()) {
            errorId = Integer.valueOf(m.group(1));
            if(errorId == null)
            {
                throw new ParsingFileException(errFile + " has not the right format");
            }
        } else{
            throw new ParsingFileException(errFile + " Is not an error file");
        }
        String content;
        try{
            content = Utils.readFile(errFile.getPath(), StandardCharsets.UTF_8);
        }catch(Exception ex)
        {
            throw new ParsingFileException(String.format("Error while reading file '%s': %s", errFile.getName(), ex.getMessage()));
        }
        //Parseando contenido
        Pair<String, String> split = Utils.extractFirstLineFromString(content);
        m = TITLE_PATTERN.matcher(split.getKey());
        Integer errNumberFound = null;
        if (m.find())
        {
            errNumberFound = Integer.valueOf(m.group(0).trim());
        }
        if(!errNumberFound.equals(errorId))
        {
            throw new ParsingFileException(String.format("https://github.com/twilio/markdown/blob/master/docs/api/errors/%s -- has the content of  --> %s", errFile.getName(), split.getKey()));
        }
        title = Utils.removeMarkdown(split.getKey());
        body = Utils.formatMarkdownContent(split.getValue());
        urlTag = errorId.toString();
    }

    public String getBody() {
        return body;
    }

    public static Pattern getFilePattern() {
        return FILE_PATTERN;
    }

    public Integer getErrorId() {
        return errorId;
    }

    public String getUrlTag()
    {
        return errorId.toString();
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
