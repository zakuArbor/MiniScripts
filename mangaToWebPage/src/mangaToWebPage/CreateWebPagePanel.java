package mangaToWebPage;

import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import javax.swing.JButton;
import javax.swing.JOptionPane;
import javax.swing.JPanel;

public class CreateWebPagePanel extends JPanel implements ActionListener {
	private webGeneratorModel model;
	private View view;
	
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
