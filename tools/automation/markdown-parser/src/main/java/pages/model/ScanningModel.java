package pages.model;

import javax.xml.bind.annotation.XmlRootElement;
import java.util.List;

/**
 * Created by ehernandez on 02/05/16.
 */
@XmlRootElement
public class ScanningModel
{
    private String markDownFolderPath;

    private List<LanguageModel> languages;

    private List<PageModel> pages;
}
