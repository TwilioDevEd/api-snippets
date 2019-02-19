package common;

import com.google.gson.Gson;
import pages.ParsingFileException;
import javafx.util.Pair;

import java.io.*;
import java.nio.charset.Charset;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.HashMap;
import java.util.Map;
import java.util.Optional;

/**
 * Created by ehernandez on 29/04/16.
 */
public class Utils {

    private Utils()
    {}

    public static Pair<String, String> extractFirstLineFromString(String content)
    {
        int eolIndex = content.indexOf(System.getProperty("line.separator"));
        String result = content.substring(0, eolIndex);
        content = content.substring(eolIndex + 1);
        return new Pair<>(result, content);
    }

    public static final String readFile(String path, Charset encoding)
            throws IOException
    {
        byte[] encoded = Files.readAllBytes(Paths.get(path));
        return new String(encoded, encoding);
    }

    public static final Optional<String> getenv(String varKey)
    {
        return Optional.ofNullable(System.getenv(varKey));
    }

    public static final String formatMarkdownContent(String content)
    {
        return content.trim();
    }

    public static String removeMarkdown(String key)
    {
        return key.replace("#","").trim();
    }

    public static void saveStatusData(Map<String, Map> data, File jsonFile) throws ParsingFileException {

        try (BufferedWriter bw = new BufferedWriter(new FileWriter(jsonFile))) {
            bw.write((new Gson()).toJson(data));
            bw.close();
        }catch (FileNotFoundException ex) {
            throw new ParsingFileException(String.format("%s was not found for logging the scanning: %s", jsonFile.getAbsoluteFile(), ex.getMessage()));
        }catch(IOException ex)
        {
            throw new ParsingFileException(String.format("Error while reading file %s: %s", jsonFile.getAbsoluteFile(), ex.getMessage()));
        }
    }

    public static Map<String, Map> loadStatusData(String jsonFilePath) throws ParsingFileException
    {
        HashMap<String, String> result = new HashMap<>();
        String jsonDataStr = null;
        try {
            jsonDataStr = Optional.ofNullable(readFile(jsonFilePath, StandardCharsets.UTF_8)).orElse("{\"progress\":{}}");
        } catch (IOException ex) {throw new ParsingFileException(String.format("Error while loading json file %s for configuration: %s", jsonFilePath, ex.getMessage()));
        }
        return (new Gson()).fromJson(jsonDataStr, Map.class);
    }
    
    public static String relativePath(String basePath, String subPath)
    { 
       return new File(basePath).toURI().relativize(new File(subPath).toURI()).getPath();
    }
    
    public static String removeSuffix(String text, String suffix)
    {
        return (text!=null && text.lastIndexOf(suffix) > 1) ? text.substring(0, text.lastIndexOf(suffix)) : text;
    }

}
