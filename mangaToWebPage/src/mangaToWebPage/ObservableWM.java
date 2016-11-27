package mangaToWebPage;

import java.util.ArrayList;

import javax.swing.JButton;
import javax.swing.JPanel;

/**(WM: WebManga)
 * ObservableWM is a JPanel and an abstract class that is similar to Observable but has less methods
 * and is a JPanel. ObservableWM role is to allow its child have two parents.
 * @author zakuarbor
 *
 */
public abstract class ObservableWM extends JPanel {
	ArrayList<JPanel> observers =  new ArrayList<JPanel>(); //a list of observers observing the child
	
	/**
	 * Adds observer to the child (Observable)'s list of Observers
	 * @param o
	 * 		a JPanel that observes the child (Observable)
	 */
	public void addObservers(JPanel o) {
		observers.add(o); 
	}	
	
	/**
	 * Adds JButton to the Panel
	 * @param c
	 * 		a JButton to be added to the Panel
	 */
	public void add(JButton c) {
		((JPanel)this).add(c);
	}
	
	/**
	 * Notifies all observers that a change has been made
	 */
	public void notifyObservers() {
		for (JPanel o: observers) {
			((ObserverWM) o).updateComponentsWM(this);
		}
	}
}
