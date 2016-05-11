package scanreport;

import common.Utils;

import java.io.File;
import java.io.IOException;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import pages.MarkdownPageModel;
import pages.PagesScanner;
import pages.ParsingFileException;

/**
 * Task for locating missing pages in the repository
 *
 * @author ehernandez
 */
public class SearchForMissingPages {

    private static final int HTTP_OK = 200;

    private static final String LOGFILE_PATH = System.getProperty("user.home") + File.separator + "missing-pages-log.json";

    private static Map<String, Map> fileConfig;

    private static Map<String, Object> config;

    private static final String BASE_REPOSITORY_URL = "http://twilio-docs-prod.us-east-1.elasticbeanstalk.com";

    private static final List<String> IGNORED_FILES = Arrays.asList("readme");

    private static PrintStatus printStatus;

    public static void main(String[] args) {
        try {
            fileConfig = Utils.loadStatusData(LOGFILE_PATH);
            config = fileConfig.getOrDefault("progress", new HashMap<>());
            String API_SNIPPETS_PATH;
            if (args.length == 0) {
                API_SNIPPETS_PATH = Utils.getenv("API_SNIPPETS_PATH").orElse("/home/ehernandez/twilio/markdown");
            } else {
                API_SNIPPETS_PATH = args[0];
            }
            printStatus = PrintStatus.fromParam((args.length > 0) ? args[1] : "");
            PagesScanner scanner = new PagesScanner(SearchForMissingPages::checkPageStatus, BASE_REPOSITORY_URL, API_SNIPPETS_PATH, new String[]{"md"});
            scanner.test("/docs/api");
            scanner.test("/docs/quickstart");
            Utils.saveStatusData(fileConfig, new File(LOGFILE_PATH));
        } catch (ParsingFileException ex) {
            System.err.println("Error parsing " + LOGFILE_PATH);
        }
    }

    /**
     * Check the status of some page and prints the result
     *
     * @param foundMarkdown
     */
    public static void checkPageStatus(MarkdownPageModel foundMarkdown) {
        try {
            if (getPageStatus(foundMarkdown.getRelativePath()) == HTTP_OK) {
                return;  //Already parsed
            }
            URL url = new URL(foundMarkdown.getRemoteUrl());
            HttpURLConnection connection = (HttpURLConnection) url.openConnection();
            connection.setRequestMethod("GET");
            connection.connect();
            int statusCode = connection.getResponseCode();
            String msg = printLog(foundMarkdown, statusCode);
            if (!msg.isEmpty()) {
                setPageStatus(foundMarkdown.getRelativePath(), statusCode, msg);
            }
        } catch (MalformedURLException ex) {
            System.err.println(String.format("[FAILED]The url \"%s\" is not valid: %s", foundMarkdown.getRemoteUrl(), ex.getMessage()));
        } catch (IOException ex) {
            System.err.println(String.format("[FAILED]The url \"%s\" couldnt been catched: %s", foundMarkdown.getRemoteUrl(), ex.getMessage()));
        }
    }

    private static int getPageStatus(String filePath) {
        Map<String, Object> o = (Map<String, Object>) config.get(filePath);
        return (o == null) ? 0 : ((Double)o.getOrDefault("status", 0d)).intValue();
    }

    private static String printLog(MarkdownPageModel foundMarkdown, int statusCode) {
        final String msg;
        switch (printStatus) {
            case ONLYCHANGES:
                Map<String, Object> pageConfig = (Map<String, Object>) config.get(foundMarkdown.getRelativePath());
                if (pageConfig == null) {
                    msg = String.format("[OK:%d] %s was sucessfully detected in the server in %s", HTTP_OK, foundMarkdown.getRelativePath(), foundMarkdown.getRemoteUrl());
                } else if (getPageStatus(foundMarkdown.getRelativePath()) != HTTP_OK) {
                    switch (statusCode) {
                        case HTTP_OK:
                            msg = String.format("[OK:%d] %s  was successfully fixed in %s", statusCode, foundMarkdown.getRelativePath(), foundMarkdown.getRemoteUrl());
                            break;
                        default:
                            msg = String.format("[FAILURE:%d] %s is still missing in the server in %s", statusCode, foundMarkdown.getRelativePath(), foundMarkdown.getRemoteUrl());
                    }
                } else {
                    msg = "";   //Doesnt print anything
                }
                break;
            default:
                if (statusCode == HTTP_OK) {
                    msg = String.format("[OK:%d] %s was sucessfully detected in the server in %s", statusCode, foundMarkdown.getFile(), foundMarkdown.getRemoteUrl());
                } else {
                    msg = (String.format("[FAILED:%d] %s was not detected in the server in %s", statusCode, foundMarkdown.getFile(), foundMarkdown.getRemoteUrl()));
                }
        }
        if (!msg.isEmpty()) {
            if (statusCode == HTTP_OK) {
                System.out.println(msg);
            } else {
                System.err.println(msg);
            }
        }
        return msg;
    }

    private static void setPageStatus(String filePath, int status, String message) {
        Map<String, Object> pageConfig = (Map<String, Object>) config.getOrDefault(filePath, new HashMap<>());
        pageConfig.put("status", status);
        pageConfig.put("msg", message);
        config.put(filePath, pageConfig);
    }
}
