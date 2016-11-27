package mangaToWebPage;

import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.io.File;
import java.util.Observable;
import java.util.Observer;

import javax.swing.JButton;
import javax.swing.JFileChooser;
import javax.swing.JPanel;

public class FileChooserPanel extends ObservableWM implements ActionListener {
	View view;
	
	public FileChooserPanel(View view) {
		JButton fileButton = new JButton("Select Manga Folder");
		fileButton.addActionListener(this);
		add(fileButton);
		this.view = view;
	}

	@Override
	public void actionPerformed(ActionEvent e) {
		JFileChooser location = new JFileChooser();
	    location.setDialogTitle(" Select Manga Directory ");
	    location.setFileSelectionMode(JFileChooser.DIRECTORIES_ONLY);
	    location.setAcceptAllFileFilterUsed(false);
	    if (location.showOpenDialog(null) == JFileChooser.APPROVE_OPTION) {
	    	this.view.set_target_directory(location.getSelectedFile());
	    	this.notifyObservers();
	    }
	}

	
}
