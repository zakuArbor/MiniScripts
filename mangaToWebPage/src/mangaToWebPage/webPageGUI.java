package mangaToWebPage;

public class webPageGUI {
	View view;
	
	public webPageGUI () {
		view = new View();
		
	}
	
	public static void main(String[] args) {
		javax.swing.SwingUtilities.invokeLater(new Runnable() {
			public void run() {
				new webPageGUI();
			}
		});
	}

}
