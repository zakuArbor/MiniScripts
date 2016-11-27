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

public class View extends JFrame implements ActionListener {
	private FileChooserPanel fileChooserPanel;
	private CreateWebPagePanel createWebPagePanel;	
	private DirectoryInfoPanel directoryInfoPanel;
	private File target_directory;
	private webGeneratorModel model;
	
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
		// this.setSize(200,200);
		this.setVisible(true);
	}
	
	public void set_target_directory(File target) {
		this.target_directory = target;
	}
	
	public File get_target_directory() {
		return this.target_directory;
	}
	
	/*
	private JMenuBar createMenuBar() {
		JMenuBar menuBar = new JMenuBar();
		JMenu menu;
		JMenuItem menuItem;

		menu = new JMenu("File");

		// a group of JMenuItems
		menuItem = new JMenuItem("New");
		menuItem.addActionListener(this);
		menu.add(menuItem);

		menuItem = new JMenuItem("Open");
		menuItem.addActionListener(this);
		menu.add(menuItem);

		menuItem = new JMenuItem("Save");
		menuItem.addActionListener(this);
		menu.add(menuItem);

		menu.addSeparator();// -------------

		menuItem = new JMenuItem("Exit");
		menuItem.addActionListener(this);
		menu.add(menuItem);

		menuBar.add(menu);

		menu = new JMenu("Edit");

		// a group of JMenuItems
		menuItem = new JMenuItem("Cut");
		menuItem.addActionListener(this);
		menu.add(menuItem);

		menuItem = new JMenuItem("Copy");
		menuItem.addActionListener(this);
		menu.add(menuItem);

		menuItem = new JMenuItem("Paste");
		menuItem.addActionListener(this);
		menu.add(menuItem);

		menu.addSeparator();// -------------

		return menuBar;
	}*/
	

	@Override
	public void actionPerformed(ActionEvent e) {
		if (e.getActionCommand() == "select_directory") {
			
		}
	}
}
