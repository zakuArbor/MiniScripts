package mangaToWebPage;

import java.awt.BorderLayout;
import java.awt.Container;
import java.awt.GridBagConstraints;
import java.awt.GridBagLayout;
import java.awt.GridLayout;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.io.File;

import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JMenu;
import javax.swing.JMenuBar;
import javax.swing.JMenuItem;
import javax.swing.JPanel;

/**
 * View is a JFrame that is responsible for the program's GUI.
 * @author zakuarbor
 *
 */
public class View extends JFrame {
	private FileChooserPanel fileChooserPanel; //allows user to choose a directory
	private CreateWebPagePanel createWebPagePanel;	//where the generate button is created
	private DirectoryInfoPanel directoryInfoPanel; //where the Directory information is updated and created 
	private File target_directory; 
	private webGeneratorModel model; //responsible for creating webpages
	
	/**
	 * Create a View which is a JFrame which creates the program's GUI
	 * @param model
	 * 			a webPageGeneratorModel that is responsible in generating webPages
	 */
	public View(webGeneratorModel model) {
		super("Manga Webpage Creator");
		this.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		//this.setJMenuBar(createMenuBar());
		Container c=this.getContentPane();
		
		this.model = model;
		
		JPanel main = new JPanel();
		main.setLayout(new GridLayout(2, 1, 5, 5));
		
		this.fileChooserPanel = new FileChooserPanel(this);
		main.add(this.fileChooserPanel);
		
		this.directoryInfoPanel = new DirectoryInfoPanel(this);
		main.add(this.directoryInfoPanel);
		
		this.fileChooserPanel.addObservers(directoryInfoPanel);
		
		this.createWebPagePanel = new CreateWebPagePanel(this, model);
		main.add(this.createWebPagePanel);
		
		c.add(main, BorderLayout.CENTER);
				
		this.pack();
		this.setVisible(true);
	}
	
	/**
	 * A setter that sets the target directory
	 * @param target
	 * 			a File that is where the Manga Chapters are located
	 */
	public void set_target_directory(File target) {
		this.target_directory = target;
	}
	
	/**
	 * @return the target directory where the Manga chapters are located
	 */
	public File get_target_directory() {
		return this.target_directory;
	}	
}
