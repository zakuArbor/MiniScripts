package mangaToWebPage;

import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import javax.swing.JButton;
import javax.swing.JOptionPane;
import javax.swing.JPanel;

/**
 * CreateWebPagePanel is a JPanel that implements ActionListener to listen and respond to user interaction
 * with the Generate WebPage Button. 
 * @author zakuarbor
 *
 */
public class CreateWebPagePanel extends JPanel implements ActionListener {
	private webGeneratorModel model;
	private View view;
	
	/**
	 * Creates a CreateWebPagePanel that creates a button representing the action to generate webpages
	 * @param view
	 * 			a View that is responsible with the Program's Graphical user interface
	 * @param model
	 * 			a webPageGeneratorModel that is responsible in generating webPages
	 */
	public CreateWebPagePanel(View view, webGeneratorModel model) {
		this.model = model;
		this.view = view;
		JButton generateButton = new JButton(" Generate WebPage ");
		this.add(generateButton);
		generateButton.addActionListener(this);
	}
	
	@Override
	public void actionPerformed(ActionEvent e) {
		if (view.get_target_directory() != null) {
			model.createWebPage(view);
		}
		else {
			JOptionPane.showMessageDialog(this, "Target Directory is empty or not valid. Please select a valid path");
		}
	}
}
