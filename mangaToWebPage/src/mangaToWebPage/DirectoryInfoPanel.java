package mangaToWebPage;

import javax.swing.JPanel;
import javax.swing.JTextArea;
import javax.swing.JTextField;

public class DirectoryInfoPanel extends JPanel {
	public DirectoryInfoPanel() {
		JTextArea infoTextbox = new JTextArea(2, 20);
		infoTextbox.setText(
				  "PATH\t: \n"
				+ "# of Chapters: ");
		this.add(infoTextbox);
	}
}
