

// - - - - - - - - - - - - - - - - - - - - - - - 
// DATASYNTH V:1
// Nicholas Felton / Feltron.com
// - - - - - - - - - - - - - - - - - - - - - - - 

// Based on http://code.compartmental.net/minim/ugen_class_ugen.html

// TO DO
// - Output MIDI

// DONE
// - Make Object Oriented


// - - - - - - - - - - - - - - - - - - - - - - - 
// LIBRARIES
// - - - - - - - - - - - - - - - - - - - - - - - 
import ddf.minim.*;
import ddf.minim.ugens.*;

// - - - - - - - - - - - - - - - - - - - - - - - 
// VARIABLES
// - - - - - - - - - - - - - - - - - - - - - - - 
// Audio
Minim minim;
AudioOutput out;
Oscil wave;
int minFreq = 220;
int maxFreq = 660;

// Data
String sourceFile = "Southeastern.tsv";
//String sourceFile = "Barth.tsv";
Table table;
String[][] dataArray;

// Drawing
float hSegments;
float vSegments;
int iteration;
int margin = 10;

// AudioGraph
ArrayList<audioGraph> audioGraphs = new ArrayList<audioGraph>();

// - - - - - - - - - - - - - - - - - - - - - - - 
// SETUP
// - - - - - - - - - - - - - - - - - - - - - - - 
void setup() {
  size(1200, 800);
  smooth();
  intializeAudio();
  initializeGraphs();
  hSegments = float(width)/(dataArray.length-1);
}

// - - - - - - - - - - - - - - - - - - - - - - - 
// DRAW
// - - - - - - - - - - - - - - - - - - - - - - - 
void draw() {
  background(0);
  for (int i=0; i<audioGraphs.size (); i++) {
    iteration = i;
    audioGraphs.get(i).display();
  }

}



















