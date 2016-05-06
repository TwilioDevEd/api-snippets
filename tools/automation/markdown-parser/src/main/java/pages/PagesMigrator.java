package pages;

import common.Utils;
import errorpages.ErrorModel;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.firefox.FirefoxDriver;

import java.io.File;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import static java.util.concurrent.TimeUnit.SECONDS;

/**
 * Created by ehernandez on 28/04/16.
 */
public class PagesMigrator implements Runnable {

    private WebDriver driver;

    private final String LOGFILE_PATH = System.getProperty("user.home") + File.separator + "error-files-log.json";

    private final String META_SCAN_PATH = System.getProperty("user.home") + File.separator + "scan-md.json";

    private final String CMS_BASEURL = "https://www.twilio.com/docs/admin/pages/492/edit/";

    private final String ADD_NEW_PAGE = "https://www.twilio.com/docs/admin/pages/add/api_reference/apireferencepage/492/";

    private final Map<String, Map> fileConfig;

    private final Map<String, Object> config;

    public PagesMigrator() throws ParsingFileException {
        System.setProperty("webdriver.firefox.profile", "default");
        driver = new FirefoxDriver();
        fileConfig = Utils.loadStatusData(LOGFILE_PATH);
        config = fileConfig.getOrDefault("progress", new HashMap<>());
    }

    public List<ErrorModel> readMdFiles() {
        String ERROR_FILES_PATH = Utils.getenv("ERROR_FILES_PATH").orElse("/home/ehernandez/twilio/markdown/docs/api/errors");
        if (ERROR_FILES_PATH == null) {
            System.err.println("There's no variable ERROR_FILES_PATH in the system");
        }
        File errsFolder = new File(ERROR_FILES_PATH);
        File[] errFiles = errsFolder.listFiles();
        List result = new LinkedList<>();
        for (int i = 0; i < errFiles.length; i++) {
            if (errFiles[i].isFile()) {
                try {
                    result.add(new ErrorModel(errFiles[i]));
                } catch (ParsingFileException e) {
                    System.err.println(e.getMessage());
                } catch (Throwable e) {
                    System.err.println("Unexpected error: " + e.getMessage());
                }
            }
        }
        return result;
    }

    @Override
    public void run() {
        driver.manage().timeouts().implicitlyWait(15, SECONDS); //Configuring Explicit wait
        readMdFiles().forEach(this::createErrorPage);
        saveConfig();
        driver.quit();
    }

    private void createErrorPage(ErrorModel errModel) {
        try {
            if (isErrorPageProcessed(errModel.getErrorId().toString())) {
                System.err.println(String.format("The page %s was already processed", errModel));
                return;
            }
            driver.navigate().to(ADD_NEW_PAGE);
            WebElement titleCtrl = driver.findElement(By.id("id_title"));
            if (titleCtrl == null) {
                System.err.println("[CREATION ERROR] Didn't found the form for creating the error page");
                return;
            }
            System.out.println(String.format("Processing %s:", errModel));
            titleCtrl.click();
            titleCtrl.sendKeys(errModel.getTitle());
            WebElement newBodyMarkdownBtn = driver.findElement(By.cssSelector(".stream-menu-inner .action-add-block-markdown"));
            if (newBodyMarkdownBtn == null) {
                System.err.println("[CREATION ERROR] It seems there are no new Button for creating a Markdown for " + errModel);
                return;
            }
            newBodyMarkdownBtn.click();
            WebElement bodyTxtAreaCtrl = driver.findElement(By.id("body-0-value"));
            if (bodyTxtAreaCtrl == null) {
                System.err.println("[CREATION ERROR] Couldnt access to the body textarea for  " + errModel);
                return;
            }
            bodyTxtAreaCtrl.click();
            bodyTxtAreaCtrl.sendKeys(errModel.getBody());
            driver.findElement(By.cssSelector(".tab-nav a[href=\"#promote\"]")).click();
            WebElement slugCtrl = driver.findElement(By.id("id_slug"));
            if (slugCtrl == null) {
                System.err.println("[CREATION ERROR] Couldnt access to the slug input text for " + errModel);
                return;
            }
            slugCtrl.click();
            slugCtrl.clear();
            slugCtrl.sendKeys(errModel.getUrlTag());
            driver.findElement(By.cssSelector(".dropdown-toggle.icon.icon-arrow-up")).click();
            WebElement publishBtn = driver.findElement(By.cssSelector("button[name=action-publish].button-longrunning"));
            if (publishBtn == null) {
                System.err.println(String.format("[CREATION ERROR] Couldnt publish %s because the publish button couldnt be found"));
                return;
            }
            publishBtn.click();
            setErrorPageProcessed(errModel.getErrorId().toString(), true, "Done!");
        } catch (Exception err) {
            setErrorPageProcessed(errModel.getErrorId().toString(), false, err.getMessage());
        }
    }

    private boolean isErrorPageProcessed(String fileId) {
        Map<String, Object> o = (Map<String, Object>) config.get(fileId);
        return (o == null) ? false : (boolean) o.getOrDefault("done", false);
    }

    private void setErrorPageProcessed(String fileId, boolean isProcessed, String message) {
        Map<String, Object> errorConfig = (Map<String, Object>) config.getOrDefault(fileId, new HashMap<>());
        errorConfig.put("done", isProcessed);
        errorConfig.put("msg", message);
        config.put(fileId, errorConfig);
    }

    private void saveConfig() {
        try {
            Utils.saveStatusData(fileConfig, new File(LOGFILE_PATH));
        } catch (ParsingFileException e) {
            System.err.println(e.getMessage());
        }
    }

}
