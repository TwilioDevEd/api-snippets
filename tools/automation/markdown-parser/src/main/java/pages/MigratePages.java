package pages;

import errorpages.ErrorsPageMigrator;

/**
 * Created by ehernandez on 02/05/16.
 */
public class MigratePages {

    public static void main(String[] args) {
        System.out.println("Importing Pages...");
        PagesMigrator migrator = null;
        try {
            migrator = new PagesMigrator();
            migrator.run();
        } catch (ParsingFileException ex) {
            System.err.println(ex.getMessage());
        }
    }
}
