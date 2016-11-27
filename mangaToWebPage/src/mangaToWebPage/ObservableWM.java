package mangaToWebPage;

import java.util.ArrayList;

import javax.swing.JButton;
import javax.swing.JPanel;

public abstract class ObservableWM extends JPanel {
	ArrayList<JPanel> observers =  new ArrayList<JPanel>();
	public void addObservers(JPanel o) {
		observers.add(o); 
	}	
	
	public void add(JButton c) {
		((JPanel)this).add(c);
	}
	public void notifyObservers() {
		for (JPanel o: observers) {
			((ObserverWM) o).updateComponentsWM(this);
		}
	}
}
