package mangaToWebPage;

import java.io.File;

import javax.swing.JPanel;
import javax.swing.JTextArea;
import javax.swing.JTextField;

/**
 * DirectoryInfoPanel is a JPanel that implements ObserverWM. DirectoryInfoPanel has a JTextArea
 * where the information about the Directory is displayed.
 * @author zakuarbor
 *
 */
public class DirectoryInfoPanel extends JPanel implements ObserverWM {
	String path = "PATH\t:";
	String chapters = "# of Chapters: ";
	private View view;
	private JTextArea infoTextbox;
	
	/**
	 * Creates a DirectroyInfoPanel which is responsible in creating a text area 
	 * @param view
	 */
	public DirectoryInfoPanel(View view) {
		infoTextbox = new JTextArea(2, 30);
		infoTextbox.setText(
				  "PATH\t: \n"
				+ "# of Chapters: ");
		this.add(infoTextbox);
		this.view = view;
	}

	@Override
	public void updateComponentsWM(ObservableWM o) {
		String temp_path_name = "" + view.get_target_directory();
		if (temp_path_name.length() > 30) {
			temp_path_name = "..." + temp_path_name.substring(temp_path_name.length()-35);
		}
		String temp_path = path + temp_path_name + "\n";
		int numberOfChapters = 0; //number of folders in the path
		File listDir[] = view.get_target_directory().listFiles();
		if (listDir != null) {
			for (int i = 0; i < listDir.length; i++) {
			    if (listDir[i].isDirectory()) {
			            numberOfChapters++;
			        }
			}
		}
		String temp_chapters = chapters + numberOfChapters;
		infoTextbox.setText(temp_path + temp_chapters);
	}
}
