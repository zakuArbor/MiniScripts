package mangaToWebPage;

import java.io.File;
import java.io.FilenameFilter;

//Credit: http://alvinalexander.com/blog/post/java/how-implement-java-filefilter-list-files-directory
public class ImageFilter implements FilenameFilter {
	  private final String[] ImageFileExtensions = new String[] {"jpg", "png", "gif"};

	@Override
	public boolean accept(File file, String name) {
		for (String extension : ImageFileExtensions) {
	      if (file.toString().toLowerCase().endsWith(extension)) {
	        return true;
	      }
	    }
		System.out.println("failure: " + file.toString());
	    return false;
	}
}

