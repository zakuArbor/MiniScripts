package mangaToWebPage;

public class webPageGUI {
	View view;
	webGeneratorModel model;
	public webPageGUI () {
		System.out.println("Hello World");
		model = new webGeneratorModel();
		view = new View(model);
		
		
	}
	
	public static void main(String[] args) {
		javax.swing.SwingUtilities.invokeLater(new Runnable() {
			public void run() {
				new webPageGUI();
			}
		});
	}

}
