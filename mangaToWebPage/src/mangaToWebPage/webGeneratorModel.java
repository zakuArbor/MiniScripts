package mangaToWebPage;
import java.io.*;
import java.io.File;
import java.util.ArrayList;

import javax.swing.JFrame;
import javax.swing.JOptionPane;
import javax.swing.filechooser.FileNameExtensionFilter;

public class webGeneratorModel {
	private File target_directory;
	private ArrayList<File> chapter_files = new ArrayList<File>();
	
	public webGeneratorModel () {
		
	}
	
	public void createWebPage(View view) {
		this.target_directory = view.get_target_directory();
		
		File listDir[] = view.get_target_directory().listFiles();
		store_chapters(listDir); //gathers and stores all chapters into an array
		create_chapters(); //creates webpages for each chapter
		JOptionPane.showMessageDialog(new JFrame(), "Task Completed");
	}
	
	/**
	 * Stores all directory Files (Chapters) into an array List
	 * @param listDir 
	 * 			an array of Files from the target path (can be directory or not)
	 */
	public void store_chapters(File listDir[]) {
		if (target_directory != null) {
			for (int i = 0; i < listDir.length; i++) {
			    if (listDir[i].isDirectory()) {
			            chapter_files.add(listDir[i]);
			        }
			}
		}
	}
	
	/**
	 * Creates a webpage for each chapter
	 */
	public void create_chapters() {
		for (int i = 0; i < chapter_files.size(); i++) {
		
			String string_file = chapter_files.get(i).toString().substring(chapter_files.get(i).toString().lastIndexOf('/')+1);
			String html = "<html>\n<head><title>" + string_file + "</title></head>\n<body>\n";
			File[] picture_files = chapter_files.get(i).listFiles();
			html += pictures_to_html(picture_files, 0);
			html += "<br>";
			if (i != 0) { //if there is a previous chapter
				String  file_name = chapter_files.get(i-1).toString();
				file_name = file_name + "/" + file_name.substring(file_name.lastIndexOf('/') +1);
				html += "<a href = '" + file_name + ".html'><b>PREVIOUS</b>\t\t</a>";
			}
			if (i < chapter_files.size() -1 ) { //if there is a next chapter
				String  file_name = chapter_files.get(i+1).toString();	
				file_name = file_name + "/" + file_name.substring(file_name.lastIndexOf('/') +1);
				html += "<a href = '" + file_name + ".html'><b>NEXT</b></a>";
			}
			
			html += "</body>\n";
			html += "</html>\n";
			writeWebPage(html, string_file);
		}
	}
	
	public void writeWebPage(String html, String string_file) {
		try {
			FileWriter fileWriter = new FileWriter(target_directory + "/" + string_file+  "/" + string_file + ".html");
			BufferedWriter bufferedWriter = new BufferedWriter(fileWriter);
			bufferedWriter.write(html);
			bufferedWriter.close();
		}
		catch(Exception e) {
			System.out.println(e);
		}
	}
	
	/**
	 * Returns an HTML string of the pictures for each chapter
	 * @param picture_files 
	 * 				an array of files that can be any file type
	 * @param index
	 * 				an integer indicating the current file to be looked at
	 * @return
	 * 		an HTML string of the image source
	 */
	public String pictures_to_html(File[] picture_files, int index) {
		String html;
		if (index < picture_files.length) {
			String file_name = picture_files[index].toString();
			
			//check if file is an image file
			if (!file_name.toString().endsWith("jpg") && !file_name.endsWith(".png")) { 
				html = "";
			}
			else {
				html = "<img src = '" + picture_files[index] + "'>\n";
			}
			
			if (index == picture_files.length) {
				return html; 
			}
			return html + pictures_to_html(picture_files, index+1);
		}
		return "";
	}
}
